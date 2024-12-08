`timescale 1ns / 1ps

module uartOutput(
	output reg tx,
	input [7:0] character,
	input inputReady,
	input clk
);

reg busy;
reg [7:0] dataOut;

reg [13:0] counter;

initial begin
	tx = 1;
	busy = 0;
	dataOut = 0;
	counter = 0;
end

always @(posedge clk) begin
	if (inputReady == 1 && busy == 0) begin
		dataOut = character;
		busy = 1;
		tx = 0;
		counter = 0;
	end else if (busy == 1) begin
		case (counter)
			14'd868: tx = dataOut[0];
			14'd1736: tx = dataOut[1];
			14'd2604: tx = dataOut[2];
			14'd3472: tx = dataOut[3];
			14'd4340: tx = dataOut[4];
			14'd5208: tx = dataOut[5];
			14'd6076: tx = dataOut[6];
			14'd6944: tx = dataOut[7];
			14'd7812: begin
				tx = 1;
				busy = 0;
			end
		endcase
	end
	
	counter = counter + 1;
end
endmodule
