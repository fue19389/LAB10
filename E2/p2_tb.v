//Universidad del Valle de Guatemala
//Gerardo Fuentes
//19389

module testbench();

  reg RST, CLK, EA, EB, EC;
  reg[2:0] SLCT;
  reg[3:0] D0;
  wire CRRY, ZRO;
  wire[3:0] OUTALU, OUTACCU, Q0, Q1;

  part2  p2(RST, CLK, EA, EB, EC, SLCT, D0, CRRY, ZRO, OUTALU, OUTACCU, Q0, Q1);

  initial begin
     CLK = 0;
     forever #1 CLK = ~CLK;
  end

  initial begin
    RST = 1;
    #1 RST = 0;
  end

  initial begin
    #1  VAL = 12'b000000000000; Ea=1; Eb=1; load=0;
    #20 VAL = 12'b000000001010; Ea=1; Eb=1; load=1;
    #1  VAL = 12'b000000001010; Ea=1; Eb=1; load=1;
    #1  VAL = 12'b000000001010; Ea=1; Eb=1; load=0;


  end


  initial
    #100 $finish;

  initial begin
    $dumpfile("p2_tb.vcd");
    $dumpvars(0, testbench);
  end

endmodule
