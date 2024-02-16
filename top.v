`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2024 14:34:11
// Design Name: 
// Module Name: top
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


module top_module (
    input wire clk,clk1,                        // Clock input
    input wire rst,                        // Reset input
    input wire[7:0]data_in,
    input wire enable,
    input wire user_input,
    input wire [7:0]input_data,
    output wire [7:0]out_pattern1,
    output wire [7:0]out_pattern2,                 // User provided single bit input
   // output wire  out_bit,
    output wire data_out,data_out1,
    output wire out_clk,
    output wire xored,
    output wire final_out       // Output bit
    );


reg [7:0]data_out_reg;
reg [2:0]count;
 
// Instantiate the two 8-bit LFSRs
lfsr_8bit_function1 lfsr1_inst (
    .clk1(out_clk),
    .rst(rst),
    .out_pattern1(out_pattern1)
    
);

lfsr_8bit_function2 lfsr2_inst (
    .clk2(out_clk),
    .rst(rst),
    .out_pattern2(out_pattern2)
);



lfsr_bit_transmitter trans1(
         .clk(clk),
         .reset(rst),
         .clk_out(out_clk),
         .data_in(out_pattern1),//assigning LFSR1 pattern
         .data_in1(out_pattern2),//assigning LFSR2 pattern
         .enable(enable),
         .user_input(user_input), // input data of 1 bit
         .data_out(data_out), //bit per cycle of LFSR1 pattern
         .data_out1(data_out1), //bit per cycleof LFSR2 pattern
         .xored(xored)); //user_input ^ data_in ^data_in1
         
  input_data in_da(
           .clk3(clk),
           .rst(rst),
           .input_data(input_data), //input from the test bench o 8 bit
           .xor_out(xored),//xored output from the bit_trans.v
           .enable(enable),
           .final_out(final_out) //final_output , bit per cicle
           
          ) ;       

ClockDivider clk_div(
              .clk(clk),
              .out_clk(out_clk));
endmodule

