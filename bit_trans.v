`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2024 14:43:26
// Design Name: 
// Module Name: bit_trans
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


module lfsr_bit_transmitter (
    input wire clk, clk_out,         // Clock signal
    input wire reset,        // Reset signal
    input wire [7:0] data_in,data_in1,// Input 8-bit pattern
    input wire enable,
    input wire user_input,
    output wire data_out,
    output wire data_out1,
    output wire xored      // Output data bit
);
reg data_out_reg,data_out_reg1;
reg xored_reg;
   // Shift register to hold the 8-bit pattern
reg [2:0] counter,counter1;          // Counter to track current bit position
assign data_out = data_out_reg;
assign data_out1 = data_out_reg1;
assign xored =xored_reg;

always @(posedge clk) begin
    if (reset) begin
        // Reset the shift register
        counter <= 3'b0;         // Reset the counter
        data_out_reg <= 1'b0;        // Initialize output data bit
    end
    else if(enable && !reset) begin
        // Shift in the 8-bit pattern
        
        
        // Output the bit at the current position indicated by the counter
        data_out_reg <= data_in[counter];
        
        // Increment the counter
        counter <= (counter == 3'b111) ? 3'b0 : counter + 1;
    end
end


always @(posedge clk) begin
    if (reset) begin
        
        counter1 <= 3'b0;         // Reset the counter
        data_out_reg1 <= 1'b0;        // Initialize output data bit
    end
    else if(enable && !reset) begin
        // Shift in the 8-bit pattern
        
        
        // Output the bit at the current position indicated by the counter
        data_out_reg1 <= data_in1[counter1];
        
        // Increment the counter
        counter1 <= (counter1 == 3'b111) ? 3'b0 : counter1 + 1;
    end
end

always@(posedge clk)    
    begin
        if(reset)
            xored_reg <= 0;
                else if(enable) 
                xored_reg <= user_input ^ data_out ^ data_out1;
        end

endmodule
