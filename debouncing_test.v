`timescale 1ms/1ms
module debouncing_test();
   reg clk;reg rst=0; reg sw=0;
   wire db;

 db_fsm uut(.clk(clk),.rst(rst),.sw(sw),.db(db));

 always begin
   clk=0;
   #10;
   clk=1;
   #10;
  end
//initial begin $monitor($time,"rst=%b,db=%b,sw=%b",rst,db,sw);end

 initial
    begin
       rst=1;
	sw=0;
        #20;
	sw=0;
       rst=0;
       #20;
       sw=1;

       #20;
       sw=0;//1

       #60;
       sw=1;

	#40;
        sw=0;
  
        #80;
	sw=1;

	
       #20;
       sw=0;

       #40;
       sw=1;	//2
	
	#20;
	sw=0;
   
        #60;
	 sw=1;
 	
	#60;
       sw=0;

       #60;
       sw=1;

	#40;
        sw=0;
  
        #60;
	sw=1;

	
       #50;
       sw=0;

       #100;
       sw=1;	
	
	#40;
	sw=0;/////////////////////////

       #100;////////////////////
       sw=1;

	#20;
        sw=0;
  
        #20;
	sw=1;

	 #20;
       sw=0;

       #60;sw=0;

       #80;
       sw=1;

	#20;
        sw=0;
  
        #20;
	sw=1;

	
       #10;
       sw=0;

       #10;
       sw=1;	
	
	#5;
	sw=0;
   
        #60;
	 sw=1;
 	
	#100;
       sw=0;

       #40;
       sw=1;

	#20;
        sw=0;
  
        #20;
	sw=1;

	
       #40;
       sw=0;

       #20;
       sw=1;	
	
	#40;
	sw=0;

       #80;
       sw=1;

	#40;
        sw=0;
  
        #60;
	sw=1;

	 #100;
       sw=1;

       #120;
       sw=0;

       #40;
       sw=1;

	#140;
        sw=0;
  
        #20;
	sw=1;

	
       #120;
       sw=0;

      
	#1000
       $finish;
  
        

end
endmodule


  
   
  
