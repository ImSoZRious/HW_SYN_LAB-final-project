`timescale 1ns / 1ps

module test_inputBuffer;
wire [39:0] characters;
reg [7:0] character;
reg inputReady;

inputBuffer #(
	.NUM_CHARS(5)
) ib (
	characters,
	character,
	inputReady
);

initial begin
	inputReady = 1'bz;
	character = 8'b11111111;

	#1000000
	inputReady = 1;
	
	#1000000
	inputReady = 1'bz;

	#1000000
	inputReady = 1;
	
	#1000000
	inputReady = 1'bz;

	#1000000
	inputReady = 1;
	
	#1000000
	inputReady = 1'bz;

	#1000000
	inputReady = 1;
	
	#1000000
	inputReady = 1'bz;

	#1000000
	inputReady = 1;
	
	#1000000
	inputReady = 1'bz;
	
	#1000000
	character = 8'b10101010;

	#1000000
	inputReady = 1;
	
	#1000000
	inputReady = 1'bz;
end

endmodule
