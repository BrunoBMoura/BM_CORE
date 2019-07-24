module Extender_16_32
#(
	parameter INPUT_SIZE = 16, 
	parameter OUTPUT_SIZE = 32
)
(
	input [(INPUT_SIZE-1):0] ext_input,
	output reg [(OUTPUT_SIZE-1):0] ext_output
);

	always @ ( * ) 
	begin
		if( ext_input[15] == 1'b1 )
			ext_output = {{16{1'b1}}, ext_input};
		else
			ext_output = {{16{1'b0}}, ext_input};
	end
	
endmodule 


