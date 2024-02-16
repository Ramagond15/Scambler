`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2024 14:42:53
// Design Name: 
// Module Name: LFSR1
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


module lfsr_8bit_function1 (
    input wire clk1,          // Clock input
    input wire rst,
             // Reset input
    //input wire enable,          // Reset input
    output wire [7:0] out_pattern1 // Output pattern
    );

reg [7:0] lfsr1_reg; // 8-bit register for LFSR

always @(posedge clk1) begin
    if (rst) begin
        lfsr1_reg <= 8'b00000001; 
    end
    else begin
       
        lfsr1_reg <= {lfsr1_reg[6:0], lfsr1_reg[0] ^ lfsr1_reg[1] ^ lfsr1_reg[2] ^ lfsr1_reg[7]};
    
    end
    
end

assign out_pattern1 = lfsr1_reg;

endmodule

