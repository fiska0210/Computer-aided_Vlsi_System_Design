`timescale 1ns/10ps

module LEDDC( DCK, DAI, DEN, GCK, Vsync, mode, rst, OUT);
// IO declaration
input             DCK;
input             DAI;
input             DEN;
input             GCK;
input             Vsync;
input             mode;
input             rst; 
output reg [15:0] OUT;

// DCK
// input register
reg DEN_reg;
wire DEN_fall;

reg [9:0] d_addr_cs, d_addr_ns;
wire cur_write;
wire write_en0_n, write_en1_n;
reg [15:0] d_data;

// GCK
localparam IDLE = 3'd0, PWM_30 = 3'd1, PWM_60 = 3'd2, SOLVE_UNIT = 3'd3, SLEEP = 3'd4, SLEEP1 = 3'd5, SLEEP2 = 3'd6, SLEEP3 = 3'd7;
reg [2:0] cur_state, next_state;

// input register
reg mode_reg;
// reg Vsync_reg;

reg [4:0] scan_idx_cs, scan_idx_ns; // 0~31
wire [4:0] read_idx_ns;
wire read_en0_n, read_en1_n;
wire next_read;
reg cur_read;

wire [8:0] tmp_addr_ns;
reg [9:0] g_addr_ns;

reg [3:0] cur_scanline[0:15], next_scanline[0:15];
reg [15:0] counter_cs, counter_ns;
reg [3:0] counter_shift;
reg [1:0] shift_cs, shift_ns;
reg [1:0] ram_addr_mode_cs, ram_addr_mode_ns;
wire [3:0] pixel_idx_ns;
reg is_last;
reg round_60fps_cs, round_60fps_ns;
wire img_end, img_last_ns;
reg [4:0] scanline_cnt_cs, scanline_cnt_ns;
integer i;
wire [15:0] g_data0, g_data1, g_data;
reg [3:0] shift_g_data;

reg [15:0] out_comp;
genvar j;
//////////////////////////////////////////////////////DCK//////////////////////////////////////////////////////
// data collector
// register part: slow
always@(posedge DCK or posedge rst) begin
	if(rst) begin
		d_addr_cs <= 0;
		DEN_reg <= 0;
	end else begin
		d_addr_cs <= d_addr_ns;
		DEN_reg <= DEN;
	end
end
assign DEN_fall = (!DEN) && DEN_reg;

always@* begin
	if(!DEN_fall)
		d_addr_ns = d_addr_cs;
	else if( d_addr_cs==10'h2ff ) // ('d768) - 1
		d_addr_ns = 10'd0;
	else
		d_addr_ns = d_addr_cs + 10'd1;
end
assign cur_write = d_addr_cs[9];

always@(posedge DCK) begin
	if(DEN)
		d_data <= {DAI, d_data[15:1]}; // shift register
end

// enable write signal ( low-active )
assign write_en0_n = ~(DEN_fall && !cur_write); // detect first cycle when DEN pulls down, and current ram_idx = 0
assign write_en1_n = ~(DEN_fall && cur_write); // detect first cycle when DEN pulls down, and current ram_idx = 1

// FIFO
// define B for DCK
// define A for GCK
sram_512x16 inst_sram_0(
   .QA(g_data0),
   .AA(g_addr_ns[8:0]),
   .CLKA(GCK),
   .CENA(read_en0_n),
   .AB(d_addr_cs[8:0]),
   .DB(d_data),
   .CLKB(DCK),
   .CENB(write_en0_n) // low-enable
);

sram_256x16 inst_sram_1(
   .QA(g_data1),
   .AA(g_addr_ns[7:0]),
   .CLKA(GCK),
   .CENA(read_en1_n),
   .AB(d_addr_cs[7:0]),
   .DB(d_data),
   .CLKB(DCK),
   .CENB(write_en1_n) // low-enable
);
//////////////////////////////////////////////////////GCK//////////////////////////////////////////////////////

// register part: fast
always@(posedge GCK or posedge rst) begin
	if(rst) begin
		cur_state <= IDLE;
		counter_cs <= 0;
		scan_idx_cs <= 5'b0; // first round load sram1
		shift_cs <= 2'h3;
		ram_addr_mode_cs <= 2'h2;
		round_60fps_cs <= 0;
		// Vsync_reg <= 0;
		scanline_cnt_cs <= 5'd0;
	end else begin
		// mode_reg <= mode;
		cur_state <= next_state;
		counter_cs <= counter_ns;
		scan_idx_cs <= scan_idx_ns; // first load second_scanline;
		shift_cs <= shift_ns;
		ram_addr_mode_cs <= ram_addr_mode_ns;
		round_60fps_cs <= round_60fps_ns;
		cur_read <= next_read;
		// Vsync_reg <= Vsync;
		scanline_cnt_cs <= scanline_cnt_ns;
	end
end
assign g_data = (cur_read)?g_data1:g_data0;

assign next_read = g_addr_ns[9];

// assign pixel_idx_ns = counter_ns[3:0];
assign read_idx_ns = scan_idx_ns + ((shift_ns==2'h0)?5'd1:5'd0); // if 3rd shift, read nextscanline, 5-bit: scan_idx_ns
assign tmp_addr_ns = {read_idx_ns, scanline_cnt_ns[3:0]}; // 9 bit
always@* begin
	mode_reg = mode;
	g_addr_ns[7:0] = tmp_addr_ns[7:0];
	case(ram_addr_mode_ns)
		2'h0: begin g_addr_ns[9:8] = tmp_addr_ns[8]?2'h1:2'h0; end
		2'h1: begin g_addr_ns[9:8] = tmp_addr_ns[8]?2'h0:2'h2; end
		2'h2: begin g_addr_ns[9:8] = tmp_addr_ns[8]?2'h2:2'h1; end
		default: begin g_addr_ns[9:8] = 2'hx; end
	endcase
end
assign read_en0_n = ~( (scanline_cnt_ns!=5'd16) && !next_read ); // read every first 16 cycle
assign read_en1_n = ~( (scanline_cnt_ns!=5'd16) &&  next_read ); // read every first 16 cycle

assign img_end = (cur_state==SLEEP) && (scan_idx_cs==5'd31);

always@* begin
	if(mode_reg && img_end)
		round_60fps_ns = !round_60fps_cs;
	else
		round_60fps_ns = round_60fps_cs;
end

assign img_last_ns = (shift_cs==2'd1 && is_last) && (scan_idx_cs==5'd31);
always@* begin
	if( img_last_ns && (round_60fps_cs || !mode_reg) ) begin // 60fps round1 last scanline or 30fps last scanline
		if(ram_addr_mode_cs==2'h2)
			ram_addr_mode_ns = 2'h0;
		else
			ram_addr_mode_ns = ram_addr_mode_cs + 2'h1;
	end
	else
		ram_addr_mode_ns = ram_addr_mode_cs;
end

always@* begin
	if( cur_state==SLEEP )
		scan_idx_ns = scan_idx_cs + 5'd1;
	else
		scan_idx_ns = scan_idx_cs;
end

// FSM
always@* begin
	case(cur_state)
		IDLE: begin
			if(Vsync) begin
				if( !mode_reg ) // 30fps
					next_state = PWM_30;
				else
					next_state = SOLVE_UNIT;
			end 
			else
				next_state = IDLE;
		end
		PWM_30: begin
			if( shift_cs == 2'd0 && is_last )
				next_state = SOLVE_UNIT;
			else
				next_state = PWM_30;
		end
		PWM_60: begin
			if( shift_cs == 2'd0 && is_last )
				next_state = SLEEP;
			else
				next_state = PWM_60;
		end
		SOLVE_UNIT: begin
			if(!mode_reg)
				next_state = SLEEP;
			else
				next_state = PWM_60;
		end
		SLEEP: begin
			next_state = SLEEP1;
		end
		SLEEP1: begin
			next_state = SLEEP2;
		end
		SLEEP2: begin
			next_state = SLEEP3;
		end
		SLEEP3: begin
			next_state = IDLE;
		end
	endcase
end
// counter_ns
always@* begin
	case(next_state)
		PWM_60, PWM_30: begin 
			if(is_last)
				counter_ns = 16'd0;
			else
				counter_ns = counter_cs + 16'd1;
		end
		default: begin counter_ns = 16'd0; end
	endcase
end// MSB first 5 bit: cur_scanline, LSB last 4 bit: counter first 4 bit;

// is_last
always@* begin
	if(!mode_reg)
		case(shift_cs)
			2'd0: begin is_last = (counter_cs==16'he); end // count 15 cycle
			2'd1: begin is_last = (counter_cs==16'hef); end // count 240 cycle
			2'd2: begin is_last = (counter_cs==16'heff); end // count 3840 cycle
			2'd3: begin is_last = (counter_cs==16'hefff); end
		endcase
	else
		case(shift_cs)
			2'd0: begin is_last = (counter_cs==16'he); end // count 7 cycle
			2'd1: begin is_last = (counter_cs==16'hef); end // count 120 cycle
			2'd2: begin is_last = (counter_cs==16'heff); end // count 1920 cycle
			2'd3: begin is_last = (counter_cs==16'h6fff); end// count 30720 cycle
		endcase
end

always@* begin
	if(is_last&&shift_cs!=2'd0 || cur_state == SLEEP)
		shift_ns = shift_cs - 2'd1;
	else
		shift_ns = shift_cs;
end
// shift_g_data
always@* begin
	if(!mode_reg)
		case(shift_cs) // read next data
			2'd0: begin shift_g_data = g_data[15:12]; end
			2'd1: begin shift_g_data = g_data[3:0]; end
			2'd2: begin shift_g_data = g_data[7:4]; end
			2'd3: begin shift_g_data = g_data[11:8]; end
		endcase
	else
		case(shift_cs) // read next data
			2'd0: begin shift_g_data = {g_data[0], g_data[15:13]}; end
			2'd1: begin shift_g_data = g_data[4:1]; end
			2'd2: begin shift_g_data = g_data[8:5]; end
			2'd3: begin shift_g_data = g_data[12:9]; end
		endcase
end

always@* begin
	if(is_last && shift_cs != 2'd0 || cur_state == IDLE )
		scanline_cnt_ns = 0;
	else if(scanline_cnt_cs != 5'd16)
		scanline_cnt_ns = scanline_cnt_cs + 5'd1;
	else
		scanline_cnt_ns = scanline_cnt_cs;
end

// next_scanline  
always@(posedge GCK) begin
	if( scanline_cnt_cs != 5'd16 ) begin
		next_scanline[15] <= shift_g_data;
		for(i=0;i<=14;i=i+1)
			next_scanline[i] <= next_scanline[i+1];
	end
end


// cur_scanline
always@(posedge GCK) begin
	if(is_last && shift_cs != 2'd0 || cur_state==SLEEP1) begin
		for(i=0;i<=15;i=i+1)
			cur_scanline[i] <= next_scanline[i];
	end
end

always@(posedge GCK) begin
	case(shift_ns)
		2'd0: begin counter_shift <= counter_ns[3:0]; end
		2'd1: begin counter_shift <= counter_ns[7:4]; end
		2'd2: begin counter_shift <= counter_ns[11:8]; end
		2'd3: begin 
			if(!mode_reg)
				counter_shift <= counter_ns[15:12];
			else					
				counter_shift <= counter_ns[14:12];
		end
	endcase
end

// OUT
always@* begin
	if( mode_reg&&next_state==SOLVE_UNIT || !mode_reg&&cur_state==SOLVE_UNIT )
		for(i=0;i<16;i=i+1)
			OUT[i] = mode_reg && (!round_60fps_cs) && cur_scanline[i][3]; // 60fps round0 special case => 8000
	else begin // 1~32767/65535
		for(i=0;i<16;i=i+1)
			OUT[i] = ( counter_shift < {((mode_reg && shift_cs==2'd3)?1'd0:cur_scanline[i][3]),cur_scanline[i][2:0]} );
	end
end

endmodule
