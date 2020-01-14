`timescale 1ns/1ns

module riseedgetest;
reg clk, rst, level;
wire rise;

riseedge r1(rst, clk, rise,level);
always
begin 
#5;clk <= 0;
#5; clk <=1;
end

always
begin 
#128; level <=0; 
#115; level <=1; 
end

initial
begin
#5; rst=1;
#25; rst=0;
#1000;
$finish;
end
endmodule


