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
    localparam MY_SIZE_TB = 9;
    localparam MY_SIZE_SW_TB = 16;
    localparam MY_SIZE_OP_TB = 6;
    reg [(MY_SIZE_SW_TB-1):0] sw;
    reg btnAA ;
    reg btnBB ;
    reg btnOP1 ;
    reg  [5:0] op;
    wire  signed [8:0]  res;
    wire  carry;
    reg clock;
    
    EX #(MY_SIZE_TB, MY_SIZE_SW_TB,MY_SIZE_OP_TB)ex1 (clock,sw,btnAA, btnBB, btnOP1, res,carry);
     
    
    
    initial
    begin
       
       sw = 16'b100;
       btnBB = 1'b0;
       btnOP1 = 1'b0;
       btnAA = 1'b1;
       clock = 1'b1;
        #10
        clock = ~clock; //flanco de bajada
        //dump a
        sw = 16'b110;
        btnAA = 1'b0;
        btnBB = 1'b1;
        #100
        clock = ~clock;//flanco de subida
        #100
        clock = ~clock;//flanco de bajada
         //dump b
        #100


        btnBB = 1'b0;
        sw = {10'b0,ADD};
        btnOP1 = 1'b1;
        #100
        clock = ~clock; //flanco de subida
        #10
        clock = ~clock; //flanco de bajada
          //dump opcode

        #10
        clock = ~clock;
        #10
        clock = ~clock;


      

        
    end

endmodule
