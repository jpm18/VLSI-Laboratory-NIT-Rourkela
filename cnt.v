module cnt(clk, rst, d,q,load);
parameter  [3:0]THREE=3, ZERO=0, ONES=1;
input clk;
input rst; 
input load;
input [THREE:ZERO]d;
output reg [THREE:ZERO]q;
reg c;
always @(posedge clk)
begin : label1
if (rst)
begin : label2
q <=ZERO;
end
else 
if (load)
begin :label3
q <= d;
end
else 
begin : label4
{c,q} <= q+ONES;
end
end
endmodule



