`timescale 1ns / 1ps

module screenData #(
	parameter NUM_CHARS = 2,
	parameter NUM_CHARS_PER_LINE = 16,
	parameter CHAR_WIDTH = 8
) (
	output reg isPixelOn,
	input [CHAR_WIDTH*NUM_CHARS-1:0] characters,
	input [12:0] hcounter,
	input [9:0] vcounter
);

wire isCharacterOn;

wire [12:0] pixelCoorH;
wire [9:0] pixelCoorV;
wire [7:0] charIdx;
wire [7:0] ascii;
wire isTextArea;

positionSelector #(
	.NUM_CHARS(NUM_CHARS),
	.NUM_CHARS_PER_LINE(NUM_CHARS_PER_LINE)
) positionSelector (
	.isTextArea(isTextArea),
	.charIdx(charIdx),
	.pixelCoorH(pixelCoorH),
	.pixelCoorV(pixelCoorV),
	.hcounter(hcounter),
	.vcounter(vcounter)
);

characterSelector #(
	.NUM_CHARS(NUM_CHARS),
	.CHAR_WIDTH(CHAR_WIDTH)
) characterSelector(
	.ascii(ascii),
	.characters(characters),
	.charIdx(charIdx)
);

pixelLookUp #(
	.CHAR_WIDTH(CHAR_WIDTH)
) pixelLookUp(
	.isCharacterOn(isCharacterOn),
	.vcounter(pixelCoorV),
	.hcounter(pixelCoorH),
	.ascii(ascii)
);

always @(hcounter, vcounter) begin
	if (isTextArea)
		isPixelOn = isCharacterOn;
	else begin
		isPixelOn = 0;
	end
end

endmodule
