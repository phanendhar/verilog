module priority_en_tb();
  parameter N=6;
  reg [N:0]d1;
  reg clk,rst,load,countup,countdown;
  wire [N:0] q1;
  
  priority_en_ex #(6) dut(.d(d1), .clk(clk),.q(q1),.rst(rst),.load(load),.countup(countup),.countdown(countdown));
  
  initial
    clk = 1'b0;
  
  always 
    #5 clk <= ~clk;
  
  initial
    begin
      #0;
      rst = 1'b0;
      d1 = 5;
      {countdown,countup,load}=3'b000;
      #5;
      rst = 1'b1;
    
      for(int i=0;i<8;i=i+1)
    begin
      #5;
      {countdown,countup,load}=$random;
    end
 #100;
  $finish;
  end
  
  initial
    $monitor($time,"rst =%b %b%b%b:-d=%b q=%b",rst,countdown,countup,load,d1,q1);
endmodule
  
