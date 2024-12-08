`timescale 1ns/1ps

module system2 #(
	parameter NUM_CHARS = 60,
	parameter NUM_CHARS_PER_LINE = 20,
	parameter CHAR_WIDTH = 8
) (
	output [15:0] led,
	output Vsync,
	output Hsync,
	output [3:0] vgaRed,
	output [3:0] vgaBlue,
	output [3:0] vgaGreen,
	input [11:0] sw,
	input clk,
    input btnC          // Center button
	
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

uart_add_data #(
	.NUM_CHARS(60),       // Number of characters in the buffer
	.CHAR_WIDTH(8)        // Width of each character in bits
) uart_add_data_instance (
	.clk(clk),            // System clock
	.reset(reset),        // System reset
	.uart_rx(uart_rx),    // UART receive line
	.uart_tx(uart_tx),    // UART transmit line
	.characters(characters), // Output for received characters
	.sw(sw),              // Input switches
	.btnc(btnc)           // Center button for triggering transmit
);

endmodule
