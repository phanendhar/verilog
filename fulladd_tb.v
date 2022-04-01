`include "fulladd.v"
module fulladd_tb();

reg a,b,cin;
wire sum,cout;

full_add f1(a,b,cin,sum,cout);

initial
begin
a=1'b0; b=1'b0; cin=1'b0;
#2 a=1'b0; b=1'b0; cin=1'b1;
#2 b=1'b1; cin=1'b0;
#2 cin=1'b1;
#2 a=1'b1; b=1'b0; cin=1'b0;
#2 cin=1'b1;
#2 b=1'b1; cin=1'b0;
#2 cin=1'b1;
#2 $finish;
end

initial
$vcdpluson;

initial
$monitor($time,"::  a=%b    b=%b    cin=%b  ::  sum=%b   cout=%b",a,b,cin,sum,cout);

endmodule


