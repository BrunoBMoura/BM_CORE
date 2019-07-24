module OUT (cent, 
			   dez, 
			   uni, 
			   hlt, 
			   cent_out, 
			   dez_out, 
			   uni_out);

	input hlt;
	input [3:0] cent, dez, uni;
	output [6:0] cent_out, dez_out, uni_out;
	
	Display centena_val(.in(cent), .out(cent_out), .hlt(hlt));
	Display dezena_val(.in(dez), .out(dez_out), .hlt(hlt));
	Display unidade_val(.in(uni), .out(uni_out), .hlt(hlt));

endmodule 