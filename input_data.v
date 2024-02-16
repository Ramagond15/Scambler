`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.02.2024 14:24:23
// Design Name: 
// Module Name: input_data
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



module input_data (
    input wire clk3,        // Clock signal
    input wire rst,
    input wire [7:0]input_data,
    input  wire xor_out,        
    input wire enable,
    output wire final_out     
);

reg shift_reg;
reg final_reg;
reg [7:0]output_reg;//final output in pattern
assign final_out = final_reg;
   
reg [2:0]counter2,counter3;        

 
always @(posedge clk3) begin
    if (rst) begin
        // Reset the shift register
        counter2 <= 3'b0;         // Reset the counter
        final_reg <= 1'b0;        // Initialize output data bit
    end
    else if(enable && !rst) begin
        
        
        shift_reg <= input_data[counter2];
        
        // Increment the counter
        counter2 <= (counter2 == 3'b111) ? 3'b0 : counter2 + 1;
    end
end

always@(posedge clk3)
    begin
       if(rst)
         final_reg <= 0;
            else 
        
                final_reg <= xor_out ^ shift_reg;
                
      
            end
//always @(posedge clk3) begin
//    if (rst) begin
//        // Reset the shift register
//        counter3 <= 3'b0;         // Reset the counter
//                // Initialize output data bit
//    end
//    else if(enable && !rst) begin
        
        
//        output_reg[counter3] <= final_reg;
        
        
//        counter3 <= (counter3 == 3'b111) ? 3'b0 : counter3 + 1;
//    end
//end
endmodule
