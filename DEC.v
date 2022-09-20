`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.09.2022 11:52:38
// Design Name: 
// Module Name: DEC
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
module DEC
#(
    parameter SIZE_OPERANDOS= 9,
    parameter SIZE_SW = 9,
    parameter SIZE_OPERACION = 6

)
(
    input wire i_clock,
    input wire  [(SIZE_SW-1):0] i_sw_dec, //switches 
    input wire i_btn_a_dec,
    input wire i_btn_b_dec,
    input wire i_btn_op_dec,
    output wire  [(SIZE_OPERANDOS-1):0] o_a_dec,
    output wire [(SIZE_OPERANDOS-1):0] o_b_dec,
    output wire [(SIZE_OPERACION-1):0] o_opcode_dec
    );


/*

 A wire solo se puede asignar con una asignaci?n de bloqueo continuo. Las asignaciones no bloqueantes ( <= ) solo se pueden hacer a reg . Si las asignaciones de reg s que la unidad done cambian de bloqueo ( = ) a no bloqueo ( <= ), deber?a ser el resultado deseado.

Una asignaci?n sin bloqueo hace una evaluaci?n inmediata con una actualizaci?n retrasada. Esto permite evaluar los valores correctos sin afectar la evaluaci?n de una expresi?n dependiente. Nota: la actualizaci?n retrasada est? en el programador de pasos de tiempo verilog; no tendr? un retraso visible en la forma de onda.

Use las asignaciones no bloqueantes en reg que desea tratar como un flop. Cualquier reg usado para la l?gica combinacional o la generaci?n de reloj debe usar el bloqueo. Habr? condiciones de carrera si el bloqueo no se utiliza para la l?gica combinacional o el reloj. 
*/


reg [(SIZE_OPERANDOS-1):0] a_dec;
reg [(SIZE_OPERANDOS-1):0] b_dec;
reg [(SIZE_OPERACION-1):0] opcode_dec;

assign o_a_dec = a_dec;
assign o_b_dec = b_dec;
assign o_opcode_dec = opcode_dec;



always @(posedge i_clock)
    begin
        if(i_btn_a_dec == 1'b1 )         a_dec <= i_sw_dec [(SIZE_OPERANDOS-1):0] ;
        else if (i_btn_b_dec == 1'b1)   b_dec <= i_sw_dec[(SIZE_OPERANDOS-1):0] ;
        else if (i_btn_op_dec == 1'b1)  opcode_dec <=i_sw_dec [(SIZE_OPERACION-1):0] ;
    end

endmodule
