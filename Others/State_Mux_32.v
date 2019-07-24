/*
mux_select - control flag for mux output
input_data_1 - data 1, BIOS instruction
input_data_2 - data 2, instruction memory instruction
mux_output - module's output value
state - used for switching between bios output and instruction memory output
*/


module State_Mux_32
#(parameter DATA_WIDTH = 32)
(
	input mux_select, clk, rst, hlt,
	input [(DATA_WIDTH -1):0] input_data_1, input_data_2,
	output [(DATA_WIDTH -1):0] mux_output
);
	reg state;

	always @ ( posedge clk ) 	
	begin		
		case( state )
			1'b0:
			begin
				if( mux_select )
					state <= 1'b1;
			end
			1'b1: 
			begin
				if( rst )
					state <= 1'b0;
			end
		endcase
	end
	
	assign mux_output = (state == 1'b1) ? input_data_2 : input_data_1;
	
endmodule 
