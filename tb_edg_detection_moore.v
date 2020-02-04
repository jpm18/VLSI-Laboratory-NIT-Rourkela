`timescale 1ns/1ns
module edge_detectionmealy
                   (input wire clk,reset,level,
		    output reg tick);
	
	localparam [1:0] zero=2'b00,one=2'b01;
      
          reg[1:0] state_reg,state_next;
 		always@ (posedge clk,posedge reset)
  			begin 
				if(reset)
					state_reg<=zero;
				else
					state_reg<=state_next;
			end

		always@ *
			begin 
				state_next=state_reg;
				tick=1'b0;
				case(state_reg)
			
			zero: begin
				if(level)
				state_next=one;
				//#1.5 
				tick=1'b1;
				end
			
			one:begin
				if(~level)
				state_next=zero;
				//tick=1'b1;
				#1 tick=1'b0;
				end
				

			default:state_next=zero;

		endcase
	end
endmodule
`timescale 1ns/1ns
 module tb_edge_mealy();
 	reg clk,reset=0,level=0;
	wire tick;

	edge_detectionmealy uut(.clk(clk),.reset(reset),.level(level),.tick(tick));
			 always begin
				   clk=0;
				   #2;
				   clk=1;
				   #2;
			  end
		
		initial
			begin
				reset=1;
				reset=0;
				
				#5;
				level=1;
				#2;
				level=0;
				#4;
				level=1;
				#4;
				level=0;
				#3;
				level=1;
				#12;
				level=0;
				
				//toggle
				#100 reset=1;
				#100 reset=0;
				#100 reset=1;
				#100 reset=0;
				
 				#250;
			        $finish;
 		end
		endmodule

