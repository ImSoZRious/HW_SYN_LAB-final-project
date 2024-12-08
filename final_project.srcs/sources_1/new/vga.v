`timescale 1ns / 1ps

module vga #(
	parameter NUM_CHARS = 9,
	parameter NUM_CHARS_PER_LINE = 20,
	parameter CHAR_WIDTH = 8
) (
	output Vsync,
	output Hsync,
	output [3:0] vgaRed,
	output [3:0] vgaBlue,
	output [3:0] vgaGreen,
	input [NUM_CHARS * CHAR_WIDTH - 1:0] characters,
	input clk
);
localparam H1 = 2100;
localparam H2 = 2420;
localparam Hrst = 2640;
localparam V1 = 600;
localparam V2 = 604;
localparam Vrst = 628;

reg [12:0] hcounter;
reg [9:0] vcounter;

reg [3:0] vgaRedReg;
reg [3:0] vgaGreenReg;
reg [3:0] vgaBlueReg;

assign Hsync = hcounter <= H1 || hcounter > H2;
assign Vsync = vcounter <= V1 || vcounter > V2;

assign videoOn = (vcounter <= V1) && (hcounter <= H1);

assign vgaRed = vgaRedReg;
assign vgaGreen = vgaGreenReg;
assign vgaBlue = vgaBlueReg;

wire isPixelOn;

screenData #(
	.NUM_CHARS(NUM_CHARS),
	.NUM_CHARS_PER_LINE(NUM_CHARS_PER_LINE),
	.CHAR_WIDTH(CHAR_WIDTH)
) screenData(
	.isPixelOn(isPixelOn),
	.characters(characters),
	.hcounter(hcounter),
	.vcounter(vcounter)
);

always @(posedge clk) begin
	vgaRedReg = (videoOn && isPixelOn) ? 15 : 0;
	vgaGreenReg = (videoOn && isPixelOn) ? 15 : 0;
	vgaBlueReg = (videoOn && isPixelOn) ? 15 : 0;
end

initial begin
	hcounter = 0;
	vcounter = 0;
	vgaRedReg = 0;
	vgaGreenReg = 0;
	vgaBlueReg = 0;
end

//reg clk;
//initial clk = 1;
//always #5 clk = ~clk;

always @(posedge clk) begin
	hcounter = hcounter + 1;
	if (hcounter == Hrst) begin
		vcounter = vcounter + 1;
		hcounter = 0;
		if (vcounter == Vrst) begin
			vcounter = 0;
		end
	end
end


endmodule
