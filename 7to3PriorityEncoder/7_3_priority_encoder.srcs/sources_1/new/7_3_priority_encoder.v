`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2023 11:19:43 AM
// Design Name: 
// Module Name: 7_3_priority_encoder
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


module priority_encoder_7_3(
    input [6:0] priority_in,
    output [2:0] priority_out
    );
    
    assign priority_out[2] = priority_in[6] | priority_in[5] | priority_in[4] | priority_in[3];
    assign priority_out[1] = priority_in[6] | priority_in[5] | (~priority_in[4] & ~priority_in[3] & priority_in[2]) | (~priority_in[4] & ~priority_in[3] & priority_in[1]);
    assign priority_out[0] = priority_in[6] | (~priority_in[5] & priority_in[4]) | (~priority_in[5] & ~priority_in[3] & priority_in[2]) | (~priority_in[5] & ~priority_in[3] & ~priority_in[1] & priority_in[0]);
    
endmodule
