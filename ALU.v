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


module ALU
#(
    parameter SIZE= 8

)
(
    input wire  [(SIZE-1):0] a,
    input wire [(SIZE-1):0] b,
    input wire [5:0] opCode,
    input wire btnA,
    input wire btnB,
    input wire btnOP,
    output wire signed [SIZE:0] res_alu,
    output wire carry
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
assign res_alu = res;






a



always @(*) 

begin
    case(opCode)

                         
        ADD: begin

             res <= {1'b0 , a} + {1'b0 ,b} ; 
             carry <= (  res[SIZE] &  {1,{ (SIZE-1){0} } } == {1,{ (SIZE-1){0} } }  )  ? 1'b1 : 1'b0; // si el msb es 1 hay carry y prendemos el led carry
             
             end

        SUB:    res <= {1'b0 , a} - {1'b0 ,b};
        AND:    res <= {1'b0 , a} & {1'b0 ,b} ;
        OR :    res <= {1'b0 , a} | {1'b0 ,b} ;
        XOR:    res <= {1'b0 , a} ^ {1'b0 ,b};
        SRA:    res <= {1'b0 , a} >>> {1'b0 ,b};
        SRL:    res <= {1'b0 , a} >> {1'b0 ,b} ;
        NOR:    res <= ~({1'b0 , a} | {1'b0 ,b} );
        default: res <= {SIZE{0}};
    endcase
end


/*

 A wire solo se puede asignar con una asignación de bloqueo continuo. Las asignaciones no bloqueantes ( <= ) solo se pueden hacer a reg . Si las asignaciones de reg s que la unidad done cambian de bloqueo ( = ) a no bloqueo ( <= ), debería ser el resultado deseado.

Una asignación sin bloqueo hace una evaluación inmediata con una actualización retrasada. Esto permite evaluar los valores correctos sin afectar la evaluación de una expresión dependiente. Nota: la actualización retrasada está en el programador de pasos de tiempo verilog; no tendrá un retraso visible en la forma de onda.

Use las asignaciones no bloqueantes en reg que desea tratar como un flop. Cualquier reg usado para la lógica combinacional o la generación de reloj debe usar el bloqueo. Habrá condiciones de carrera si el bloqueo no se utiliza para la lógica combinacional o el reloj. 
*/
      
endmodule
