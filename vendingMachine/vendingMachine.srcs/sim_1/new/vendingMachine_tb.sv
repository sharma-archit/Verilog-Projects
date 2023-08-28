`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Archit Sharma
// 
// Create Date: 06/15/2023 06:28:57 PM
// Design Name: 
// Module Name: vendingMachine_tb
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


module vendingMachine_tb;

    reg clk_tb;
    reg rst_tb;
    reg itemSelect_tb;
    reg [2:0] coinsIn_tb;
    wire [2:0] changeOut_tb;
    wire [6:0] sevenSeg_tb;
    wire phonecase_tb;
    wire earbuds_tb;

    const time clockPeriod = 40;

    vendingMachine vending_tb(
        .clk(clk_tb),
        .reset(rst_tb),
        .itemSel(itemSelect_tb),
        .coinsIn(coinsIn_tb),
        .changeOut(changeOut_tb),
        .displaySum(sevenSeg_tb),
        .phoneCase(phonecase_tb),
        .earbuds(earbuds_tb)
        );

        initial begin
            forever begin
                
                clk_tb = 1'b0;
                #(clockPeriod/2);
                clk_tb = 1'b1;
                #(clockPeriod/2);

            end
        end

        initial begin

            rst_tb <= 1'b1;
            itemSelect_tb <= 1'b0;
            coinsIn_tb <= 3'b000;
            @(posedge clk_tb);
            rst_tb <= 1'b0;
            @(posedge clk_tb);

            itemSelect_tb <= 1'b0;
            @(posedge clk_tb);
            coinsIn_tb <= 3'b100;
            @(posedge clk_tb);
            coinsIn_tb <= 3'b000;
            @(posedge clk_tb);
            coinsIn_tb <= 3'b000;

        end

        initial begin
        
        wait (phonecase_tb == 1'b1 | earbuds_tb == 1'b1);
        @(posedge clk_tb);
        $finish;
            
        end
endmodule
