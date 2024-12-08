`timescale 1ns / 1ps

module test_positionSelector;

reg [12:0] hcounter;
reg [9:0] vcounter;
wire isTextArea;
wire [7:0] charIdx;
wire [12:0] pixelCoorH;
wire [9:0] pixelCoorV;

positionSelector #(
	.NUM_CHARS_PER_LINE(16),
	.NUM_CHARS(24)
) p (
	isTextArea,
	charIdx,
	pixelCoorH,
	pixelCoorV,
	hcounter,
	vcounter
);

initial begin
	hcounter = 0;
	vcounter = 0;
	
	#1000000
	hcounter = 220;
	vcounter = 220;
	
	#100000
	hcounter = hcounter + 10;
	
	#100000
	hcounter = hcounter + 10;
	
	#100000
	hcounter = hcounter + 10;
	
	#100000
	hcounter = hcounter + 10;
	
	#100000
	hcounter = hcounter + 10;
	
	#100000
	hcounter = hcounter + 10;
	
	#100000
	hcounter = hcounter + 10;
	
	#100000
	hcounter = hcounter + 10;
	
	#100000
	hcounter = hcounter + 10;
	
	#100000
	vcounter = vcounter + 10;
	
	#100000
	vcounter = vcounter + 10;
	
	#100000
	vcounter = vcounter + 10;
	
	#100000
	vcounter = vcounter + 10;
	
	#100000
	vcounter = vcounter + 10;
	
	#100000
	vcounter = vcounter + 10;
	
	#100000
	vcounter = vcounter + 10;
	
	#100000
	vcounter = vcounter + 10;
	
	#100000
	vcounter = vcounter + 10;
	
	#100000
	vcounter = vcounter + 10;
	
	#100000
	vcounter = vcounter + 10;
	
	#100000
	vcounter = vcounter + 10;
	
	#100000
	vcounter = vcounter + 10;
	
	#100000
	vcounter = vcounter + 10;
	
	#100000
	vcounter = vcounter + 10;
	
	#100000
	vcounter = vcounter + 10;
	
	#100000
	vcounter = vcounter + 10;
	
	#100000
	vcounter = vcounter + 10;
end

endmodule
