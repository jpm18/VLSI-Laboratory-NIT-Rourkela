`timescale 1ns/1ns
module fifo
#( parameter b=8,w=4)
(input wire clk,reset,
 input wire rd,wr,
input wire [b-1:0]w_data,
output wire empty,full,
output wire [b-1:0]r_data);

reg [b-1:0]array_reg[2**w-1:0];
reg [w-1:0]w_ptr_reg,w_ptr_next,w_ptr_succ;
reg [w-1:0]r_ptr_reg,r_ptr_next,r_ptr_succ;
reg full_reg,empty_reg,full_next,empty_next;
wire wr_en;

	always @(posedge clk)
		if(wr_en)
			array_reg[w_ptr_reg]<=w_data;
			assign r_data=array_reg[r_ptr_reg];
			assign wr_en=wr & ~full_reg;

				always@(posedge clk,posedge reset)
								if(reset)
									begin
										w_ptr_reg=0;
										r_ptr_reg=0;
										full_reg<=1'b0;
										empty_reg<= 1'b0;
									end
						else 
							 begin
							  w_ptr_reg<= w_ptr_next;
							   r_ptr_reg<= r_ptr_next;
							   full_reg<=full_next;
							   empty_reg<=empty_next;
							 end

				always@*
					begin
					w_ptr_succ=w_ptr_reg+1;
					r_ptr_succ=r_ptr_reg+1;
					w_ptr_next=w_ptr_reg;
					r_ptr_next=r_ptr_reg;
					full_next=full_reg;
					empty_next=empty_reg;

							case({wr,rd})
							//2'b00:
							2'b01:  if(~empty_reg)
								begin
								r_ptr_next=r_ptr_succ;
								full_next=1'b0;
								if(r_ptr_succ==w_ptr_reg)
								empty_next=1'b1;
								end

							2'b10: if(~full_reg)
								begin
								w_ptr_next=w_ptr_succ;
								empty_reg=1'b0;
								if(w_ptr_succ==r_ptr_reg)
								full_next=1'b1;
							       end

							2'b11:  begin
								w_ptr_next=w_ptr_succ;
								r_ptr_next=w_ptr_succ;
								end

	endcase
	end
	assign full=full_reg;
	assign empty=empty_reg;
	endmodule




						//testbench code:
`timescale 1ns/1ns
module fifo_test
#(parameter b=8,w=4)();
reg clk=0;
reg reset,rd,wr;
reg [b-1:0]w_data;
wire empty,full;
wire [b-1:0]r_data;

fifo uut(.clk(clk),.reset(reset),.rd(rd),.wr(wr),.w_data(w_data),.empty(empty),.full(full),.r_data(r_data));
always
#30 clk=~clk;
initial
	begin
		reset=0;reset=1;
		rd=1;wr=0;
		w_data=8'b00001111;
		#20;

		reset=0;
		rd=0;wr=1;
		w_data=8'b00001101;
		#10;

		reset=0;
		rd=0;wr=1;
		w_data=8'b00001100;
		#10;

		reset=0;
		rd=0;wr=1;
		w_data=8'b00110011;
		#5;

		reset=0;
		rd=0;wr=1;
		w_data=8'b10000011;
		#5;

		reset=0;
		rd=0;wr=1;
		w_data=8'b10110011;
		#10;

		reset=0;
		rd=0;wr=1;
		w_data=8'b00110000;
		#20;

		reset=0;
		rd=0;wr=1;
		w_data=8'b11110011;
		#10;

		reset=0;
		rd=0;wr=1;
		w_data=8'b00001101;
		#10;

		reset=0;
		rd=0;wr=1;
		w_data=8'b00001100;
		#10;

		reset=0;
		rd=0;wr=1;
		w_data=8'b00110011;
		#5;

		reset=0;
		rd=0;wr=1;
		w_data=8'b10000011;
		#5;

		reset=0;
		rd=0;wr=1;
		w_data=8'b10110011;
		#10;

		reset=0;
		rd=0;wr=1;
		w_data=8'b00110000;
		#20;

		reset=0;
		rd=0;wr=1;
		w_data=8'b11110011;
		#10;
reset=0;
		rd=0;wr=1;
		w_data=8'b00001101;
		#10;

		reset=0;
		rd=0;wr=1;
		w_data=8'b00001100;
		#10;

		reset=0;
		rd=0;wr=1;
		w_data=8'b00110011;
		#5;

		reset=0;
		rd=0;wr=1;
		w_data=8'b10000011;
		#5;

		reset=0;
		rd=0;wr=1;
		w_data=8'b10110011;
		#10;

		reset=0;
		rd=0;wr=1;
		w_data=8'b00110000;
		#20;

		reset=0;
		rd=0;wr=1;
		w_data=8'b11110011;
		#10;
reset=0;
		rd=0;wr=1;
		w_data=8'b00001101;
		#10;

		reset=0;
		rd=0;wr=1;
		w_data=8'b00001100;
		#10;

		reset=0;
		rd=0;wr=1;
		w_data=8'b00110011;
		#5;

		reset=0;
		rd=0;wr=1;
		w_data=8'b10000011;
		#5;

		reset=0;
		rd=0;wr=1;
		w_data=8'b10110011;
		#10;

		reset=0;
		rd=0;wr=1;
		w_data=8'b00110000;
		#20;

		reset=0;
		rd=0;wr=1;
		w_data=8'b11110011;
		#10;
reset=0;
		rd=0;wr=1;
		w_data=8'b00001101;
		#10;

		reset=0;
		rd=0;wr=1;
		w_data=8'b00001100;
		#10;

		reset=0;
		rd=0;wr=1;
		w_data=8'b00110011;
		#5;

		reset=0;
		rd=0;wr=1;
		w_data=8'b10000011;
		#5;

		reset=0;
		rd=0;wr=1;
		w_data=8'b10110011;
		#10;

		reset=0;
		rd=0;wr=1;
		w_data=8'b00110000;
		#20;

		reset=0;
		rd=0;wr=1;
		w_data=8'b11110011;
		#10;
reset=0;
		rd=0;wr=1;
		w_data=8'b00001101;
		#10;

		reset=0;
		rd=0;wr=1;
		w_data=8'b00001100;
		#10;

		reset=0;
		rd=0;wr=1;
		w_data=8'b00110011;
		#5;

		reset=0;
		rd=0;wr=1;
		w_data=8'b10000011;
		#5;

		reset=0;
		rd=0;wr=1;
		w_data=8'b10110011;
		#10;

		reset=0;
		rd=0;wr=1;
		w_data=8'b00110000;
		#20;

		reset=0;
		rd=0;wr=1;
		w_data=8'b11110011;
		#10;
		
end
endmodule



	
	
