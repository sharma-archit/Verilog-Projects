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


module priority_encoder_7_3(
    input [6:0] priority_in,
    output reg [2:0] priority_out
    );
    
    wire [1:0] priority_encoder_top;
    wire [1:0] priority_encoder_bottom;
    reg priority_selector;
    
    priority_encoder_3_2 priorityEncoderTop(priority_in[2:0], priority_encoder_top);
    priority_encoder_3_2 priorityEncoderBottom(priority_in[6:4], priority_encoder_bottom);
    
    always @* begin
    
        priority_selector = priority_in[6] | priority_in[5] | priority_in[4] | priority_in[3];
        priority_out[2] = priority_selector;
        
        if (priority_selector == 1'b0) begin
        
            priority_out[1:0] = priority_encoder_top;
        
        end else begin
        
            priority_out[1:0] = priority_encoder_bottom;
        
        end
    end
    
endmodule
