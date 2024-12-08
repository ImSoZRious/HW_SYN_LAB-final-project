`timescale 1ns / 1ps

module test_inputAll;

wire [39:0] characters;
wire [7:0] character;
wire outputReady;

reg [7:0] switch;
reg submitBtn;
reg clk;

switchInput sw(
	character,
	outputReady,
	switch,
	submitBtn,
	clk
);

inputBuffer #(
	.NUM_CHARS(5)
) ib (
	characters,
	character,
	outputReady
);
initial begin
	clk = 0;
	switch = 0;
	submitBtn = 0;
	
	#1000000
	switch = 8'b11001100;
	
	#1000000
	submitBtn = 1;
	
	#2000000
	submitBtn = 0;
	
	#2000000
	submitBtn = 1;
	
end

always #100000 clk = ~clk;

endmodule
