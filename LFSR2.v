`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 

// Create Date: 11.02.2024 14:43:07
// Design Name: 
// Module Name: LFSR2
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


module lfsr_8bit_function2 (
    input wire clk2,          // Clock input
    input wire rst,          // Reset input
    output wire [7:0] out_pattern2 // Output pattern
    );

reg [7:0] lfsr2_reg; // 8-bit register for LFSR

always @(posedge clk2) begin
    if (rst) begin
        lfsr2_reg <= 8'b00000001;
    end
    else begin
       
        lfsr2_reg <= {lfsr2_reg[6:0], lfsr2_reg[1] ^ lfsr2_reg[3] ^ lfsr2_reg[4] ^ lfsr2_reg[6]};
    end
end

assign out_pattern2 = lfsr2_reg;

endmodule

