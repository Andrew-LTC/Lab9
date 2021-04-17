`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2021 11:34:03 AM
// Design Name: 
// Module Name: Vending_Machine
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


module Vending_Machine(
    input CLK100MHZ, reset_n,
    input c5, c10, c25, item_taken,
    output [7:0] AN,
    output DP,
    output [6:0] SEG,
    output [2:0] LED,
    output red_LED, green_LED
    );
    
    //Between FSM and Encoder
    wire [9:0] state;
    //Between FSM and Mux1
    wire r5, r10, r20, dispense;
    //Between Encoder and Mux0
    wire [3:0] y;
    //Between Decoder and rgb_driver
    wire [1:0] z;
    //Between Mux0 and bin2bcd
    wire [7:0] InMoney;
    //Betwen Mux1 and bin2bcd
    wire [7:0] OutMoney;
    //Between bin2bcd and Driver
    wire [11:0] InMoneyBCD;
    //Between bin2bcd and driver
    wire [11:0] OutMoneyBCD;
    //LED's
    assign LED[0] = r5;
    assign LED[1] = r10;
    assign LED[2] = r20; 
    
    Coin_FSM Coin (
        .clk(CLK100MHZ),
        .reset_n(reset_n),
        .c5(c5),
        .c10(c10),
        .c25(c25),
        .item_taken(item_taken),
        .dispense(dispense),
        .r5(r5),
        .r10(r10),
        .r20(r20),
        .state0(state[0]),
        .state1(state[1]),
        .state2(state[2]),
        .state3(state[3]),
        .state4(state[4]),
        .state5(state[5]),
        .state6(state[6]),
        .state7(state[7]),
        .state8(state[8]),
        .state9(state[9])
    );
    
    priority_encoder_generic #(.N(16)) ENC0 (
        .w(state),
        .y(y)
    );
    
    mux_16x1_nbit #(.N(8)) MUX0 (
        .w0(8'b0),
        .w1(8'b101),
        .w2(8'b1010),
        .w3(8'b1111),
        .w4(8'b10100),
        .w5(8'b11001),
        .w6(8'b11110),
        .w7(8'b100011),
        .w8(8'b101000),
        .w9(8'b101101),
        .w10(8'b0),
        .w11(8'b0),
        .w12(8'b0),
        .w13(8'b0),
        .w14(8'b0),
        .w15(8'b0),
        .s(y),
        .f(InMoney)
    );
    
    nbit_8x1_mux #(.N(8)) MUX1 (
        .w0(8'b0),
        .w1(8'b101),
        .w2(8'b1010),
        .w3(8'b1111),
        .w4(8'b10100),
        .w5(8'b0),
        .w6(8'b0),
        .w7(8'b0), 
        .s({r20,r10,r5}),
        .f(OutMoney)
    );
    
    decoder_generic #(.N(1)) DEC0 (
        .w(dispense),
        .en(1'b1),
        .y(z)
    );
    
    bin2bcd B2B1 (
        .bin(InMoney),
        .bcd(InMoneyBCD)
    );
    
    bin2bcd B2B2 (
        .bin(OutMoney),
        .bcd(OutMoneyBCD)
    );
    
    rgb_driver #(.R(0)) RGB (
        .clk(CLK100MHZ),
        .reset_n(reset_n),
        .red_duty(z[1]),
        .green_duty(z[0]),
        .blue_duty(1'b0),
        .red_LED(red_LED),
        .green_LED(green_LED)
    );
    
    sseg_driver Display (
        .I7(6'b0),
        .I6({1'b1,OutMoneyBCD[11:8],1'b1}),
        .I5({1'b1,OutMoneyBCD[7:4],1'b0}),
        .I4({1'b1,OutMoneyBCD[3:0],1'b0}),
        .I3(6'b0),
        .I2({1'b1,InMoneyBCD[11:8],1'b1}),
        .I1({1'b1,InMoneyBCD[7:4],1'b0}),
        .I0({1'b1,InMoneyBCD[3:0],1'b0}),
        .CLK100MHZ(CLK100MHZ),
        .SSEG(SEG),
        .AN(AN),
        .DP(DP)
    );
endmodule
