`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2018 14:10:12
// Design Name: 
// Module Name: slow_module
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


module slow_module(input CLK, input cs, input [6:0] sw, output reg [11:0] speaker_out);
    reg [17:0] COUNT[0:6] ;
    reg [11:0] DOH;
    reg [11:0] RE;
    reg [11:0] MI;
    reg [11:0] FA;
    reg [11:0] SOH;
    reg [11:0] LA;
    reg [11:0] TI;
    
    initial begin
        DOH = 0;
        RE = 0;
        MI = 0;
        FA = 0;
        SOH = 0;
        LA = 0;
        TI = 0;
        COUNT[0]=0;
        COUNT[1]=0;
        COUNT[2]=0;
        COUNT[3]=0;
        COUNT[4]=0;
        COUNT[5]=0;
        COUNT[6]=0;
        speaker_out=0; 
    end
    
    always @ (posedge CLK) begin
        COUNT[0] <= (COUNT[0] == 191112) ? 0 : COUNT[0]+1;
        DOH <= (COUNT[0] == 0) ? ((DOH==0)? 12'b111111111111 : 0) : DOH ;
    end
    
    always @ (posedge CLK) begin
        COUNT[1] <= (COUNT[1] == 170261) ? 0 : COUNT[1]+1;
        RE <= (COUNT[1] == 0) ? ((RE==0)? 12'b111111111111 : 0) : RE ;
    end
    
    always @ (posedge CLK) begin
        COUNT[2] <= (COUNT[2] == 151685) ? 0 : COUNT[2]+1;
        MI <= (COUNT[2] == 0) ? ((MI==0)? 12'b111111111111 : 0) : MI ;
    end
    
    always @ (posedge CLK) begin
        COUNT[3] <= (COUNT[3] == 143172) ? 0 : COUNT[3]+1;
        FA <= (COUNT[3] == 0) ? ((FA==0)? 12'b111111111111 : 0) : FA ;
    end
    
    always @ (posedge CLK) begin
        COUNT[4] <= (COUNT[4] == 127552) ? 0 : COUNT[4]+1;
        SOH <= (COUNT[4] == 0) ? ((SOH==0)? 12'b111111111111 : 0) : SOH ;
    end
    
    always @ (posedge CLK) begin
        COUNT[5] <= (COUNT[5] == 113636) ? 0 : COUNT[5]+1;
        LA <= (COUNT[5] == 0) ? ((LA==0)? 12'b111111111111 : 0) : LA ;
    end
 
    always @ (posedge CLK) begin
        COUNT[6] <= (COUNT[6] == 101238) ? 0 : COUNT[6]+1;
        TI <= (COUNT[6] == 0) ? ((TI==0)? 12'b111111111111 : 0) : TI ;
    end
    
    always @(posedge cs)
    begin
        case (sw) 
            7'b0000001: speaker_out <= DOH[11:0]; 
            7'b0000010: speaker_out <= RE[11:0]; 
            7'b0000100: speaker_out <= MI[11:0]; 
            7'b0001000: speaker_out <= FA[11:0]; 
            7'b0010000: speaker_out <= SOH[11:0]; 
            7'b0100000: speaker_out <= LA[11:0]; 
            7'b1000000: speaker_out <= TI[11:0]; 
        endcase
    end
endmodule

