`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2023 11:42:03 AM
// Design Name: 
// Module Name: 7_3_priority_encoder_tb
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


module priority_encoder_7_3_tb();

    reg [6:0] p_in;
    wire [2:0] p_out;

    priority_encoder_7_3 dut(p_in, p_out);

    integer i;

    initial begin

        p_in = 7'b0000000;
        #40;
        for (i = 1; i < 128; i= i+1) begin
    
            p_in = p_in + 1;
            #40;
        end

	$finish

    end

endmodule
