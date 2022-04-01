module full_add(a,b,cin,sum,cout);

input a,b,cin;
output sum,cout;
wire a1,b1,cin1,w1,w2,w3,w4,w5,w6,w7;
not n1(a1,a);
not n2(b1,b);
not n3(cin1,cin);
and a11(w1,a,b,cin);
and a2(w2,a1,b1,cin);
and a3(w3,a1,b,cin1);
and a4(w4,a,b1,cin1);
and a5(w5,a,b);
and a6(w6,b,cin);
and a7(w7,cin,a);
or o1(sum,w1,w2,w3,w4);
or o2(cout,w5,w6,w7);

endmodule

