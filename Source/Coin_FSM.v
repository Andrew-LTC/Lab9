`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2021 03:55:36 PM
// Design Name: 
// Module Name: Coin_FSM
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


module Coin_FSM(
    input clk, reset_n,
    input c5, c10, c25, item_taken,
    output dispense, r5, r10, r20,
    output state0, state1, state2, state3, state4, state5, state6, state7, state8, state9   //outputs for current state
    );
    
    reg [4:0] state_reg, state_next;
    localparam  s0 = 0, s1 = 1, s2 = 2, 
                s3 = 3, s4 = 4, s5 = 5, 
                s6 = 6, s7 = 7, s8 = 8, s9 = 9;
                
    //State Register
    always @(posedge clk, negedge reset_n)
    begin
        if(~reset_n)
            state_reg <= s0;
        else
            state_reg <= state_next;
    end 
    
    //Next State Logic
    always @(*)
    begin
        case(state_reg)
            s0: if(c5)          state_next = s1;
                else if(c10)    state_next = s2;
                else if(c25)    state_next = s5;
                else            state_next = s0;
            s1: if(c5)          state_next = s2;
                else if(c10)    state_next = s3;
                else if(c25)    state_next = s6;
                else            state_next = s1;
            s2: if(c5)          state_next = s3;
                else if(c10)    state_next = s4;
                else if(c25)    state_next = s7;
                else            state_next = s2;
            s3: if(c5)          state_next = s4;
                else if(c10)    state_next = s5;
                else if(c25)    state_next = s8;
                else            state_next = s3;
            s4: if(c5)          state_next = s5;
                else if(c10)    state_next = s6;
                else if(c25)    state_next = s9;
                else            state_next = s4;
            s5: if(item_taken)  state_next = s0;
                else            state_next = s5;
            s6: if(item_taken)  state_next = s0;
                else            state_next = s6;
            s7: if(item_taken)  state_next = s0;
                else            state_next = s7;
            s8: if(item_taken)  state_next = s0;
                else            state_next = s8;
            s9: if(item_taken)  state_next = s0;
                else            state_next = s9;
            default: state_next = state_reg;
        endcase
    end
    
    //Output Logic
    assign dispense = ((state_reg == s5) | (state_reg == s6) | 
                        (state_reg == s7) | (state_reg == s8) |
                        (state_reg == s9));
                        
    assign r5 = ((state_reg == s6) | (state_reg == s8));
    assign r10 = ((state_reg == s7) | (state_reg == s8));
    assign r20 = (state_reg == s9);
    //Outputs for current state
    assign state0 = (state_reg == s0);
    assign state1 = (state_reg == s1);
    assign state2 = (state_reg == s2);
    assign state3 = (state_reg == s3);
    assign state4 = (state_reg == s4);
    assign state5 = (state_reg == s5);
    assign state6 = (state_reg == s6);
    assign state7 = (state_reg == s7);
    assign state8 = (state_reg == s8);
    assign state9 = (state_reg == s9);
endmodule
