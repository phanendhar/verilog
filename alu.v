module alu_design(A,B,CTRL,CLK,RST,R,O,N,Z);
parameter n=16;
input signed [n-1:0] A,B;
input [1:0] CTRL;
input CLK, RST;
output reg signed [n-1:0] R;
//reg signed [n:0] t;
output reg O, N, Z;
reg temp;
always@(posedge CLK or negedge RST)

  if(!RST)
    begin 
    R=0;
    O=1'b0;
    N=1'b0; 
    Z=1'b0;
    end
  
  else

    begin

    case(CTRL)
    2'b00: 
    
    begin
         {temp,R}=A+B; N=R[n-1]; 
         O = temp^R[n-1];
    end
    
    2'b01: 
    begin 
    {temp,R}=A-B; N=R[n-1]; 
    O = temp^R[n-1];
    end
    
    2'b10: begin R=A&B; O=1'b0; N=R[n-1]; end
    2'b11: begin R=A|B; O=1'b0; N=R[n-1]; end
    endcase

    Z=((R==0)?1'b1:1'b0);
    end
  endmodule



