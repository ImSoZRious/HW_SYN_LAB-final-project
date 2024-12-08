`timescale 1ns / 1ps

module test_screnData;

wire isPixelOn;

reg [12:0] hcounter;
reg [9:0] vcounter;
reg [15:0] characters;

screenData screenData(
	isPixelOn,
	characters,
	hcounter,
	vcounter
);

initial begin
	characters = 16'h6162;
	hcounter = 0;
	vcounter = 220;
end

always #500 begin
	hcounter = hcounter + 1;
	
	if (hcounter == 2640) begin
		hcounter = 0;
		vcounter = vcounter + 1;
		if (vcounter == 628) begin
			vcounter = 0;
		end
	end
end

endmodule
