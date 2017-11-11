`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/10 21:13:23
// Design Name: 
// Module Name: inst_fetch_testbench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module inst_fetch_testbench;
    reg clk;
    reg rst;
    wire[31:0] inst;
    
    initial begin
        clk = 1'b0;
        forever #10 clk = ~clk;
    end
    
    initial begin
        rst = 1'b1;
        #195 rst = 1'b0;
        #1000 $stop;
    end
    
    inst_fetch inst_fetch_0(
        .clk(clk),
        .rst(rst),
        .inst_o(inst)
    );
endmodule
