`timescale 1ns/1ps

module characterSelector #(
    parameter CHAR_WIDTH = 8,           // Width of each character
    parameter NUM_CHARS = 2       // Number of characters
)(
    output [CHAR_WIDTH-1:0] ascii,          // Selected character
    input  [CHAR_WIDTH*NUM_CHARS-1:0] characters, // Input character array
    input  [7:0] charIdx // Selector index
);

    assign ascii = characters[charIdx*CHAR_WIDTH +: CHAR_WIDTH];

endmodule