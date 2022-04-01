`include "alu.v"
module aludesign_tb;
parameter n=4;
reg signed [n-1:0] A, B;
reg [1:0] CTRL;
reg CLK, RST;
wire signed [n-1:0] R;
wire O, N, Z;

alu_design ad(A,B,CTRL,CLK,RST,R,O, N, Z);

initial
CLK = 1'b0;

always
#5 CLK=~CLK;

defparam ad.n=4;

initial
  fork
  
    begin
      RST=1'b0;
      #15 RST=1'b1;
    end
    
    begin
      CTRL=2'b00; A=4'b0000; B=4'b0000;
      #10 CTRL=2'b00; 
          A=4'b0001; 
          B=4'b0011;
      #10 CTRL=2'b00; 
          A=4'b0101; 
          B=4'b0111;
      #10 CTRL=2'b00;
          A=4'b0100;
          B=4'b1011;
      #10 CTRL=2'b00; 
          A=4'b1010; 
          B=4'b1100;
      #10 CTRL=2'b01; 
          A=4'b1010; 
          B=4'b1010;
      #10 CTRL=2'b01; 
          A=4'b1110; 
          B=4'b1111;
      #10 CTRL=2'b01;
          A=4'b0001;
          B=4'b1110;
      #10 CTRL=2'b01;
          A=4'b0100;
          B=4'b0101;  
      #10 CTRL=2'b10; 
          A=4'b0110; 
          B=4'b0111;
      #10 CTRL=2'b11; 
          A=4'b0110; 
          B=4'b0101;
      
    
    end
      $monitor("time = %d :: CLK=%b :: RST=%b :: CTRL=%b :: A=%b :: B=%b :: R=%b :: O=%b :: N=%b :: Z=%b",$time,CLK,RST,CTRL,A,B,R,O,N,Z);
   
   #100 $finish;
    join 

initial
$vcdpluson;
  
endmodule
