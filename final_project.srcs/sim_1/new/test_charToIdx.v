`timescale 1ns / 1ps

module test_charToIdx;

wire [7:0] idx;
reg [7:0] ascii;

charToIdx ccc(idx, ascii);
initial begin
	ascii = 0;
	#5000000
	ascii = 8'h20;
	#5000000
	ascii = 8'h62;
	#5000000
	ascii = 8'h61;
	#5000000
	ascii = 8'h0;
end

endmodule
