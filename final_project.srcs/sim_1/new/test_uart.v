`timescale 1ns / 1ps

module test_uart;
reg [7:0] characterIn;
reg rdyIn;
wire tx;
reg clk = 0;

uartOutput uartOutput(
	.tx(tx),
	.character(characterIn),
	.inputReady(rdyIn),
	.clk(clk)
);

wire [7:0] characterOut;
wire rdyOut;

uartInput uartInput(
	.character(characterOut),
	.outputReady(rdyOut),
	.rx(tx),
	.clk(clk)
);

initial begin
	rdyIn = 1'bz;
	characterIn = 8'b000000000;
	#50000
	rdyIn = 1;
	
	#50000
	rdyIn = 1'bz;
	
	#5000000
	characterIn = 8'b10101010;
	#50000
	rdyIn = 1;
	
	#50000
	rdyIn = 1'bz;
end

always #5 clk = ~clk;

endmodule
