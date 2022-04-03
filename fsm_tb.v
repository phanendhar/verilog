`include "fsm_dut.v"
module fsm_tb();
reg x,clk,reset;
wire z;
fsm10011 dut1(x,clk,reset,z);
initial
clk =1'b0;
always
#5 clk = ~clk;
initial 
begin
x=1'b0;
reset=1'b0;
#8;
x=1'b1;
reset =1'b1;
#16;
x=1'b0;
#8;
x=1'b0;
#8;
x=1'b1;
#16;
x=1'b1;
#16;
x=1'b1;
#16;
$finish;
end
initial
$monitor ($time,"x=%b,z=%b",x,z);
initial
$vcdpluson;
endmodule
