`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2024 01:29:35 PM
// Design Name: 
// Module Name: counter
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


module counter(state, num3, num2, num1, num0, sw, btnU, btnD, btnR, btnL, btnC, clk);
    output [3:0] num3, num2, num1, num0;
    output [2:0] state;
    input [1:0] sw;
    input clk;
    input btnU,btnL,btnR,btnD,btnC;

    
    reg [3:0] num3, num2, num1, num0;
    reg [2:0] state;
    
    initial
        begin
            num3 = 0;
            num2 = 0;
            num1 = 0;
            num0 = 0;
            state = 3'b000;
        end
    
    always @(posedge clk)
        begin
            case (state)
                3'b000: begin num0 <= 0; num1 <= 0; num2 <= 0; num3 <= 0; end
                3'b001: begin num0 <= 0; num1 <= 1; num2 <= 0; num3 <= 0; end
                3'b010: begin num0 <= 0; num1 <= 0; num2 <= 3; num3 <= 0; end
                3'b011: begin num0 <= 0; num1 <= 0; num2 <= 0; num3 <= 5; end
                3'b100: begin num0 <= 0; num1 <= 1; num2 <= 3; num3 <= 5; end
                3'b101: begin num0 <= 1; num1 <= 1; num2 <= 1; num3 <= 1; end
                3'b110: begin num0 <= 9; num1 <= 9; num2 <= 9; num3 <= 9; end
                default: begin num0 <= 0; num1 <= 0; num2 <= 0; num3 <= 0; end
            endcase
            case ({sw,btnU,btnL,btnR,btnD,btnC})
                7'b0100000: state <= (state + 1) % 5;
                7'b1000000: state <= (state + 4) % 5;
                7'b0000001: state <= 3'b000;
                7'b0000010: state <= 3'b110;
                7'b0000100: state <= 3'b001;
                7'b0001000: state <= 3'b010;
                7'b0010000: state <= 3'b101;
                default: state <= state;
            endcase
        end  
     
endmodule
