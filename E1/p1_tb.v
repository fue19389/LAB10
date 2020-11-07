//Universidad del Valle de Guatemala
//Gerardo Fuentes
//19389

module testbench();

  reg clk, reset, Ea, Eb, load;
  reg[11:0]VAL;
  wire[3:0]instr, oprnd;
  wire[7:0]prog_byte;
  wire[11:0]PC;

  part1  p1(clk, reset, Ea, Eb, load, VAL, instr, oprnd, prog_byte, PC);

  initial begin
     clk = 0;
     forever #1 clk = ~clk;
  end

  initial begin
    reset = 1;
    #1 reset = 0;
  end

  initial begin
    #1  VAL = 12'b000000000000; Ea=1; Eb=1; load=0;

  end

  initial
    #100 $finish;

  initial begin
    $dumpfile("p1_tb.vcd");
    $dumpvars(0, testbench);
  end

  endmodule
