/*
zero - zero signal from the ALU
bm_select - BigMux output selector
beq - branch on equal flag
bneq - branch on not equal flag
ext_sum - extended offset bits
ext_signal - extended instruction bits
reg_bank_upper_data - output data from upper RegBank output (jump to register)
pc_out - program counter output
bm_out - BigMux output data
*/

module Big_mux
#(
	parameter DATA_WIDTH = 32, 
	parameter SIGNAL_WIDTH = 2
)
(
	input zero, beq, bneq,
	input [(SIGNAL_WIDTH-1):0]  bm_select,
	input [(DATA_WIDTH-1):0]  pc_out, ext_sum, ext_signal, reg_bank_upper_data,
	output reg [(DATA_WIDTH-1):0] bm_out
);			
	
//	always @ ( * )
	always @ ( pc_out or ext_sum or ext_signal or reg_bank_upper_data or zero or bm_select or beq or bneq ) 
	begin
		bm_out <= 32'b0;
		case( bm_select )
			2'b01: // branchs
			begin	
				if( ( bneq == 1 ) && ( zero == 1 ) )
					bm_out <= pc_out;
				else if( ( bneq == 1 ) && ( zero == 0 ) )
					bm_out <= ext_sum;
				else if( ( beq == 1 ) && ( zero == 1 ) )
					bm_out <= ext_sum;
				else if( ( beq == 1 ) && ( zero == 0 ) )
					bm_out <= pc_out;
			end
			
			2'b10: bm_out <= ext_signal; // jump
			
			2'b11 : bm_out <= reg_bank_upper_data; // jump to register 
			
			default: bm_out <= pc_out; 
			
		endcase
	end

endmodule


