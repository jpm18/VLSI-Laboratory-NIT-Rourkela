`timescale 1ns/1ns

module tbFIFO();
reg clk, reset, rd,wr;
reg [7:0] w_data;
wire [7:0] r_data;
wire fill, empty;

fifo f1(clk, reset,rd,wr,w_data,empty,full,r_data);

always 
begin clk=1;
#10;
clk=0;
#10;
end

initial begin
reset=1;
wr=0;
rd=0; w_data =8'b00000000;
#20;
reset=0; wr=1;
w_data=8'b01000000;
#20;
w_data=8'b01000000;
#20;

w_data=8'b01000001;
#20;
w_data=8'b01000010;
#10;
//wr=0;
#20;
//rd=1;
#350;
rd=1; wr=0;
#120;
wr=1;
#20; 			//pre-delay to avoid setup time violation
w_data=8'b01100010;#290;
$finish;
end
endmodule
