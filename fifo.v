module fifo( clk, reset,rd,wr,w_data,empty,full,r_data);
parameter WIDTH=8,ADDRL=4;
input  clk;
input reset;
input rd;
input wr;
input  [WIDTH-1:0] w_data; 
output  empty; 
output full;
output  [WIDTH-1:0] r_data;

parameter [ADDRL-2:0]zero =3'b000, one =3'b001;

reg [WIDTH-1:0] array_reg [WIDTH-1:0];
reg [ADDRL-2:0] w_ptr_reg, w_ptr_next, w_ptr_succ;
reg [ADDRL-2:0]r_ptr_reg, r_ptr_next, r_ptr_succ;
reg full_reg, empty_reg, full_next, empty_next;
wire wr_en;


always @(posedge clk)
begin   
if(wr_en)
begin
array_reg[w_ptr_reg] <= w_data;
end 
end  
assign r_data = array_reg[r_ptr_reg];
assign wr_en = wr & ~full_reg; 	//   write when space is available in FIFO 

always @(posedge clk, posedge reset)
begin
if(reset)
begin
w_ptr_reg <= zero;
r_ptr_reg <= zero;
full_reg <= 1'b0;
empty_reg <= 1'b1;
end
else
begin
w_ptr_reg <= w_ptr_next;
r_ptr_reg <= r_ptr_next;
full_reg <= full_next;
empty_reg <= empty_next;
end
end   
always @ *
begin
w_ptr_succ = w_ptr_reg +1;
r_ptr_succ = r_ptr_reg +1;
w_ptr_next = w_ptr_reg;
r_ptr_next = r_ptr_reg;
full_next = full_reg;
empty_next = empty_reg;
case ({wr,rd})
2'b01 :  		//read
if (~empty_reg)
begin
r_ptr_next = r_ptr_succ;
full_next =1'b0;
if(r_ptr_succ==w_ptr_reg) //condition check for FIFO empty
empty_next =1'b1;
end
2'b10 :			//write
if(~full_reg)   
begin
w_ptr_next = w_ptr_succ;
empty_next = 1'b0;
if(w_ptr_succ==r_ptr_reg)	//condition check for FIFO full
full_next = 1'b1;
end
2'b11 :			//both
begin
w_ptr_next = w_ptr_succ;
r_ptr_next = r_ptr_succ;
end
endcase
end
assign full = full_reg;
assign empty = empty_reg;                  
endmodule
