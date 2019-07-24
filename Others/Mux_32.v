module Mux_32
#(parameter DATA_WIDTH = 32)
(
	input mux_select,
	input [(DATA_WIDTH-1):0] input_data_1, input_data_2,
	output reg [(DATA_WIDTH-1):0] mux_output
);

	always @ ( * ) 
	begin
		case( mux_select )
			1'b0 : mux_output = input_data_1;
			1'b1 : mux_output = input_data_2;
		endcase
	end

endmodule
