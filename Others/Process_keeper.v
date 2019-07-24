/*
single_clk - clk input
proc_swap - flag for process swapping
new_proc_num - number of new process to be executed
exec_proc - current process beeing executed by the system
*/

module Process_keeper
#(
	parameter PROC_WIDTH = 6
)
(
	input proc_swap, single_clk, true_intrpt,
	input [(PROC_WIDTH-1):0] new_proc_num,
	output [(PROC_WIDTH-1):0] exec_proc
);  
	
	reg [(PROC_WIDTH-1):0] proc_num;
	
	always @ ( posedge single_clk )
	begin
		if( true_intrpt )
			proc_num <= 6'b000000;
		else if( proc_swap ) 
			proc_num <= new_proc_num;
		else 
			proc_num <= proc_num + 1'b0;
	end
	
	assign exec_proc = proc_num;
	
endmodule 
