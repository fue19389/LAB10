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
    #1  D0 = 4'b0001; EA=1; EB=1; EC=1; SLCT=3'b000;
    #1  D0 = 4'b0001; EA=1; EB=1; EC=1; SLCT=3'b000;
    #1  D0 = 4'b0001; EA=1; EB=1; EC=1; SLCT=3'b000;
    #1  D0 = 4'b000; EA=1; EB=1; EC=1; SLCT=3'b000;

    #1  D0 = 4'b0001; EA=1; EB=1; EC=1; SLCT=3'b001;
    #1  D0 = 4'b0001; EA=1; EB=1; EC=1; SLCT=3'b001;
    #1  D0 = 4'b0001; EA=1; EB=1; EC=1; SLCT=3'b001;
    #1  D0 = 4'b0001; EA=1; EB=1; EC=1; SLCT=3'b001;

    #1  D0 = 4'b0001; EA=1; EB=1; EC=1; SLCT=3'b010;
    #1  D0 = 4'b0001; EA=1; EB=1; EC=1; SLCT=3'b010;
    #1  D0 = 4'b0001; EA=1; EB=1; EC=1; SLCT=3'b010;
    #1  D0 = 4'b0001; EA=1; EB=1; EC=1; SLCT=3'b000;

    #1  D0 = 4'b0001; EA=1; EB=1; EC=1; SLCT=3'b010;
    #1  D0 = 4'b0001; EA=1; EB=1; EC=1; SLCT=3'b010;
    #1  D0 = 4'b0001; EA=1; EB=1; EC=1; SLCT=3'b010;
    #1  D0 = 4'b0001; EA=1; EB=1; EC=1; SLCT=3'b010;

    #1  D0 = 4'b0001; EA=1; EB=1; EC=1; SLCT=3'b011;
    #1  D0 = 4'b0001; EA=1; EB=1; EC=1; SLCT=3'b011;
    #1  D0 = 4'b0001; EA=1; EB=1; EC=1; SLCT=3'b011;
    #1  D0 = 4'b0001; EA=1; EB=1; EC=1; SLCT=3'b011;

    #1  D0 = 4'b0001; EA=1; EB=1; EC=1; SLCT=3'b100;
    #1  D0 = 4'b0001; EA=1; EB=1; EC=1; SLCT=3'b100;
    #1  D0 = 4'b0001; EA=1; EB=1; EC=1; SLCT=3'b100;
    #1  D0 = 4'b0001; EA=1; EB=1; EC=1; SLCT=3'b100;
    #1  D0 = 4'b0001; EA=1; EB=1; EC=1; SLCT=3'b100;

  end


  initial
    #100 $finish;

  initial begin
    $dumpfile("p2_tb.vcd");
    $dumpvars(0, testbench);
  end

endmodule
