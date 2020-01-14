module riseedge_mealy( rst, clk, rise,level);
input rst;
input clk;
input level;
output reg rise;
reg state_nxt;
parameter HIGH =1, LOWW=0;
always @(posedge clk or posedge rst)
begin : label1
if(rst)
begin : label2
state_nxt =LOWW;
rise =LOWW;
end
end
always@(level, rst)
begin : label3
if(!level)
begin : label4
state_nxt=LOWW;
rise = LOWW;
end
else 
if(level)
begin : label5
state_nxt=HIGH;
rise=HIGH;
end
end
endmodule

