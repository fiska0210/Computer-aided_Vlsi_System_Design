`timescale 1ns/10ps
module CLE ( clk, reset, rom_q, rom_a, sram_q, sram_a, sram_d, sram_wen, finish);
input         clk;
input         reset;
input  [7:0]  rom_q;
output reg [6:0]  rom_a;
input  [7:0]  sram_q;
output reg [9:0]  sram_a;
output reg [7:0]  sram_d;
output reg      sram_wen;
output reg       finish;


reg row2    [31:0];
reg [3:0]   color1  [31:0];
reg [3:0]   color2  [31:0];
reg [3:0]   table1  [15:0];
                    

reg [6:0]   counter_read; // from 4 to 31
reg [2:0]   counter_pixel; 
reg [1:0]   pixel_cal;
reg [9:0]   counter_cal;
reg [4:0]   counter_row;
reg read_from_rom;
reg en_read2;
reg set;
reg read_complete;
reg read;
reg [9:0]   round2;
//
reg [4:0]   colornow;

reg round1;

reg [3:0]   color;
wire [7:0]   data;

integer i ;

always@(posedge clk or posedge reset)
begin
    if (reset)
    begin
        counter_read <= 7'd4;
    end
    else
    begin
        if (!read_complete)
        begin
            rom_a <= counter_read;
            counter_read <= counter_read + 7'd1;
        end
        else
        begin
            counter_read <= counter_read;
            rom_a <= rom_a;
        end
    end
end

always@(posedge clk or posedge reset)
begin
    if (reset)
        read_from_rom <= 0;
    else
        read_from_rom <= (read)?1:0;
end

always@(posedge clk or posedge reset)
begin
    if (reset)
        read_complete <= 0;
    else
    begin
        if (counter_pixel == 3'd2)
            read_complete <= 1;
        else if (en_read2)
            read_complete <= 0;
        else
            read_complete <= read_complete;
    end

end
always@(posedge clk or posedge reset)
begin
    if (reset)
    begin
        for (i = 0; i < 32; i = i + 1)
        begin
            row2[i] <= 0;
        end
        counter_pixel <= 3'd5; 
        pixel_cal <= 2'd0;
    end
    else
    begin
        if (en_read2)
            counter_pixel <= 3'd5;
        else
        begin
            if (read_from_rom)
            begin
                if (counter_pixel == 3'd5)
                begin
                    counter_pixel <= counter_pixel - 3'd1;
                    pixel_cal <= 2'd3;
                end
                else
                begin
                    row2[{pixel_cal,3'b111}] <= rom_q[7];
                    row2[{pixel_cal,3'b110}] <= rom_q[6];
                    row2[{pixel_cal,3'b101}] <= rom_q[5];
                    row2[{pixel_cal,3'b100}] <= rom_q[4];
                    row2[{pixel_cal,3'b011}] <= rom_q[3];
                    row2[{pixel_cal,3'b010}] <= rom_q[2];
                    row2[{pixel_cal,3'b001}] <= rom_q[1];
                    row2[{pixel_cal,3'b000}] <= rom_q[0]; 
                    counter_pixel <= counter_pixel - 3'd1;
                    pixel_cal <= pixel_cal - 2'd1;
                end
            end
            else
            begin
                counter_pixel <= counter_pixel;
            end
        end
    end
end


always@(posedge clk or posedge reset)
begin
    if (reset)
        read <= 1;
    else
    begin
        if (counter_pixel == 3'd2)
            read <= 0;
        else if (counter_row == 5'd0 && read_complete)
            read <= 1;
        else
            read <= read;
    end
end

always@(posedge clk or posedge reset)
begin
    if (reset)
        en_read2 <= 0;
    else
    begin
        if (!round1 && counter_row == 5'd31 && read_complete) // x = 0
        begin
            en_read2 <= 0;
        end
        else if (!round1 && counter_row == 5'd31)
            en_read2 <= 0;
        else if (!round1 && counter_row == 5'd0 && read_complete) //x=31
        begin
            en_read2 <= 1;
        end
    end
end

always@(posedge clk or posedge reset)
begin
    if (reset)
    begin
        counter_cal <= 10'd0;
        counter_row <= 5'd31;
        color <= 2;
        set <= 0;
        round1 <= 0;

        for (i = 0; i < 32; i = i + 1)
        begin
            color1[i] <= 4'd0;
            color2[i] <= 4'd0;
        end
        for (i = 0; i < 16; i = i + 1)
            table1[i] <= 4'd0;
    end
    else
    begin
        if (set == 0 && !round1)
        begin
            if (counter_cal == 10'd31)
                set <= 1;
            else
                counter_cal <= counter_cal + 10'd1;
        end
        else if (!round1)
        begin
            if (counter_row == 5'd0 && read_complete)
            begin
                for (i = 0; i < 32; i = i + 1) //color2 shift to color2, clean color2
                begin
                    color1[i] <= color2[i];
                end
            end

            if (read_complete)
            begin
                counter_cal <= counter_cal + 10'd1;
                counter_row <= (counter_row == 5'd0)?5'd31:counter_row - 5'd1;

                if (row2[counter_row] == 1)
                begin
                    if (color2[counter_row+5'd1] != 0) //left
                    begin
                        color2[counter_row] <= color2[counter_row+5'd1];
                        colornow <= color2[counter_row+5'd1];
                    end
                    else if (color1[counter_row] != 0) //up
                    begin
                        color2[counter_row] <= color1[counter_row];
                        colornow <= color1[counter_row];
                    end
                    else if (color1[counter_row-5'd1] != 0) //right-up
                    begin
                        color2[counter_row] <= color1[counter_row-5'd1];
                        colornow <= color1[counter_row-5'd1];
                    end
                    else if (color1[counter_row+5'd1] != 0) //left-up
                    begin
                        color2[counter_row] <= color1[counter_row+5'd1];
                        colornow <= color1[counter_row+5'd1];
                    end
                    else //no neighbor been colored
                    begin
                        color2[counter_row] <= color;
                        colornow <= color;
                        color <= color + 1;
                    end

                end
                else
                begin
                    color2[counter_row] <= 0;
                    colornow <= 0;
                end
            end
            else 
            begin
                counter_cal <= counter_cal;
                counter_row <= counter_row;
            end
        end
        else
        begin
            counter_cal <= counter_cal;
            counter_row <= counter_row;
        end


        if (row2[counter_row] == 1)
        begin
            if (color2[counter_row+5'd1] != 0 && color1[counter_row] != 0 && color2[counter_row+5'd1] != color1[counter_row]) //up
            begin
                if (table1[color1[counter_row]] != 0)
                    table1[color2[counter_row+5'd1]] <= table1[color1[counter_row]];
                else
                    table1[color2[counter_row+5'd1]] <= color1[counter_row];
            end
            else if (color2[counter_row+5'd1] != 0 && color1[counter_row-5'd1] != 0 && color2[counter_row+5'd1] != color1[counter_row-5'd1]) //up right
            begin
                if (table1[color1[counter_row-5'd1]] != 0)
                    table1[color2[counter_row+5'd1]] <= table1[color1[counter_row-5'd1]];
                else
                    table1[color2[counter_row+5'd1]] <= color1[counter_row-5'd1];
            end
            else if (color1[counter_row+5'd1] != 0 && color1[counter_row-5'd1] != 0 && color1[counter_row+5'd1] != color1[counter_row-5'd1]) //up right
            begin
                if (table1[color1[counter_row-5'd1]] != 0)
                    table1[color1[counter_row+5'd1]] <= table1[color1[counter_row-5'd1]];
                else
                    table1[color1[counter_row+5'd1]] <= color1[counter_row+5'd1];
            end
        end
        table1[13] <= (counter_cal == 1023)?0:table1[13];
        round1 <= (counter_cal == 1023)?1:round1;
    end
end

always@(posedge clk or posedge reset)
begin
    if (reset)
    begin
        sram_wen <= 0; // CLE write to SRAM
        sram_a <= 0;
        sram_d <= 0;
        finish <= 0;
        round2 <= 31;
    end
    else
    begin
        if (round1)
        begin
            if (data != 0 && table1[data] != 0) //need to merge
            begin
                sram_wen <= 0;
                sram_d <= table1[data];
                sram_a <= round2 - 10'd2;
            end

            else if (!sram_wen)
            begin
                sram_wen <= 1;
                round2 <= round2 - 10'd1;
            end
            else if (sram_wen)
            begin
                round2 <= round2 + 10'd1;
                sram_a <= round2;
            end
            else
                round2 <= round2;
                
            if (round2 == 10'd1023)
                finish <= 1;
            else 
                finish <= 0;
        end
        else
        begin
            if (counter_cal < 32 || counter_cal == 1023)
            begin
                sram_a <= counter_cal;
                sram_d <= 0;
            end
            else
            begin
                sram_wen <= (counter_cal == 1023)?1:sram_wen;
                sram_a <= counter_cal;
                sram_d <= colornow;
            end
        end
    end
end



sram_1024x8_t13 u_sram(
                       .Q        (data    ), //read
                       .CLK      (clk       ),
                       .CEN      (1'b0      ),
                       .WEN      (sram_wen  ),
                       .A        (sram_a    ),
                       .D        (sram_d    ) //write
                     );       

endmodule
