`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Julieta Prieto y Mateo Merino
// 
// Create Date: 06.09.2022 15:53:00
// Design Name: 
// Module Name: ALU
// Project Name: PipeLine
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


module ALU
#(
    parameter SIZE= 8

)
(
    input wire signed  [(SIZE-1):0] i_a_alu,
    input wire signed [(SIZE-1):0] i_b_alu,
    input wire [5:0] i_opcode_alu,
    output wire signed [(SIZE-1):0] o_res_alu,
    output wire o_carry_alu
    );

localparam ADD  =    6'b100000;
localparam SUB  =    6'b100010;
localparam AND  =    6'b100100;
localparam OR   =    6'b100101;
localparam XOR  =    6'b100110;
localparam SRA  =    6'b000011;
localparam SRL  =    6'b000010;
localparam NOR  =    6'b100111;


reg carry;
reg signed [SIZE:0] res;
assign o_res_alu = res;
assign  o_carry_alu = carry;


/*

 A wire solo se puede asignar con una asignaci�n de bloqueo continuo. Las asignaciones no bloqueantes ( <= ) solo se pueden hacer a reg . Si las asignaciones de reg s que la unidad done cambian de bloqueo ( = ) a no bloqueo ( <= ), deber�a ser el resultado deseado.

Una asignaci�n sin bloqueo hace una evaluaci�n inmediata con una actualizaci�n retrasada. Esto permite evaluar los valores correctos sin afectar la evaluaci�n de una expresi�n dependiente. Nota: la actualizaci�n retrasada est� en el programador de pasos de tiempo verilog; no tendr� un retraso visible en la forma de onda.

Use las asignaciones no bloqueantes en reg que desea tratar como un flop. Cualquier reg usado para la l�gica combinacional o la generaci�n de reloj debe usar el bloqueo. Habr� condiciones de carrera si el bloqueo no se utiliza para la l�gica combinacional o el reloj. 
*/


always @(*) //i_opcode_alu, i_a_alu, i_b_alu (?)

begin
    case(i_opcode_alu)

                         
        ADD: begin

             res <= i_a_alu + i_b_alu ; 
             carry <= (  res[SIZE-1]  ^ i_a_alu[SIZE-1] ^ i_b_alu [SIZE-1] ) & res[SIZE-1]; // si el msb es 1 hay carry y prendemos el led carry
             //si a y b son positivos y res me quedo negativo hubo carry
             end

        SUB:    res <= i_a_alu - i_b_alu ;
        AND:    res <= i_a_alu & i_b_alu ;
        OR :    res <= i_a_alu | i_b_alu ;
        XOR:    res <= i_a_alu ^ i_b_alu ;
        SRA:    res <= i_a_alu >>> 1 ;
        SRL:    res <= i_a_alu >>  1 ;
        NOR:    res <= ~(i_a_alu | i_b_alu );
        default: res <= {SIZE{0}};
    endcase
end


      
endmodule