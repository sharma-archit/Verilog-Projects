`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2023 02:05:13 PM
// Design Name: 
// Module Name: priority_encoder_tb
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

module priority_encoder_tb();

    reg [2:0] p_in = "000";
    wire [1:0] p_out;

    priority_encoder dut(p_in, p_out);

    initial begin
    
    p_in = 3'b000;
    #40;
    p_in = 3'b001;
    #40;
    p_in = 3'b010;
    #40;
    p_in = 3'b011;
    #40;
    p_in = 3'b100;
    #40;
    p_in = 3'b101;
    #40;
    p_in = 3'b110;
    #40;
    p_in = 3'b111;
    #40;
    
    $finish;

    end

endmodule
