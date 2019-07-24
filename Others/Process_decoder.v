/*
input_exec_proc - current number of process beeing executed 
output_exec_proc - decoded process number for instruction memory since it only has 2 data regions

*/

module Process_decoder
#(
	parameter PROC_WIDTH = 6
)
(
	input [(PROC_WIDTH-1):0] input_exec_proc, 
	output output_exec_proc
);
	
	assign output_exec_proc = ( input_exec_proc == 6'b0 ) ? 1'b0 : 1'b1;

endmodule 