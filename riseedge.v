`timescale 1ns/1ns
module riseedge( rst, clk, rise,level);
input rst, clk, level;
output reg rise;
reg state_nxt;
parameter high =1, low=0;

always @(posedge clk or posedge rst)
begin

if(rst)
begin
state_nxt =low;
rise =low;
end
else if(level)
begin 
state_nxt= high;
rise =high;
end
else 
begin 
state_nxt =low;
rise=low;
end
end
endmodule

