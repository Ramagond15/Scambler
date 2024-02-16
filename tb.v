`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2024 14:43:59
// Design Name: 
// Module Name: tb
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


module tb_top_module;

    // Inputs
    reg clk;
    reg rst;
   
    reg [8:1]data_in;
    reg enable;
    reg user_input;
    reg [8:1]input_data;
    // Outputs
    wire [8:1]out_pattern1;
    wire [8:1]out_pattern2;
    wire data_out,data_out1;
    wire out_clk;
    wire xored;
    wire final_out;
   
    
    // Instantiate the top module
    top_module dut (
        .clk(clk),
        .rst(rst),
        .enable(enable),
        .user_input(user_input),
        .data_in(data_in),
        .out_pattern1(out_pattern1),
        .out_pattern2(out_pattern2),
        .data_out(data_out),
        .data_out1(data_out1),
        .out_clk(out_clk),
        .xored(xored),
        .input_data(input_data),
        .final_out(final_out)
        //.out_bit(out_bit)
    );
    
    
   always #10 clk = ~clk;
    
    initial begin
        
          clk =0;
	      rst =1;
	      //active = 0;
	      enable = 0;
	      
	     #300;
	    
	    @(posedge clk)
	    begin
	      rst = 0;
	      
	      //active = 1;
	     enable = 0;
	       end
	       #70;
	    
	    @(posedge clk)begin
	      
	     enable = 1;
	     user_input = 1;
	     input_data = 8'b10100010;
	       
	       end
     
   
   
       
	  
	  
	  end 

endmodule
