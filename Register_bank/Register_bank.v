/*
read_address_1 - rs
read_address_2 - rt
write_addres - rd
data_write - data that may be written to rd address
write_flag - flag thet checks if write will occur
clk_write - divided clock
data_1 - upper module output
data_2 - lower module output
data_3 - data for hd usage
hlt - halt signal used for output
jal - flag for jump and link
PC - value stored for jump and link
PROC_PC - value stored for context swap
value_address - content of display_address
read/write_shift_enablers - self explanatory
pc_operation - flag for pc storage due to context swap
intrpt - interruption value for software treatment
*/

module Register_bank
#(
	parameter ADDR_WIDTH = 5, 
	parameter INTRPT_WIDTH = 6,
	parameter DATA_WIDTH = 32,
	parameter SIGNAL_WIDTH = 2
)
(
	input write_flag, clk_write, hlt, jal, read_shift_enabler, write_shift_enabler,	
	input [(SIGNAL_WIDTH-1):0] pc_operation,
	input [(INTRPT_WIDTH-1):0] intrpt,
	input [(DATA_WIDTH-1):0] PC, PROC_PC,
	input [(ADDR_WIDTH-1):0] write_address, read_address_1, read_address_2,
	input [(DATA_WIDTH-1):0] data_write,
	output [(DATA_WIDTH-1):0] data_1, data_2, data_3, 
	output [(DATA_WIDTH-1):0] value_address
);	
	reg [(DATA_WIDTH-1):0] rb[(2*(DATA_WIDTH)-1):0];
	
	always @ ( posedge clk_write ) 
	begin	
		if( jal ) 
		begin
			// reg[31] = PC + 1
			rb[ 5'b11111 + ( DATA_WIDTH * write_shift_enabler ) ] <= PC + 1'b1;
		end			
		else if( write_flag ) 
		begin
			rb[ write_address + ( DATA_WIDTH * write_shift_enabler ) ] <= data_write;
		end
		
		if( intrpt )
		begin
			// reg[28] <= interruption
			rb[ 5'b11100 ] <= intrpt;
		end
		else if ( pc_operation == 2'b01)
		begin
			rb[ 5'b11100 ] <= PROC_PC;
		end
		
	end
	
	assign data_1 = rb[ read_address_1 + ( DATA_WIDTH * read_shift_enabler ) ];
	assign data_2 = rb[ read_address_2 + ( DATA_WIDTH * read_shift_enabler ) ];
	assign data_3 = rb[ write_address + ( DATA_WIDTH * read_shift_enabler ) ];
	
	// output treatment
	assign value_address = (hlt) ? rb[read_address_1 + ( DATA_WIDTH * read_shift_enabler ) ] : 32'b0;
	
endmodule 

