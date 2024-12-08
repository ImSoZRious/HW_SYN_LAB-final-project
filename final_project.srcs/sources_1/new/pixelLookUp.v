`timescale 1ns / 1ps

module pixelLookUp #(
	parameter CHAR_WIDTH = 8
) (
	output reg isCharacterOn,
	input [12:0] hcounter,
	input [9:0] vcounter,
	input [CHAR_WIDTH - 1:0] ascii
);

wire [7:0] idx;

(* rom_style="block" *) reg [32*64 - 1:0] rom [91 - 1:0];

charToIdx charToIdx(
	.idx(idx),
	.ascii(ascii)
);

wire [9:0] pH;
wire [12:0] pV;

assign pH = hcounter * 2 / 5;
assign pV = vcounter;

wire [7:0] romIdx1;
wire [11:0] romIdx2;

assign romIdx1 = idx;
assign romIdx2 = 32 * pV + pH;

initial $readmemb("charrom.data", rom);

always @(hcounter, vcounter, ascii) begin
	isCharacterOn <= rom[romIdx1][romIdx2];
	$display("Access %d %d", romIdx1, romIdx2);
end
endmodule
