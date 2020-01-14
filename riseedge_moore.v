`timescale 1ns/1ns
module riseedge_moore(clk,rst,level,tick);
input wire clk, rst, level;
output reg tick;

parameter [1:0] zero =2'b00,edg =2'b01, one=2'b10;

reg [1:0] state_pr, state_nxt;

always @(posedge clk, posedge rst)
begin 
if(rst)
begin
state_pr=zero;
state_nxt=zero;
end
else
state_pr=state_nxt;

end


always@ (posedge clk)
begin 

case (state_pr)

zero : begin
        tick =1'b0;	
	state_nxt=(!rst)?(level)?edg:zero:zero;
	end
edg  : begin tick=1'b1;
	 state_nxt=(!rst)?(level)?one:zero:zero;
	end
one  : begin 
	state_nxt=(!rst)?(level)?one:zero:zero;
	tick =1'b0;
	end
default : state_nxt=zero;
endcase
end 
endmodule
