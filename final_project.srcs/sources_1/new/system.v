`timescale 1ns/1ps

module system #(
	parameter NUM_CHARS = 24,
	parameter NUM_CHARS_PER_LINE = 8,
	parameter CHAR_WIDTH = 8
) (
	output [15:0] led,
	output Vsync,
	output Hsync,
	output JAOut,
	output JAAux,
	output [3:0] vgaRed,
	output [3:0] vgaBlue,
	output [3:0] vgaGreen,
	output RsTx,
	input [11:0] sw,
	input JAIn,
	input btnC,
	input btnL,
	input RsRx,
	input clk
);

wire [NUM_CHARS * CHAR_WIDTH - 1:0] characters;
wire [CHAR_WIDTH - 1:0] character;
wire inputReady;

assign JA[0] = RsTx;

switchInput switchInput (
	.character(character),
	.outputReady(inputReady),
	.switch(sw[7:0]),
	.submitBtn(btnC),
	.clk(clk)
);

uartInput uartInput (
	.character(character),
	.outputReady(inputReady),
	.rx(RsRx),
	.clk(clk)
);

uartInput uartJaInput (
	.character(character),
	.outputReady(inputReady),
	.rx(JA[1]),
	.clk(clk)
);

uartOutput uartOutput (
	.tx(RsTx),
	.character(character),
	.inputReady(inputReady),
	.clk(clk)
);

inputBuffer #(
	.NUM_CHARS(NUM_CHARS),
	.CHAR_WIDTH(CHAR_WIDTH)
) inputBuffer (
	.characters(characters),
	.character(character),
	.rst(btnL),
	.inputReady(inputReady)
);

vga #(
	.NUM_CHARS(NUM_CHARS),
	.NUM_CHARS_PER_LINE(NUM_CHARS_PER_LINE),
	.CHAR_WIDTH(CHAR_WIDTH)
) vga(
	.Vsync(Vsync),
	.Hsync(Hsync),
	.vgaRed(vgaRed),
	.vgaGreen(vgaGreen),
	.vgaBlue(vgaBlue),
	.characters(characters),
	.clk(clk)
);

endmodule
