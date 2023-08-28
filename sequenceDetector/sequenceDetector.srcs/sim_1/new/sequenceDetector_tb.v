`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Archit Sharma
// 
// Create Date: 06/14/2023 03:27:47 PM
// Design Name: 
// Module Name: sequenceDetector_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: SEQUENCE DETECTOR : 11011 - OVERLAPPING CASE : MEALY FSM
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sequenceDetector_tb;

    reg clk_design;
    reg rst;
    reg sequence_in;
    wire fsm_detector_out;
    parameter time clk_period = 40;
    parameter integer sequenceSize = 10;
    
    reg [sequenceSize - 1:0] testSequence = 10'b1010110001;
    
    seqFSM sequenceFSM(clk_design, rst, sequence_in, fsm_detector_out);
    
    initial begin
        
        forever begin
            
            clk_design = 0;
            #(clk_period / 2);
            clk_design = 1;
            #(clk_period / 2);
            
        end
    
    end

    integer i;

    initial begin

        rst = 1;
        #clk_period;
        rst = 0;
        #clk_period;


        for (i = 0; i < sequenceSize; i = i + 1) begin

            sequence_in = testSequence[i];
            #clk_period;
            
        end

        $finish;

    end

endmodule
