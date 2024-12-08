`timescale 1ns / 1ps

module inputBuffer #(
	parameter NUM_CHARS = 60,
	parameter CHAR_WIDTH = 8
) (
	output reg [NUM_CHARS * CHAR_WIDTH - 1:0] characters,
	input [7:0] character,
	input inputReady
);

reg [6:0] charIdx;

initial begin
	charIdx = 0;
	characters = {NUM_CHARS * CHAR_WIDTH{1'b0}};
end

always @(posedge inputReady) begin
	characters[charIdx * CHAR_WIDTH +:CHAR_WIDTH] = character;
	charIdx = charIdx == NUM_CHARS - 1 ? 0 : (charIdx + 1);
end

endmodule
