//Univseridad del Valle de Guatemala
//Gerardo Fuentes
//19389


//Modulo bus driver triestado 4 bits
module bdri4b(input E0, input[3:0]D, output [3:0]Q);

  assign Q = E0 == 1 ? D:4'bz;

endmodule

//Modulo accumulator
module Acc4b(input clk1, reset1, E1, input[3:0]oalu, output reg[3:0]oaccu);

  always@(posedge clk1, posedge reset1, E1)
    if (reset1)  oaccu<=8'b0;
    else if (E1)  oaccu<=oalu;

endmodule

//Modulo ALU
module ALU4b(input[3:0]inpta, inptb, input[2:0]seg,
             output reg carry, zero, output reg[4:0]oupt);

  always@(inpta, inptb, seg)
    case(seg)
      3'b000: {carry,oupt} <= inpta;
      3'b001: {carry,oupt} <= inpta - inptb;
      3'b010: {carry,oupt} <= inptb;
      3'b011: {carry,oupt} <= inpta + inptb;
      3'b100: {carry,oupt} <= ~(inpta & inptb);
    default oupt = inpta;
   endcase

   always@(oupt)
     if(oupt == 4'b0000) zero <= 1;

endmodule


//Modulo parte2 procesador
module part2(input reset, clk, ea, eb, ec, input[2:0]slct, input[3:0] d0,
             output crry, zro, output[3:0]outalu, outaccu, q0, q1);

  bdri4b bff1(ea, d0, q0);
  bdri4b bff2(eb, outalu, q1);
  ALU4b  alu4(outaccu, q0, slct, crry, zro, outalu);
  Acc4b  accu(clk, reset, ec, outalu, outaccu);

endmodule
