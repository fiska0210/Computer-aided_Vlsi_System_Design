module fifo (data_i, write_i, read_i, full_o, empty_o, data_o, clk, rst_n,counter,counter_read,counter_write);
parameter DWIDTH = 8, FDEPTH = 5;

input wire [DWIDTH-1:0] data_i;
input wire write_i, read_i;
output wire full_o, empty_o;
output reg [DWIDTH-1:0] data_o;
input wire clk, rst_n;

// wire empty,full;
reg [DWIDTH-1:0] mem [FDEPTH-1:0]; // your fifo


output reg [2:0] counter_write,counter_read;
output reg [2:0] counter;



assign full_o = (counter == 3'd4)?1:0;
assign empty_o = (counter == 3'd0)?1:0;


// should consider the condition of (write_i && read_i), (write_i), (read_i) 
always@(*) begin
    if(!rst_n)
    begin
        mem[0] = 0;
        mem[1] = 0;
        mem[2] = 0;
        mem[3] = 0;
        mem[4] = 0;
    end
    else
    begin
        if (write_i == 1 && read_i == 0)
        begin
            mem[counter_write] = data_i;
        end
        else if (write_i == 0 && read_i == 1)
        begin
            data_o = mem[counter_read];
        end
        else if (write_i == 1 && read_i == 1)
        begin
            if(counter == 3'd0)
            begin
                data_o = data_i;
            end
            else
            begin
                data_o = mem[counter_read];
                mem[counter_write] = data_i;
            end
        end
    end
end

always @(posedge clk, negedge rst_n) begin
    if (!rst_n)
    begin
        counter <= 3'd0;
        counter_read <= 3'd0;
        counter_write <= 3'd0;
    end
    else
    begin

        if (write_i == 0 && read_i == 0) 
        begin
            counter <= counter;
        end
        else if (write_i == 1 && read_i == 0)
        begin
            counter_write <= (counter_write == 3'd4)?0:counter_write+3'd1;
            counter <= counter + 3'd1;
        end
        else if (write_i == 0 && read_i == 1)
        begin
            counter_read <= (counter_read == 3'd4)?0:counter_read+3'd1;
            counter <= counter - 3'd1;
        end
        else if (write_i == 1 && read_i == 1)
        begin
            counter_write <= (counter_write == 3'd4)?0:counter_write+3'd1;
            counter_read <= (counter_read == 3'd4)?0:counter_read+3'd1;
        end
        else
        begin
            counter <= counter;
            counter_read <= counter_read;
            counter_write <= counter_write;
        end
    end

end
endmodule
