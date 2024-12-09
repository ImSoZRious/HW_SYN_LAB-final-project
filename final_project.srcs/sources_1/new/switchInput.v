`timescale 1ns / 1ps
module switchInput(
	output [7:0] character,
	output outputReady,
	input [7:0] switch,
	input submitBtn,
	input clk
);

reg prevBtn;
reg [1:0] state;
reg [7:0] characterReg;
reg outputReadyReg;

reg occupyCharacter;
reg occupyOutputReady;

assign character = occupyCharacter ? characterReg : 8'bz;
assign outputReady = occupyOutputReady ? outputReadyReg : 8'bz; 

initial begin
	prevBtn = 0;
	state = 0;
	characterReg = 0;
	outputReadyReg = 0;
	occupyCharacter = 0;
	occupyOutputReady = 0;
end

always @(posedge clk) begin
	if (state == 0) begin
		if (submitBtn && !prevBtn) begin
			characterReg = switch;
			occupyCharacter = 1;
			state = 1;
		end
	end else if (state == 1) begin
		outputReadyReg = 1;
		occupyOutputReady = 1;
		state = 2;
	end else if (state == 2) begin
		state = 0;
		outputReadyReg = 0;
		occupyCharacter = 0;
		occupyOutputReady = 0;
	end

	prevBtn = submitBtn;
end

endmodule
