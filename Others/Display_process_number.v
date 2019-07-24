module Display_process_number
#(parameter DATA_WIDTH = 32)
(
	input single_clk,
	input [(DATA_WIDTH-1):0] new_proc_num,
	output reg [(DATA_WIDTH-1):0] last_proc_num
);
	reg [(DATA_WIDTH-1):0] proc_num;

	always @ ( posedge single_clk )
	begin
		if( new_proc_num != 32'b00000000000000000000000000000000 )
		begin
			proc_num <= new_proc_num;
			last_proc_num <= new_proc_num;
		end
		else begin
			last_proc_num <= proc_num;
		end
	end

endmodule 