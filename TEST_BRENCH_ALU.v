`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.09.2022 16:45:07
// Design Name: 
// Module Name: TEST_BRENCH_ALU
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


module TEST_BRENCH_ALU(

    );


    localparam ADD  =    6'b100000;
    localparam SUB  =    6'b100010;
    localparam AND  =    6'b100100;
    localparam OR   =    6'b100101;
    localparam XOR  =    6'b100110;
    localparam SRA  =    6'b000011;
    localparam SRL  =    6'b000010;
    localparam NOR  =    6'b100111;
    localparam MY_SIZE = 8;
    reg [7:0] a1 ;
    reg [7:0] b1 ;
    reg btnAA ;
    reg btnBB ;
    reg btnOP1 ;
    reg  [5:0] op;
    wire  signed [8:0]  res;
    wire  carry;
    
    ALU #( .SIZE(MY_SIZE) ) myAlu
   (a1,b1,op,btnAA,btnBB, btnOP1,res,carry);
     
    
    
    initial
    begin
        
        a1 = 8'b00000111;
        b1 = 8'b00000010;
        btnAA = 1'b0;
        btnBB = 1'b1;
        btnOP1 = 1'b1;
        op = ADD;
        #20;
        btnAA = 1;
        #20;
        btnAA = 0;
        a1 = 8'b0000010;
        btnAA = 1;
        #20
        op = SUB;
        b1=8'b00001000;
        #20
        b1=8'b10000000;
        a1=8'b10000000;
        op = ADD;

        
    end

endmodule
