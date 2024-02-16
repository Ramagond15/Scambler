`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2024 15:54:43
// Design Name: 
// Module Name: clock_divider
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


module ClockDivider (
    input wire clk,  // Original clock
    output wire out_clk  // Divided clock
);
reg out_clk_reg =0;
reg [2:0] count =0;  // 3-bit counter to count 8 clock cycles
assign out_clk= out_clk_reg;
always @(posedge clk) begin
    if (count == 3'b011) begin
        out_clk_reg <= ~out_clk_reg;  // Toggle the divided clock
        count <= 0;  // Reset the counter
    end
    else begin
        count <= count + 1;  // Increment the counter
    end
end

endmodule
