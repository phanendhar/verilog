
module compare_4(A,B,A_gt_B,A_lt_B,A_eq_B);

input [3:0]A,B;
output A_gt_B,A_lt_B,A_eq_B;

wire [3:0]x;

assign x[0] = ~(A[0]^B[0]);
assign x[1] = ~(A[1]^B[1]);
assign x[2] = ~(A[2]^B[2]);
assign x[3] = ~(A[3]^B[3]);

assign A_gt_B = ((A[3]&(~B[3]))|(x[3]&A[2]&(~B[2]))|(x[3]&x[2]&A[1]&(~B[1]))|(x[3]&x[2]&x[1]&A[0]&(~B[0])));
assign A_lt_B = (((~A[3])&B[3])|(x[3]&(~A[2])&B[2])|(x[3]&x[2]&(~A[1])&B[1])|(x[3]&x[2]&x[1]&(~A[0])&B[0]));
assign A_eq_B = x[3]&x[2]&x[1]&x[0];

endmodule
