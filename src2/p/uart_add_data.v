`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2024 02:27:21 AM
// Design Name: 
// Module Name: uart_add_data
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module uart_add_data #(
    parameter NUM_CHARS = 60,
    parameter CHAR_WIDTH = 8
)(
    input wire clk,
    input wire reset,
    input wire uart_rx,                 // UART receive line
    output wire uart_tx,                // UART transmit line
    output reg [NUM_CHARS * CHAR_WIDTH - 1:0] characters,
    input wire [7:0] sw,                // 8 switches input (sw0-sw7)
    input wire btnC            // Center button input
);

    // UART signals
    wire received;
    wire [CHAR_WIDTH-1:0] data_in;
    reg send;
    reg [CHAR_WIDTH-1:0] data_out;
    wire tx_ready;

    // UART instance
    uart uart_instance (
        .clk(clk),
        .rx(uart_rx),
        .tx(uart_tx),
        .received(received),
        .data_received(data_in),
        .data_transmit(data_out),
        .send(send),
        .tx_ready(tx_ready)
    );

    // Index for characters array
    reg [$clog2(NUM_CHARS):0] write_index;
    reg [7:0] last_switch_state;
    reg button_pressed;

    initial begin
        characters = {NUM_CHARS * CHAR_WIDTH{1'b0}};
        write_index = 0;
        last_switch_state = 8'b0;
        send = 0;
        button_pressed = 0;
    end

    // Update characters on UART reception
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            characters <= {NUM_CHARS * CHAR_WIDTH{1'b0}};
            write_index <= 0;
        end else if (received) begin
            characters <= {characters[NUM_CHARS * CHAR_WIDTH - CHAR_WIDTH - 1:0], data_in};
            write_index <= (write_index + 1) % NUM_CHARS;
        end
    end

    // Transmit ASCII when button is pressed
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            send <= 0;
            button_pressed <= 0;
        end else if (btnC && !button_pressed && tx_ready) begin
            button_pressed <= 1;  // Register button press
            
            // Convert switch state to ASCII (assume sw is a 7-bit number)
            if (sw < 10)
                data_out <= 8'd48 + sw; // ASCII '0' + sw value
            else if (sw < 16)
                data_out <= 8'd55 + sw; // ASCII 'A' + sw value - 10

            send <= 1;  // Trigger UART transmission
        end else if (!btnC) begin
            button_pressed <= 0;  // Reset button_pressed when button is released
        end else if (send) begin
            send <= 0;  // Clear send signal after sending
        end
    end

endmodule

