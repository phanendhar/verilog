
`include "compare.v"
module compare_4_tb();

reg [3:0]a,b;
wire a_gt_b,a_lt_b,a_eq_b,a_gt_b_TB,a_lt_b_TB,a_eq_b_TB;


compare_4 c(a,b,a_gt_b,a_lt_b,a_eq_b);
assign a_lt_b_TB = (a<b)?1'b1:1'b0;
assign a_gt_b_TB = (a>b)?1'b1:1'b0;
assign a_eq_b_TB = (a==b)?1'b1:1'b0;

initial
begin
a = 4'b1000;
b = 4'b0111;
#5;
a = 4'b0111;
b = 4'b1000;
#5;
a = 4'b1010;
b = 4'b1010;
#5;
a = 4'b1100;
b = 4'b1011;
#5;
a = 4'b0011;
b = 4'b0100;
#5;
a = 4'b1011;
b = 4'b1010;
#5;
a = 4'b1010;
b = 4'b1001;
#5;
a = 4'b1011;
b = 4'b1011;
#5;
a = 4'b1011;
b = 4'b1101;
#5;
a = 4'b1010;
b = 4'b1010;
#5;
a = 4'b1101;
b = 4'b1110;
#5;
a = 4'b0111;
b = 4'b1000;
#5;
$finish;
end


initial
$monitor("Time = %d A=%h B=%h -- Expected output: a_gt_b_TB:%b a_lt_b_TB:%b a_eq_b_TB:%b -- Actual Outputs: A_gt_B:%b A_lt_B:%b A_eq_B:%b",$time,a,b,a_gt_b_TB,a_lt_b_TB,a_eq_b_TB,a_gt_b,a_lt_b,a_eq_b); 

initial
$vcdpluson;



endmodule
