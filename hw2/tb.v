`timescale 1ns/10ps
`define CYCLE      5.00         	 // Modify your clock period here
`define End_CYCLE  10000            // Modify cycle times once your design need more cycle times!
`define PAT1        "./pattern1.dat" // Master1 output data   
`define PAT2        "./pattern2.dat" // Master2 output data
`define EXP        "./golden1.dat"   // Memory stored data (ground truth), is used to verified your designed
module tb;

parameter testdata = 60;
integer v1, v2, ans, error_num, delay;


//
reg clk, rst_n, valid1_i, valid2_i, gnt_i;
reg [7:0] data1_i;
reg [7:0] data2_i;
// 
wire req_o, stop1_o, stop2_o, valid_o;
wire [7:0] data_o;

//pattern and answer
reg [7:0] pattern1[0:29]; 
reg [7:0] pattern2[0:29];
reg [7:0] golden[0:59]; 


path dut(.clk(clk), .rst_n(rst_n), .data1_i(data1_i), .data2_i(data2_i), .valid1_i(valid1_i), .valid2_i(valid2_i),
         .data_o(data_o), .req_o(req_o), .gnt_i(gnt_i), .stop1_o(stop1_o), .stop2_o(stop2_o), .valid_o(valid_o));

initial begin //initial value
    clk = 0;
    rst_n = 0;
    valid1_i = 0;
    valid2_i = 0;
    gnt_i = 0;
    data1_i = 0;
    data2_i = 0;
    delay = 0; //gnt delay, open when = 1 
    // integer
    v1 = 0;
    v2 = 0;
    ans = 0;
    error_num = 0;
    $display("\n****************************** Start !!! ****************************\n");
    #10 rst_n = 1;
end


initial begin //print out waveform
    $fsdbDumpfile("path.fsdb");
	$fsdbDumpvars(0,tb,"+mda");
end

initial begin // read pattern 
	$readmemh(`PAT1, pattern1);
	$readmemh(`PAT2, pattern2);
	$readmemh(`EXP, golden);
end

always #(`CYCLE/2) clk = ~clk;

//valid data input
always@(negedge clk)
begin
    if (rst_n)
    begin
        if (stop1_o == 0) //give valid1
        begin
            //$display("v1 =%d", v1);
            if (v1 == 20)
            begin
                $display("\n************************* Test for valid1_i daley ***********************\n");
                valid1_i <= 0;
                data1_i <= 0;
                #10; // delay
                valid1_i <= 1;
                data1_i <= pattern1[v1];
                v1 <= v1+1;
                //$display("v1 =%d", v1);
            end
            else if (v1 > 20) // input data delay
            begin
                valid1_i <= 0;
                data1_i <= 0;
                #10; // delay
                valid1_i <= 1;
                data1_i <= pattern1[v1];
                v1 <= (v1 == 29)?v1:v1+1;
            end
            else
            begin
                valid1_i <= 1;
                data1_i <= pattern1[v1];
                v1 <= v1 + 1;
            end
            #1;
        end
        else
        begin
            valid1_i <= 0;
            data1_i <= 0;
            v1 <= v1;
        end
    end
end

always@(negedge clk)
begin
    if(rst_n)
    begin
        if (stop2_o == 0) //give valid2
        begin
            //display("v2 =%d", v2);
            if (v2 == 20)
            begin
                $display("\n************************* Test for valid2_i daley ***********************\n");
                valid2_i <= 0;
                data2_i <= 0;
                #10; // delay
                valid2_i <= 1;
                data2_i <= pattern2[v2];
                v2 <= v2+1;
                //$display("v2 =%d", v2);
            end
            else if (v2 > 20) // input data delay
            begin
                valid2_i <= 0;
                data2_i <= 0;
                #10; // delay
                valid2_i <= 1;
                data2_i <= pattern2[v2];
                v2 <= (v2 == 29)?v2:v2+1;
            end
            else
            begin
                valid2_i <= 1;
                data2_i <= pattern2[v2];
                v2 <= v2 + 1;
            end
            #1;
        end
        else
        begin
            valid2_i <= 0;
            data2_i <= 0;
            v2 <= v2;
        end
    end
end
//gnt
always@(negedge clk)
begin
    if(req_o)
    begin
        if (delay)
        begin
            gnt_i <= 0;
            #10;
        end
        gnt_i <= 1; 
    end
    else
        gnt_i <= 0;
end

//anser
always 
begin
    @(negedge clk);
    if (rst_n)
    begin
        if (valid_o)
        begin
            if (data_o != golden[ans])
            begin
                $display("The %d data is ERROR! ans(%h) != your ans(%h)", ans, golden[ans], data_o);
                error_num = error_num + 1;
            end
            ans = ans + 1;

            if (ans == 60) 
            begin
                $display("\n************************* Finish!!! ***********************\n");
                if (error_num != 0)
                begin
                    $display("\n==================================================\n");
                    $display("Your code has %d Errors QQ", error_num);
                    $display("\n==================================================\n");
                end
                else
                begin
                    $display("\n==================================================\n");
                    $display(" Congratulations!! Your Verilog Code is correct!!\n");
	                $display("==================================================\n");
                end
            end
        end
    end
end

initial begin
	#(`End_CYCLE) 
	$finish;
end
endmodule
