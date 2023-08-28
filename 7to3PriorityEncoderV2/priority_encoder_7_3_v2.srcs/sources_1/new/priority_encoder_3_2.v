`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Archit Sharma
// 
// Create Date: 04/05/2023 07:03:14 PM
// Design Name: 
// Module Name: priority_encoder_7_3
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


module priority_encoder_3_2(
    input [2:0] priority_in,
    output [1:0] priority_out
    );

assign priority_out[1] = priority_in[1] | priority_in[2];
assign priority_out[0] = (priority_in[0] & ~priority_in[1]) | priority_in[2];

endmodule
