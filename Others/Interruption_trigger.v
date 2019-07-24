
module Interruption_trigger
#(
	parameter QUANTUM = 256, // 0 -> 9 = 10
	parameter DEFAULT_WIDTH = 6,
	parameter TIMER_WIDTH = 5,
	parameter OFFSET_WIDTH = 16 
)
(
	input [(DEFAULT_WIDTH -1):0] offset,
	input proc_num, single_clk,
	input [(DEFAULT_WIDTH-1):0] opcode,
	output reg [(DEFAULT_WIDTH -1):0] intrpt_val, 
	output reg intrpt
);
	reg [(TIMER_WIDTH -1):0] timer;

	always @ ( posedge single_clk )
	begin
		case( opcode )
			// SWAP_PROCESS
			6'b100110:
			begin
				timer = 1'b0;
				intrpt = ( proc_num == 1'b0 ) ? 1'b0 : 1'b1;
				intrpt_val = 6'b000000;
			end
			// SYSCALL
			6'b111110:
			begin
				timer = 1'b0;
				intrpt = 1'b1;
				if( offset == 6'b000000 ) // syscall 0, reg[28] = 2, input
					intrpt_val = 6'b000010;
				else if( offset == 6'b000001 ) // syscall 1, reg[28] = 3, output
					intrpt_val = 6'b000011;
				else if( offset == 6'b000010 ) // syscall 2, reg[28] = 5, uart input
					intrpt_val = 6'b000101;
				else if( offset == 6'b000011 ) // syscall 3, reg[28] = 6, uart output
					intrpt_val = 6'b000110;
				else
					intrpt_val = 6'b000000;
			end
			// END_PROGRAM
			6'b111111:
			begin
				timer = 1'b0;
				intrpt = ( proc_num == 1'b0 ) ? 1'b0 : 1'b1;
				intrpt_val = ( proc_num == 1'b0 ) ? 6'b000000 : 6'b000100;
			end
			default:
			begin
				timer = ( timer == QUANTUM ) ? 1'b0 : timer + 1'b1;
				intrpt = ( timer == QUANTUM ) ? ( proc_num == 1'b0 ) ? 1'b0 : 1'b1 : 1'b0;
				intrpt_val = ( timer == QUANTUM ) ? ( proc_num == 1'b0 ) ? 6'b000000 : 6'b000001 : 6'b000000;
			end
		endcase
	end
	
endmodule 

