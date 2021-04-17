`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2021 08:38:10 PM
// Design Name: 
// Module Name: Vending_Machine_tb
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


module Vending_Machine_tb(

    );
    reg clk, reset_n;
    reg c5,c10,c25,item_taken;
    wire [7:0] AN;
    wire DP;
    wire [6:0] SEG;
    wire [2:0] LED;
    wire red_LED, green_LED;
    
    Vending_Machine uut (
        .CLK100MHZ(clk),
        .reset_n(reset_n),
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
    
    localparam T = 10;
    always
    begin
        #(T/2);
        clk = 1'b0;
        #(T/2);
        clk = 1'b1;
    end
    
    initial
    begin
        reset_n = 1'b0;
        c5 = 0;
        c10 = 0;
        c25 = 0;
        item_taken = 0;
        #2
        reset_n = 1'b1;
        
        c5 = 0;
        c10 = 0;
        c25 = 0;
        item_taken = 0;
        #T
        c5 = 0;
        c10 = 0;
        c25 = 1;
        item_taken = 0;
        #T
        c5 = 0;
        c10 = 1;
        c25 = 0;
        item_taken = 0;
        #T
        c5 = 0;
        c10 = 0;
        c25 = 0;
        item_taken = 1;
        #T
        c5 = 0;
        c10 = 1;
        c25 = 0;
        item_taken = 0;
        #T
        c5 = 0;
        c10 = 1;
        c25 = 0;
        item_taken = 0;
        #T
        c5 = 0;
        c10 = 0;
        c25 = 1;
        item_taken = 0;
        #T
        c5 = 0;
        c10 = 0;
        c25 = 0;
        item_taken = 1;
        #T
        c5 = 1;
        c10 = 0;
        c25 = 0;
        item_taken = 1;
        #T
        c5 = 1;
        c10 = 0;
        c25 = 0;
        item_taken = 0;
        #T
        c5 = 0;
        c10 = 1;
        c25 = 0;
        item_taken = 0;
        #T
        c5 = 0;
        c10 = 1;
        c25 = 0;
        item_taken = 0;
        #T
        c5 = 0;
        c10 = 0;
        c25 = 0;
        item_taken = 1;
        #T
        $finish;
    end
endmodule
