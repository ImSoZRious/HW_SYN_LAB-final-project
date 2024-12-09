`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2024 02:27:46 AM
// Design Name: 
// Module Name: test_logic
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


module test_logic;
	assign zOrZ = 1'bz || 1'bz;
	assign zOrTrue = 1'bz || 1;
	assign zOrFalse = 1'bz || 1'b0;
endmodule
