//Universidad del Valle de Guatemala
//Gerardo Fuentes
//19389

//Modulo de contador 12 bits
module counter12b(input[11:0] val, input load, en, clk0, reset0,
                  output reg[11:0]sal);

  always@(posedge clk0, load, val, posedge reset0)
    if (reset0) sal <= 12'b0;
    else if (load) sal <= val;
    else if (en) sal <= sal + 1;

endmodule



//Modulo de ROM
module ROM4K(input [11:0]adrs, output [7:0]outt);
  reg[7:0] m [0:4095];

  initial begin
     $readmemb("prueba.g", m);
  end
  assign outt = m[adrs];

endmodule



//Modulo Flipflop tipo D 8 BIT
module F8b(input clk1, reset1, E, input[7:0]outrom4k, output reg[3:0]instr, oprnd);

  always@(posedge clk1, posedge reset1, E)
    if (reset1)  {instr,oprnd}<=8'b0;
    else if (E) {instr,oprnd}<=outrom4k;

endmodule


//Modulo parte 1 procesador
module part1(input clk, reset, ea, eb, ld, input[11:0] val,
             output[3:0]intr, opnd, output[7:0]pbyte, output[11:0]pc);

  counter12b cnt12(val, ld, ea, clk, reset, pc);
  ROM4K       rm4k(pc, pbyte);
  F8b         ft8b(clk, reset, eb, pbyte, intr, opnd);

endmodule
