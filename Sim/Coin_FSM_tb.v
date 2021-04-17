`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2021 04:09:46 PM
// Design Name: 
// Module Name: Coin_FSM_tb
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


module Coin_FSM_tb(

    );
    reg clk, reset_n, c5, c10, c25, item_taken;
    wire dispense, r5, r10, r20;
    
    Coin_FSM uut (
        .clk(clk),
        .reset_n(reset_n),
        .c5(c5),
        .c10(c10),
        .c25(c25),
        .item_taken(item_taken),
        .dispense(dispense),
        .r5(r5),
        .r10(r10),
        .r20(r20)
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
        c5 = 1'b0;
        c10 = 1'b0;
        c25 = 1'b0;
        item_taken = 1'b0;
        #2
        reset_n = 1'b1;
        
        #T
        c5 = 1'b0;
        c10 = 1'b0;
        c25 = 1'b0;
        item_taken = 1'b0;
        #T
        c5 = 1'b0;
        c10 = 1'b0;
        c25 = 1'b1;
        item_taken = 1'b0;
        #T
        c5 = 1'b0;
        c10 = 1'b1;
        c25 = 1'b0;
        item_taken = 1'b0;
        #T
        c5 = 1'b0;
        c10 = 1'b0;
        c25 = 1'b0;
        item_taken = 1'b1;
        #T
        c5 = 1'b0;
        c10 = 1'b1;
        c25 = 1'b0;
        item_taken = 1'b0;
        #T
        c5 = 1'b0;
        c10 = 1'b1;
        c25 = 1'b0;
        item_taken = 1'b0;
        #T
        c5 = 1'b0;
        c10 = 1'b0;
        c25 = 1'b1;
        item_taken = 1'b0;
        #T
        c5 = 1'b0;
        c10 = 1'b0;
        c25 = 1'b0;
        item_taken = 1'b1;
        #T
        c5 = 1'b1;
        c10 = 1'b0;
        c25 = 1'b0;
        item_taken = 1'b1;
        #T
        c5 = 1'b1;
        c10 = 1'b0;
        c25 = 1'b0;
        item_taken = 1'b0;
        #T
        c5 = 1'b0;
        c10 = 1'b1;
        c25 = 1'b0;
        item_taken = 1'b0;
        #T
        c5 = 1'b0;
        c10 = 1'b1;
        c25 = 1'b0;
        item_taken = 1'b0;
        #T
        c5 = 1'b0;
        c10 = 1'b0;
        c25 = 1'b0;
        item_taken = 1'b1;
        #T  
        $finish;
    end
endmodule
