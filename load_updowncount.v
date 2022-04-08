module priority_en_ex(d,q,clk,rst,load,countup,countdown);
  parameter N=3;
  input [N:0] d;
  input clk,rst,load,countup,countdown;
  output reg [N:0] q;
  
  always@(posedge clk or negedge rst)
   begin
    if(!rst)
      q<=0;
    else
      begin
     if(load)
        q <= d;
  else if(~load&&countup)
        q <= q+1;
  else if(~load&&~countup&&countdown)
        q <= q-1;
  else
        q <= q;
  
    /*3'bxx1: q<=d;
        3'bx10: q<=q+1;
        3'b100: q<=q-1;
        default: q<=q;
      endcase*/
      end
   end
endmodule 
