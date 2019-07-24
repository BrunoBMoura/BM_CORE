module one_shot_button
(
	input clk, dbOut, 
	output reg one_shot_out
);

	reg state = 0;
	
	always @ ( posedge clk )
	begin
		if( state == 0 )
		begin
			one_shot_out = dbOut;
			if( dbOut == 0 )
				state = 1;
		end
		else
		begin
			one_shot_out = 1;
			if( dbOut == 1 )
				state = 0;
		end
	end

endmodule 