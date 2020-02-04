`timescale 1ns/1ns
module edge_detectionmoore
                   (input wire clk,reset,level,
		    output reg tick);
	
	localparam [1:0] zero=2'b00,edg=2'b01,one=2'b10;
      
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

			zero:if(level)

				state_next=edg;
			edg: begin
				tick=1'b1;
				if(level)
					state_next=one;
				else
					state_next=zero;
				end
			
			one:if(~level)
				state_next=zero;

			default:state_next=zero;

		endcase
	end
endmodule


