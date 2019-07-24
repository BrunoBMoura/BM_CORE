/*
address - next address
clk - clock
reset - reset flag
jump - jump flag
beq - branch on equal flag
bneq - branch on not equal flag
hlt - halt flag
prog_count - PC value for the actual process
zero - zero signal from the ALU
new_proc_num - hardware process number
*/



module Program_counter
#(
	parameter DATA_WIDTH = 32,
	parameter SIGNAL_WIDTH = 2
)
(
	input [(SIGNAL_WIDTH-1):0] pc_operation, 
	input clk_write, rst, jmp, hlt, zero, bneq, beq, proc_num,// decoded_exec_num
	input [(DATA_WIDTH-1):0] address, stored_pc,
	output [(DATA_WIDTH-1):0] prog_count, 
	output [(DATA_WIDTH-1):0] only_proc_pc
);			
	
	reg [(DATA_WIDTH-1):0] os_pc;
	reg [(DATA_WIDTH-1):0] proc_pc;
  
	always @ ( posedge clk_write ) 
	begin
		// OS pc
		if( proc_num == 1'b0 )
		begin
			// doesn't execute the branch
			if( ( bneq == 1 ) && ( zero == 1 ) )
				os_pc <= address + 1'b1;	
			
			//	executes the branch
			else if( ( bneq == 1 ) && ( zero == 0 ) )
				os_pc  <= address;	
			
			//	executes the branch
			else if( ( beq == 1 ) && ( zero == 1 ) )
				os_pc  <= address;	
			
			// doesn't execute the branch
			else if( ( beq == 1 ) && ( zero == 0 ) )
				os_pc  <= address + 1'b1;	
			
			else if( jmp )
				os_pc <= address;
			 
			else if( hlt ) begin
				end
				 
			else 
				os_pc <= address + 1'b1;
			
			if( rst ) 
				os_pc <= 0;
			
			// setpc
			if( pc_operation == 2'b10 )
				proc_pc <= stored_pc; 
				
		end
		// process pc
		else begin
			if(bneq == 1 && zero == 1)
				proc_pc <= address + 1'b1;
		
			else if(bneq == 1 && zero == 0)
				proc_pc  <= address;	
			
			else if(beq == 1 && zero == 1)
				proc_pc  <= address;	
			
			else if(beq == 1 && zero == 0 )
				proc_pc  <= address + 1'b1;
			
			else if(jmp)
				proc_pc <= address;
			 
			else if(hlt) begin
				end
				 
			else 
				proc_pc <= address + 1'b1;
			
			if(rst) 
				proc_pc <= 0;
		end
			
	end
	
	assign prog_count = ( proc_num == 1'b1 ) ? proc_pc : os_pc;
	assign only_proc_pc = proc_pc;
	
endmodule



			