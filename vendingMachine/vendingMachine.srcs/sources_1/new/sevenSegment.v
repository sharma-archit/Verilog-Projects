`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/17/2023 03:36:00 PM
// Design Name: 
// Module Name: sevenSegment
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


module sevenSegment(
    input wire clk,
    input wire [7:0] val,
    output reg anode,
    output reg [6:0] segLines
    );

    wire clk_slow;
    reg [6:0] highvalue, lowvalue;

    clkDivider #(.divider(62500000)) clockDivider(
        .clk_in(clk),
        .clk_out(clk_slow)
    );

    always@(*) begin


        anode = clk_slow;

        case (val[3:0])

            4'b0000: lowvalue = 7'b0111111;
            4'b0001: lowvalue = 7'b0000110;
            4'b0010: lowvalue = 7'b1011011;
            4'b0011: lowvalue = 7'b1001111;
            4'b0100: lowvalue = 7'b1100110;
            4'b0101: lowvalue = 7'b1101101;
            4'b0110: lowvalue = 7'b1111101;
            4'b0111: lowvalue = 7'b0000111;
            4'b1000: lowvalue = 7'b1111111;
            4'b1001: lowvalue = 7'b1101111;
            4'b1010: lowvalue = 7'b1110111;
            4'b1011: lowvalue = 7'b1111100;
            4'b1100: lowvalue = 7'b0111001;
            4'b1101: lowvalue = 7'b1011110;
            4'b1110: lowvalue = 7'b1111001;
            4'b1111: lowvalue = 7'b1110001;
            default: lowvalue = 7'b1000000;

        endcase

        case (val[7:4])

            4'b0000: highvalue = 7'b0111111;
            4'b0001: highvalue = 7'b0000110;
            4'b0010: highvalue = 7'b1011011;
            4'b0011: highvalue = 7'b1001111;
            4'b0100: highvalue = 7'b1100110;
            4'b0101: highvalue = 7'b1101101;
            4'b0110: highvalue = 7'b1111101;
            4'b0111: highvalue = 7'b0000111;
            4'b1000: highvalue = 7'b1111111;
            4'b1001: highvalue = 7'b1101111;
            4'b1010: highvalue = 7'b1110111;
            4'b1011: highvalue = 7'b1111100;
            4'b1100: highvalue = 7'b0111001;
            4'b1101: highvalue = 7'b1011110;
            4'b1110: highvalue = 7'b1111001;
            4'b1111: highvalue = 7'b1110001;
            default: highvalue = 7'b1000000;

        endcase

        case (clk_slow)

        1'b0: segLines = highvalue;
        1'b1: segLines = lowvalue;
        default: segLines = 7'bxxxxxxx;

        endcase

    end

endmodule