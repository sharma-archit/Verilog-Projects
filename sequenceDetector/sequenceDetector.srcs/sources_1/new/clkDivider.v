`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Archit Sharma
// 
// Create Date: 04/12/2023 12:45:58 PM
// Design Name: 
// Module Name: seqFSM
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


module clkDivider(
    input wire clk_in,
    output reg clk_out
    );
    
    reg clock_out = 0;
    integer count = 1;
    
    always @(posedge clk_in) begin
    if (clk_in == 1) begin
        count = count + 1;
        if (count == 250000000) begin
            clock_out = ~clock_out;
            count = 1;
        end
    end
    
    clk_out = clock_out;
    
    end
    
endmodule
