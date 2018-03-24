`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2018 17:05:17
// Design Name: 
// Module Name: delay
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


module delay(
    input CLOCK,
    input [11:0] data_in,
    output reg [11:0] data_out
    );
    reg [11:0] memory [0:40000];
    reg [15:0] i=0;
    reg [15:0] j=20000;
    always @(posedge CLOCK) begin
    memory[i] <= data_in;
    i <= (i==40000)?0:i+1;
    j <= (j==40000)?0:j+1;
    data_out <= memory[j];
    end
    
    
endmodule
