`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.09.2022 15:53:00
// Design Name: 
// Module Name: ALU
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


module EX
#(
    parameter SIZE_OPERANDOS= 9,
    parameter SIZE_SW = 9,
    parameter SIZE_OPERACION = 6

)
(
    input wire i_clock,
    input wire  [(SIZE_SW-1):0] i_sw_ex, //switches 
    input wire i_btn_a_ex,
    input wire i_btn_b_ex,
    input wire i_btn_op_ex,
    output wire signed [(SIZE_OPERANDOS-1):0] o_res_ex,
    output wire o_carry_ex
);


    wire [(SIZE_OPERACION-1):0] opcode_ex;
    wire [(SIZE_OPERANDOS-1):0] a_ex;
    wire [(SIZE_OPERANDOS-1):0] b_ex;
    ALU  #(SIZE_OPERANDOS)alu1 (a_ex,b_ex,opcode_ex,o_res_ex, o_carry_ex);
    DEC #( SIZE_OPERANDOS,SIZE_SW,SIZE_OPERACION ) decode ( 
                                                                i_clock,
                                                                i_sw_ex,
                                                                i_btn_a_ex,
                                                                i_btn_b_ex,
                                                                i_btn_op_ex,
                                                                a_ex,
                                                                b_ex,
                                                                opcode_ex
    
    );
    
endmodule
