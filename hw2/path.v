module path(clk, rst_n, data1_i, data2_i, valid1_i, valid2_i, data_o, req_o, gnt_i, stop1_o, stop2_o, valid_o);

parameter DWIDTH = 8;
parameter FDEPTH = 5;
input clk;
input rst_n;
input [DWIDTH-1:0] data1_i;
input [DWIDTH-1:0] data2_i;
input valid1_i;
input valid2_i;
input gnt_i;
output req_o;
output stop1_o;
output stop2_o;
output reg [DWIDTH-1:0] data_o;
output reg valid_o;

wire [2:0] counter_read,counter_write;

wire [DWIDTH-1:0] fifo_o;
wire full, empty, valid_i, almost_full;
wire bypass;

wire read_i, write_i;

reg [DWIDTH-1:0] data_i;
reg master1,master2;

reg [3:0] counter_1,counter_2;

assign bypass = (empty && gnt_i && valid_i);
assign valid_i = (valid1_i || valid2_i); 
assign req_o = (valid_i || !empty); 
assign read_i = (gnt_i && !empty);  
assign write_i = (valid_i && !bypass); 

assign stop1_o = (full && !gnt_i)?1 :(master1)?0:1;
assign stop2_o = (full && !gnt_i)?1 :(master2)?0:1;

always@(*)
begin
    if (valid1_i  == 1)
        data_i = data1_i;
    else if (valid2_i == 1)
        data_i = data2_i;
end

always@(posedge clk, negedge rst_n)	
begin
    if (!rst_n) 
    begin
        data_o <= 0;
        valid_o <= 0;
	end 
    else 
    begin
        valid_o <= (read_i || bypass);

        if (bypass)
        begin
            if (valid1_i)
                data_o <= data1_i;
            if (valid2_i)
                data_o <= data2_i;
        end
        else
            data_o <= fifo_o;
    end
end

always@(posedge clk, negedge rst_n)	
begin
    if(!rst_n)
    begin
        counter_1 <= 4'd0;
        counter_2 <= 4'd0;
        master1 <= 1;
        master2 <= 0;
    end
    else
    begin    
        if (counter_1 == 4'd9 && valid1_i == 1)
        begin
            counter_1 <= 4'd0;
            master2 <= 1;
            master1 <= 0;
        end
        else if (counter_2 == 4'd9 && valid2_i == 1)
        begin
            counter_2 <= 4'd0;
            master1 <= 1;
            master2 <= 0;
        end
        else
        begin
            if (valid1_i == 1)
                counter_1 <= counter_1 + 4'd1;
            else if (valid2_i == 1)
                counter_2 <= counter_2 + 4'd1;
            else
            begin
                counter_1 <= counter_1;
                counter_2 <= counter_2;
            end
        end
	end
end

fifo fifo_inst (.data_i(data_i), .write_i(write_i), .read_i(read_i),
                .full_o(full), .empty_o(empty),
                .data_o(fifo_o), .clk(clk), .rst_n(rst_n));
endmodule
