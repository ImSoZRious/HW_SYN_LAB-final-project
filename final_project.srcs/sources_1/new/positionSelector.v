`timescale 1ns / 1ps

module positionSelector #(
	parameter NUM_CHARS_PER_LINE = 16,
	parameter NUM_CHARS = 24
) (
	output isTextArea,
	output [7:0] charIdx,
	output [12:0] pixelCoorH,
	output [9:0] pixelCoorV,
	input [12:0] hcounter,
	input [9:0] vcounter
);

parameter LINES = (NUM_CHARS + NUM_CHARS_PER_LINE - 1) / NUM_CHARS_PER_LINE;

wire [12:0] screenCoorH;
wire [9:0] screenCoorV;

assign screenCoorH = hcounter - 200;
assign screenCoorV = vcounter - 200;

assign pixelCoorV = screenCoorV % 74;
assign pixelCoorH = screenCoorH % 90;
assign charIdx = NUM_CHARS_PER_LINE * (screenCoorV / 74) + (screenCoorH / 90);

assign isTextArea = isTextSection && isNotPadding;
assign isNotPadding = pixelCoorH < 80 && pixelCoorV < 64;
assign isTextSection = (screenCoorH >= 0 && screenCoorH < 90 * NUM_CHARS_PER_LINE && screenCoorV >= 0 && screenCoorV < 74 * LINES);

endmodule
