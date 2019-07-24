/*
clk_in - auto clock
clk_out - divided clock
*/

module Frequency_divider
#(
	parameter DATA_WIDTH = 32,
	parameter DIV_FACTOR = 100
)
(
	input clk_in,
	output reg clk_out
);

	reg[(DATA_WIDTH-1):0] clk_val;

	always @ ( posedge clk_in )
	begin
		clk_val <= clk_val + 1'b1;
		if( clk_val == DIV_FACTOR )
		begin
			clk_val <= 0;
			clk_out <= ~clk_out;
		end	
	end
	
endmodule	
