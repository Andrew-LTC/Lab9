`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2021 09:16:00 PM
// Design Name: 
// Module Name: Vending_Machine_test
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


module Vending_Machine_test(
    input CLK100MHZ, resetButton,
    input c5Button, c10Button, c25Button, item_taken_Button,
    output [7:0] AN,
    output DP,
    output [6:0] SEG,
    output [2:0] LED,
    output red_LED, green_LED
    );
    
    //button outputs
    wire reset_n, c5, c10, c25, item_taken;
    
    //buttons
    button Reset (
        .clk(CLK100MHZ),
        .reset_n(~reset_n),
        .noisy(resetButton),
        .n_edge(reset_n)
    );
    button C5 (
        .clk(CLK100MHZ),
        .reset_n(~reset_n),
        .noisy(c5Button),
        .n_edge(c5)
    );
    button C10 (
        .clk(CLK100MHZ),
        .reset_n(~reset_n),
        .noisy(c10Button),
        .n_edge(c10)
    );
    button C25 (
        .clk(CLK100MHZ),
        .reset_n(~reset_n),
        .noisy(c25Button),
        .n_edge(c25)
    );
    button IT (
        .clk(CLK100MHZ),
        .reset_n(~reset_n),
        .noisy(item_taken_Button),
        .n_edge(item_taken)
    );
    
    //Test
    Vending_Machine VM (
        .CLK100MHZ(CLK100MHZ),
        .reset_n(~reset_n),
        .c5(c5),
        .c10(c10),
        .c25(c25),
        .item_taken(item_taken),
        .AN(AN),
        .DP(DP),
        .SEG(SEG),
        .LED(LED),
        .red_LED(red_LED),
        .green_LED(green_LED)
    );
endmodule
