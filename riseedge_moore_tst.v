`timescale 1ns/1ns
module riseedge_moore_tst;
reg clk,rst,level;
wire tick;

riseedge_moore a1(clk,rst,level,tick);

always 
begin
clk<=0; #10;
clk <=1; #10;
end

initial
begin
#5; rst=1; #10;
rst=0; #10;
level=1; #22;
level=0; #500;
rst=1; #10;
$finish;

end
endmodule
