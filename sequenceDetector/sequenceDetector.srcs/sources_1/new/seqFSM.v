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
// Description: SEQUENCE DETECTOR : 10X01 - OVERLAPPING CASE : MEALY FSM
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module seqFSM(
    input wire clk,
    input wire reset,
    input wire seq_in,
    output reg output_detect
    );
    
    wire clk_o;
    
    parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4, S5 = 5, S6 = 6, S7 = 7, S8 = 8;
    reg [2:0] state_reg, state_next;
    
    clkDivider clockDivider (
    .clk_in(clk),
    .clk_out(clk_o)
    );

    always @(posedge clk) begin
        if (reset == 1) begin
        state_reg = S0;
        end else begin
        state_reg = state_next;
        end
    end
    
    always @(*) begin
        case (state_reg)
            S0: begin
            if (seq_in == 0) begin
                state_next = S0;
                output_detect = 0;
            end else begin
                state_next = S1;
                output_detect = 0;
            end
            end
            
            S1: begin
            if (seq_in == 0) begin
                state_next = S2;
                output_detect = 0;            
            end else begin
                state_next = S1;
                output_detect = 0;
            end
            end
            
            S2: begin
            if (seq_in == 0) begin
                state_next = S3;
                output_detect = 0;            
            end else begin
                state_next = S6;
                output_detect = 0;
            end
            end
            
            S3: begin
            if (seq_in == 0) begin
                state_next = S4;
                output_detect = 0;            
            end else begin
                state_next = S1;
                output_detect = 0;
            end
            end
            
            S4: begin
            if (seq_in == 0) begin
                state_next = S0;
                output_detect = 0;            
            end else begin
                state_next = S5;
                output_detect = 1;
            end
            end
            
            S5: begin
            if (seq_in == 0) begin
                state_next = S2;
                output_detect = 0;            
            end else begin
                state_next = S1;
                output_detect = 0;
            end
            end
            
            S6: begin
            if (seq_in == 0) begin
                state_next = S7;
                output_detect = 0;            
            end else begin
                state_next = S1;
                output_detect = 0;
            end
            end
            
            S7: begin
            if (seq_in == 0) begin
                state_next = S3;
                output_detect = 0;            
            end else begin
                state_next = S8;
                output_detect = 1;
            end
            end
            
            S8: begin
            if (seq_in == 0) begin
                state_next = S7;
                output_detect = 0;            
            end else begin
                state_next = S1;
                output_detect = 0;
            end
            end
        endcase
        
    end
        
endmodule
