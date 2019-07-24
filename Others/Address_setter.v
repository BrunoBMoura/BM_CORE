module Address_setter
#(
	parameter ADDR_WIDTH = 5,
	parameter SHIFT_CONTROL = 2
)
(
	input single_clk,
	input [(SHIFT_CONTROL-1):0] change_shift,
	output write_shift_enabler, read_shift_enabler
);

	reg read_shift, write_shift; 

	always @ ( posedge single_clk )
	begin
		// changes write_shift
		if( ( change_shift == 2'b01 ) && ( write_shift == 1'b0) ) 
		begin
			write_shift <= 1'b1;
		end
		else if( ( change_shift == 2'b01 ) && ( write_shift == 1'b1) )
		begin
			write_shift <= 1'b0;
		end
		
		// changes read_shift
		else if( ( change_shift == 2'b11 ) && ( read_shift == 1'b0) )
		begin
			read_shift <= 1'b1;
		end
		else if( ( change_shift == 2'b11 ) && ( read_shift == 1'b1) )
		begin
			read_shift <= 1'b0;
		end
		
	end
	
	assign write_shift_enabler = write_shift;
	assign read_shift_enabler = read_shift;
	
	
	
endmodule
	