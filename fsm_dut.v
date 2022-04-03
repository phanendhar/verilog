module fsm10011(x, clk, reset,z);

input x,clk,reset;
output reg z;
parameter s0=3'b000, s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100;
reg[2:0] state;

always@(posedge clk or negedge reset)
if(!reset)
begin
z=0;
state=s0;
end
else
case(state)
s0: begin
        if(x)
         begin
          state= s1;
          z=0;
         end
        else
            begin
            state= s0;
            z=0;
            end
        end
s1:    begin
         if(x)
         begin
          state= s1;
          z=0;
         end
        else
          begin
          state= s2;
          z=0;
         end
          end
s2:     begin
          if(x)
           begin
          state= s1;
          z=0;
         end
         else
            begin
          state= s3;
          z=0;
         end
        end
s3:     begin
              if(x)
                begin
          state= s4;
          z=0;
         end
              else
                begin
          state= s0;
          z=0;
         end
         end
s4:      begin
             if(x)
                 begin
          state= s0;
          z=1;
         end
          else
          begin
          state= s2;
          z=0;
         end
         end
default: $display("please go for a valid value");
endcase
endmodule
