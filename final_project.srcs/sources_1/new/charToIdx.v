`timescale 1ns / 1ps

module charToIdx(
	output reg [7:0] idx,
	input [7:0] ascii
);

(* rom_style="block" *) reg [7:0] rom [255:0];

initial $readmemb("charidx.data", rom);

always @(ascii) idx <= rom[ascii];
endmodule
