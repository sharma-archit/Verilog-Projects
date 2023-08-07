`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2023 06:26:50 PM
// Design Name: 
// Module Name: vendingMachine
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


module vendingMachine(
    input wire clk,
    input wire reset,
    input wire itemSel,              // sel=0 for phone case (10 $), sel=1 for earbuds (15 $)
    input wire [2:0] coinsIn,        // "000" - 0$, "001" - 5$, "010" - 10$, "011" - 20$ and "100" - 50$
    output reg [2:0] changeOut,
    output wire [6:0] displaySum,    // display the current sum of inserted money on the seven segment
    output wire selectSegment,
    output reg phoneCase,
    output reg earbuds
    );

    wire clkO;
    parameter sum0 = 0, sum5 = 1, sum10 = 2, sum15 = 3, sum20 = 4, sum25 = 5, sum30 = 6, sum50 = 7, sum55 = 8, sum60 = 9, dispense = 10;
    integer presentState, nextState;
    reg [7:0] twoSegmentSignal;
    reg [2:0] multipleBills = 3'b000;

    clkDivider clockDivider(
        .clk_in(clk),
        .clk_out(clkO)
    );

    sevenSegment svnSegment(
        .clk(clk),
        .val(twoSegmentSignal),
        .anode(selectSegment),
        .segLines(displaySum)
    );

    always @(clk, reset) begin
        
        if (reset == 1'b1) begin
            presentState = sum0;
        end else if (clk) begin
            presentState = nextState;
        end
    end

    always @(presentState, coinsIn, itemSel) begin
        
        case (presentState)

        sum0: begin
            phoneCase = 1'b0;
            earbuds = 1'b0;
            changeOut = 3'b000;
            multipleBills = 3'b000;

            twoSegmentSignal = 8'b00000000;

            if (coinsIn == 3'b000) begin
                nextState = sum0;
            end else if (coinsIn == 3'b001) begin
                nextState = sum5;
            end else if (coinsIn == 3'b010) begin
                nextState = sum10;
            end else if (coinsIn == 3'b011) begin
                nextState = sum20;
            end else if (coinsIn == 3'b100) begin
                nextState = sum50;
            end
        end

        sum5: begin
            phoneCase = 1'b0;
            earbuds = 1'b0;

            twoSegmentSignal = 8'b00000101;

            if (coinsIn == 3'b000) begin
                if (multipleBills == 3'b001) begin
                    changeOut = 3'b001;
                    multipleBills = 3'b000;
                    nextState = dispense;
                end else begin
                    changeOut = 3'b000;
                    multipleBills = 3'b000;
                    nextState = sum5;
                end
            end else if (coinsIn == 3'b001) begin
                nextState = sum10;
            end else if (coinsIn == 3'b010) begin
                nextState = sum15;
            end else if (coinsIn == 3'b011) begin
                nextState = sum25;
            end else if (coinsIn == 3'b100) begin
                nextState = sum55;
            end
        end

        sum10: begin
            phoneCase = 1'b0;
            earbuds = 1'b0;

            twoSegmentSignal = 8'b00010000;

            if (coinsIn == 3'b000) begin
                if (multipleBills == 3'b010) begin
                    changeOut = 3'b010;
                    multipleBills = 3'b001;
                    nextState = sum5;
                end else if (multipleBills == 3'b011) begin
                    changeOut = 3'b011;
                    multipleBills = 3'b001;
                    nextState = sum5;
                end else if (itemSel == 1'b0) begin
                    changeOut = 3'b000;
                    multipleBills = 3'b000;
                    nextState = dispense;
                end else begin
                    changeOut = 3'b000;
                    multipleBills = 3'b000;
                    nextState = sum10;
                end
            end else if (coinsIn == 3'b001) begin
                nextState = sum15;
            end else if (coinsIn == 3'b010) begin
                nextState = sum20;
            end else if (coinsIn == 3'b011) begin
                nextState = sum30;
            end else if (coinsIn == 3'b100) begin
                nextState = sum60;
            end
        end

        sum15: begin
            phoneCase = 1'b0;
            earbuds = 1'b0;

            twoSegmentSignal = 8'b00010101;

            if (coinsIn == 3'b000) begin
                if (itemSel == 1'b0) begin
                    changeOut = 3'b001;
                end else begin
                    changeOut = 3'b000;
                end
                multipleBills = 3'b000;
                nextState = dispense;
            end else if (coinsIn == 3'b001) begin
                nextState = sum20;
            end else if (coinsIn == 3'b010) begin
                nextState = sum25;
            end
        end

        sum20: begin
            phoneCase = 1'b0;
            earbuds = 1'b0;

            twoSegmentSignal = 8'b00100000;

            if (coinsIn == 3'b000) begin
                if ((itemSel == 1'b0 | itemSel == 1'b1) & multipleBills == 3'b011) begin
                    changeOut = 3'b011;
                    multipleBills = 3'b001;
                    nextState = sum5;
                end else if (itemSel == 1'b0 & multipleBills == 3'b001) begin
                    changeOut = 3'b011;
                    multipleBills = 3'b000;
                    nextState = dispense;
                end else if (itemSel == 1'b1 & multipleBills == 3'b001) begin
                    changeOut = 3'b011;
                    multipleBills = 3'b000;
                    nextState = dispense;
                end else if (itemSel == 1'b0 & multipleBills == 3'b000) begin
                    changeOut = 3'b010;
                    nextState = dispense;
                end else if (itemSel == 1'b1 & multipleBills == 3'b000) begin
                    changeOut = 3'b001;
                    nextState = dispense;
                end
            end else if (coinsIn == 3'b001) begin
                nextState = sum25;
            end else if (coinsIn == 3'b010) begin
                nextState = sum30;
            end
        end

        sum25: begin
            phoneCase = 1'b0;
            earbuds = 1'b0;

            twoSegmentSignal = 8'b00100101;

            if (coinsIn == 3'b000) begin
                if (itemSel == 1'b0) begin
                    changeOut = 3'b010;
                    multipleBills = 3'b001;
                    nextState = sum5;
                end else begin
                    changeOut = 3'b010;
                    nextState = dispense;
                end
            end else if (coinsIn == 3'b001) begin
                nextState = sum30;
            end
        end

        sum30: begin
            phoneCase = 1'b0;
            earbuds = 1'b0;

            twoSegmentSignal = 8'b00110000;

            if (coinsIn == 3'b000) begin
                if (itemSel == 1'b0) begin
                    changeOut = 3'b011;
                    multipleBills = 3'b000;
                    nextState = dispense;
                end else begin
                    changeOut = 3'b010;
                    multipleBills = 3'b001;
                    nextState = sum20;
                end
            end else if (coinsIn == 3'b011) begin
                nextState = sum50;
            end
        end

        sum50: begin
            phoneCase = 1'b0;
            earbuds = 1'b0;

            twoSegmentSignal = 8'b10100000;

            if (coinsIn == 3'b000) begin
                if (itemSel == 1'b0) begin
                    changeOut = 3'b011;
                    multipleBills = 3'b001;
                    nextState = sum20;
                end else begin
                    changeOut = 3'b001;
                    multipleBills = 3'b011;
                    nextState = sum30;
                end
            end else if (coinsIn == 3'b001) begin
                nextState = sum55;
            end else if (coinsIn == 3'b010) begin
                nextState = sum60;
            end
        end

        sum55: begin
            phoneCase = 1'b0;
            earbuds = 1'b0;

            twoSegmentSignal = 8'b01010101;

            if (coinsIn == 3'b000) begin
                if (itemSel == 1'b0) begin
                    changeOut = 3'b011;
                    multipleBills = 3'b011;
                    nextState = sum20;
                end else begin
                    changeOut = 3'b011;
                    multipleBills = 3'b001;
                    nextState = sum20;
                end
            end else if (coinsIn == 3'b001) begin
                nextState = sum60;
            end
        end

        sum60: begin
            phoneCase = 1'b0;
            earbuds = 1'b0;

            twoSegmentSignal = 8'b01100000;

            if (coinsIn == 3'b000) begin
                if (itemSel == 1'b0) begin
                    changeOut = 3'b100;
                    multipleBills = 3'b000;
                    nextState = dispense;
                end else begin
                    changeOut = 3'b011;
                    multipleBills = 3'b011;
                    nextState = sum20;
                end
            end
        end

        dispense: begin
            changeOut = 3'b000;
            twoSegmentSignal = 8'b00000000;

            if (itemSel == 1'b0) begin
                phoneCase = 1'b1;
                earbuds = 1'b0;
            end else begin
                phoneCase = 1'b0;
                earbuds = 1'b1;
            end

            nextState = sum0;

        end
        endcase
    end
endmodule