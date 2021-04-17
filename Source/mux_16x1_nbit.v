`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2021 08:02:16 PM
// Design Name: 
// Module Name: mux_16x1_nbit
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


module mux_16x1_nbit
    #(parameter N = 4)(
    input [N-1:0] w0,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,
    input [3:0] s,
    output reg [N-1:0] f
    );
    
    always @(w0,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,s)
    begin
        case(s)
            4'b0000: f = w0;
            4'b0001: f = w1;
            4'b0010: f = w2;
            4'b0011: f = w3;
            4'b0100: f = w4;
            4'b0101: f = w5;
            4'b0110: f = w6;
            4'b0111: f = w7;
            4'b1000: f = w8;
            4'b1001: f = w9;
            4'b1010: f = w10;
            4'b1011: f = w11;
            4'b1100: f = w12;
            4'b1101: f = w13;
            4'b1110: f = w14;
            4'b1111: f = w15;
            default: f = 'bx;
        endcase
    end
endmodule
