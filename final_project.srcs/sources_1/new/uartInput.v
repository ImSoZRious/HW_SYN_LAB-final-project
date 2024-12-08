`timescale 1ns / 1ps

module uartInput(
	output [7:0] character,
	output outputReady,
	input rx,
	input clk
);

reg [7:0] dataIn;	

reg [7:0] characterReg;
reg outputReadyReg;
reg [2:0] state;

reg occupyCharacter;
reg occupyOutputReady;

assign character = occupyCharacter ? characterReg : 8'bz;
assign outputReady = occupyOutputReady ? outputReadyReg : 8'bz;
reg busy = 0;
reg last_bit = 0;
reg [13:0] counter = 0;
assign is_busy = busy;

initial begin
	last_bit <= 0;
	busy <= 0;
	characterReg <= 0;
	outputReadyReg <= 0;
	occupyCharacter <= 0;
	occupyOutputReady <= 0;
	state <= 0;

end

always @(posedge clk) begin
	if (state == 1) begin
		outputReadyReg <= 1;
		occupyOutputReady <= 1;
		state <= 2;
	end else if (state == 2) begin
		state <= 0;
		outputReadyReg <= 0;
		occupyCharacter <= 0;
		occupyOutputReady <= 0;
	end

	last_bit <= rx;
	if(busy == 0 && last_bit == 1 && rx == 0) begin
		busy <= 1;
	end else if(busy == 1 && counter == 8680) begin
		characterReg <= dataIn;
		occupyCharacter <= 1;
		state <= 1;
		busy <= 0;
	end
end

always @(posedge clk) begin
	if(busy == 1) begin
		counter <= counter + 1;
		case (counter)
			14'd1302 : dataIn[0] <= rx;
			14'd2170 : dataIn[1] <= rx;
			14'd3038 : dataIn[2] <= rx;
			14'd3906 : dataIn[3] <= rx;
			14'd4774 : dataIn[4] <= rx;
			14'd5642 : dataIn[5] <= rx;
			14'd6510 : dataIn[6] <= rx;
			14'd7378 : dataIn[7] <= rx;
		endcase
	end else begin
		counter <= 0;
	end
end
endmodule
