`timescale 1ns/1ns
module counttest;
reg d, load, clk,rst;
wire [3:0]q;
cnt a1(clk, rst, d,q,load);
always
begin
clk<=0;
#20; 
clk<=1;
#20;
end

initial
begin
#10; rst =1;
#15; rst =0; load =1; d=1;
#12; load =0;
#85;
#5000;
rst=1;
#500;
$finish;
end
endmodule  
 


