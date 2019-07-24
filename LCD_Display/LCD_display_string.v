module LCD_display_string
(
	input [4:0] index,
	input [3:0] hex0,hex1,
	input [15:0] reg_msg,
	output reg [7:0] out
);

   always 
		case (reg_msg)
		16'b0000000000000000:
		begin
			case (index)
				5'h00: out <= 8'h57;
				5'h01: out <= 8'h65;
				5'h02: out <= 8'h6c;
				5'h03: out <= 8'h63;
				5'h04: out <= 8'h6f;
				5'h05: out <= 8'h6d;
				5'h06: out <= 8'h65;
				5'h07: out <= 8'h20;
				5'h08: out <= 8'h74;
				5'h09: out <= 8'h6f;
				5'h0A: out <= 8'h20;
				5'h0B: out <= 8'h42;
				5'h0C: out <= 8'h4d;
				5'h0D: out <= 8'h33;
				5'h0E: out <= 8'h32;
				5'h0F: out <= 8'h4f;
				5'h10: out <= 8'h53;
				5'h11: out <= 8'h20;
				5'h12: out <= 8'h53;
				5'h13: out <= 8'h79;
				5'h14: out <= 8'h73;
				5'h15: out <= 8'h74;
				5'h16: out <= 8'h65;
				5'h17: out <= 8'h6d;
				5'h18: out <= 8'h20;
			default: out <= 8'h20;
			endcase
		end
		16'b0000000000000001:
		begin
			case (index)
				5'h00: out <= 8'h4f;
				5'h01: out <= 8'h70;
				5'h02: out <= 8'h65;
				5'h03: out <= 8'h72;
				5'h04: out <= 8'h61;
				5'h05: out <= 8'h74;
				5'h06: out <= 8'h69;
				5'h07: out <= 8'h6f;
				5'h08: out <= 8'h6e;
				5'h09: out <= 8'h73;
				5'h0A: out <= 8'h3a;
				5'h0B: out <= 8'h20;
				5'h0C: out <= 8'h31;
				5'h0D: out <= 8'h2d;
				5'h0E: out <= 8'h70;
				5'h0F: out <= 8'h72;
				5'h10: out <= 8'h6f;
				5'h11: out <= 8'h63;
				5'h12: out <= 8'h2c;
				5'h13: out <= 8'h20;
				5'h14: out <= 8'h32;
				5'h15: out <= 8'h2d;
				5'h16: out <= 8'h66;
				5'h17: out <= 8'h69;
				5'h18: out <= 8'h6c;
				5'h19: out <= 8'h65;
				5'h1A: out <= 8'h20;
			
			default: out <= 8'h20;
			endcase
		end
		
		16'b0000000000000010:
		begin
			case (index)
				5'h00: out <= 8'h48;
				5'h01: out <= 8'h6f;
				5'h02: out <= 8'h77;
				5'h03: out <= 8'h20;
				5'h04: out <= 8'h6d;
				5'h05: out <= 8'h61;
				5'h06: out <= 8'h6e;
				5'h07: out <= 8'h79;
				5'h08: out <= 8'h20;
				5'h09: out <= 8'h66;
				5'h0A: out <= 8'h69;
				5'h0B: out <= 8'h6c;
				5'h0C: out <= 8'h65;
				5'h0D: out <= 8'h73;
				5'h0E: out <= 8'h20;
				5'h0F: out <= 8'h66;
				5'h10: out <= 8'h6f;
				5'h11: out <= 8'h20;
				5'h12: out <= 8'h65;
				5'h13: out <= 8'h78;
				5'h14: out <= 8'h65;
				5'h15: out <= 8'h63;
				5'h16: out <= 8'h75;
				5'h17: out <= 8'h74;
				5'h18: out <= 8'h65;
				5'h19: out <= 8'h3f;
				5'h1A: out <= 8'h20;
			default: out <= 8'h20;
			endcase
		end
		
		16'b0000000000000011:
		begin
			case (index)
				5'h00: out <= 8'h54;
				5'h01: out <= 8'h68;
				5'h02: out <= 8'h69;
				5'h03: out <= 8'h73;
				5'h04: out <= 8'h20;
				5'h05: out <= 8'h66;
				5'h06: out <= 8'h69;
				5'h07: out <= 8'h6c;
				5'h08: out <= 8'h65;
				5'h09: out <= 8'h20;
				5'h0A: out <= 8'h64;
				5'h0B: out <= 8'h6f;
				5'h0C: out <= 8'h65;
				5'h0D: out <= 8'h73;
				5'h0E: out <= 8'h20;
				5'h0F: out <= 8'h6e;
				5'h10: out <= 8'h6f;
				5'h11: out <= 8'h74;
				5'h12: out <= 8'h20;
				5'h13: out <= 8'h65;
				5'h14: out <= 8'h78;
				5'h15: out <= 8'h69;
				5'h16: out <= 8'h73;
				5'h17: out <= 8'h74;
				5'h18: out <= 8'h21;
				5'h19: out <= 8'h20;
			default: out <= 8'h20;
			endcase
		end
		
		16'b0000000000000100:
		begin
			case (index)
				5'h00: out <= 8'h52;
				5'h01: out <= 8'h75;
				5'h02: out <= 8'h6e;
				5'h03: out <= 8'h6e;
				5'h04: out <= 8'h69;
				5'h05: out <= 8'h6e;
				5'h06: out <= 8'h67;
				5'h07: out <= 8'h20;
				5'h08: out <= 8'h70;
				5'h09: out <= 8'h72;
				5'h0A: out <= 8'h6f;
				5'h0B: out <= 8'h63;
				5'h0C: out <= 8'h65;
				5'h0D: out <= 8'h73;
				5'h0E: out <= 8'h73;
				5'h0F: out <= 8'h65;
				5'h10: out <= 8'h73;
				5'h11: out <= 8'h2e;
				5'h12: out <= 8'h2e;
				5'h13: out <= 8'h2e;
				5'h14: out <= 8'h20;
			default: out <= 8'h20;
			endcase
		end
		
		16'b0000000000000101:
		begin
			case (index)
				5'h00: out <= 8'h41;
				5'h01: out <= 8'h6c;
				5'h02: out <= 8'h6c;
				5'h03: out <= 8'h20;
				5'h04: out <= 8'h70;
				5'h05: out <= 8'h72;
				5'h06: out <= 8'h6f;
				5'h07: out <= 8'h63;
				5'h08: out <= 8'h65;
				5'h09: out <= 8'h73;
				5'h0A: out <= 8'h73;
				5'h0B: out <= 8'h65;
				5'h0C: out <= 8'h73;
				5'h0D: out <= 8'h20;
				5'h0E: out <= 8'h66;
				5'h0F: out <= 8'h69;
				5'h10: out <= 8'h6e;
				5'h11: out <= 8'h69;
				5'h12: out <= 8'h73;
				5'h13: out <= 8'h68;
				5'h14: out <= 8'h65;
				5'h15: out <= 8'h64;
				5'h16: out <= 8'h20;
				5'h17: out <= 8'h72;
				5'h18: out <= 8'h75;
				5'h19: out <= 8'h6e;
				5'h1A: out <= 8'h6e;
				5'h1B: out <= 8'h69;
				5'h1C: out <= 8'h6e;
				5'h1D: out <= 8'h67;
				5'h1E: out <= 8'h20;
			
			default: out <= 8'h20;
			endcase
		end
		
		16'b0000000000000110:
		begin
			case (index)
				5'h00: out <= 8'h43;
				5'h01: out <= 8'h68;
				5'h02: out <= 8'h6f;
				5'h03: out <= 8'h6f;
				5'h04: out <= 8'h73;
				5'h05: out <= 8'h65;
				5'h06: out <= 8'h20;
				5'h07: out <= 8'h79;
				5'h08: out <= 8'h6f;
				5'h09: out <= 8'h75;
				5'h0A: out <= 8'h72;
				5'h0B: out <= 8'h20;
				5'h0C: out <= 8'h66;
				5'h0D: out <= 8'h69;
				5'h0E: out <= 8'h6c;
				5'h0F: out <= 8'h65;
				5'h10: out <= 8'h20;
				5'h11: out <= 8'h6f;
				5'h12: out <= 8'h70;
				5'h13: out <= 8'h65;
				5'h14: out <= 8'h72;
				5'h15: out <= 8'h61;
				5'h16: out <= 8'h74;
				5'h17: out <= 8'h69;
				5'h18: out <= 8'h6f;
				5'h19: out <= 8'h6e;
				5'h1A: out <= 8'h20;
			default: out <= 8'h20;
			endcase
		end
		
		16'b0000000000000111:
		begin
			case (index)
				5'h00: out <= 8'h31;
				5'h01: out <= 8'h20;
				5'h02: out <= 8'h2d;
				5'h03: out <= 8'h20;
				5'h04: out <= 8'h63;
				5'h05: out <= 8'h72;
				5'h06: out <= 8'h65;
				5'h07: out <= 8'h61;
				5'h08: out <= 8'h74;
				5'h09: out <= 8'h65;
				5'h0A: out <= 8'h2c;
				5'h0B: out <= 8'h20;
				5'h0C: out <= 8'h32;
				5'h0D: out <= 8'h20;
				5'h0E: out <= 8'h2d;
				5'h0F: out <= 8'h20;
				5'h10: out <= 8'h72;
				5'h11: out <= 8'h65;
				5'h12: out <= 8'h6e;
				5'h13: out <= 8'h61;
				5'h14: out <= 8'h6d;
				5'h15: out <= 8'h65;
				5'h16: out <= 8'h2c;
				5'h17: out <= 8'h20;
				5'h18: out <= 8'h33;
				5'h19: out <= 8'h20;
				5'h1A: out <= 8'h2d;
				5'h1B: out <= 8'h20;
				5'h1C: out <= 8'h64;
				5'h1D: out <= 8'h65;
				5'h1E: out <= 8'h6c;
				5'h1F: out <= 8'h65;
//				5'h10: out <= 8'h74;
//				5'h11: out <= 8'h65;
			default: out <= 8'h20;
			endcase
		end
		
		16'b0000000000001000:
		begin
			case (index)
				5'h00: out <= 8'h54;
				5'h01: out <= 8'h6f;
				5'h02: out <= 8'h6f;
				5'h03: out <= 8'h20;
				5'h04: out <= 8'h62;
				5'h05: out <= 8'h61;
				5'h06: out <= 8'h64;
				5'h07: out <= 8'h2c;
				5'h08: out <= 8'h20;
				5'h09: out <= 8'h68;
				5'h0A: out <= 8'h64;
				5'h0B: out <= 8'h20;
				5'h0C: out <= 8'h69;
				5'h0D: out <= 8'h73;
				5'h0E: out <= 8'h20;
				5'h0F: out <= 8'h66;
				5'h10: out <= 8'h75;
				5'h11: out <= 8'h6c;
				5'h12: out <= 8'h6c;
				5'h13: out <= 8'h21;
				5'h14: out <= 8'h20;
			default: out <= 8'h20;
			endcase
		end
		
		16'b0000000000001001:
		begin
			case (index)
				5'h00: out <= 8'h45;
				5'h01: out <= 8'h6d;
				5'h02: out <= 8'h74;
				5'h03: out <= 8'h65;
				5'h04: out <= 8'h72;
				5'h05: out <= 8'h20;
				5'h06: out <= 8'h66;
				5'h07: out <= 8'h69;
				5'h08: out <= 8'h6c;
				5'h09: out <= 8'h65;
				5'h0A: out <= 8'h27;
				5'h0B: out <= 8'h73;
				5'h0C: out <= 8'h20;
				5'h0D: out <= 8'h69;
				5'h0E: out <= 8'h6e;
				5'h0F: out <= 8'h73;
				5'h10: out <= 8'h74;
				5'h11: out <= 8'h72;
				5'h12: out <= 8'h75;
				5'h13: out <= 8'h63;
				5'h14: out <= 8'h74;
				5'h15: out <= 8'h69;
				5'h16: out <= 8'h6f;
				5'h17: out <= 8'h6e;
				5'h18: out <= 8'h20;
				5'h19: out <= 8'h61;
				5'h1A: out <= 8'h6d;
				5'h1B: out <= 8'h6f;
				5'h1C: out <= 8'h75;
				5'h1D: out <= 8'h6e;
				5'h1E: out <= 8'h74;
				5'h1F: out <= 8'h20;
			default: out <= 8'h20;
			endcase
		end
		
		16'b0000000000001010:
		begin
			case (index)
				5'h00: out <= 8'h49;
				5'h01: out <= 8'h6e;
				5'h02: out <= 8'h73;
				5'h03: out <= 8'h74;
				5'h04: out <= 8'h72;
				5'h05: out <= 8'h75;
				5'h06: out <= 8'h63;
				5'h07: out <= 8'h74;
				5'h08: out <= 8'h69;
				5'h09: out <= 8'h6f;
				5'h0A: out <= 8'h6e;
				5'h0B: out <= 8'h27;
				5'h0C: out <= 8'h73;
				5'h0D: out <= 8'h20;
				5'h0E: out <= 8'h66;
				5'h0F: out <= 8'h69;
				5'h10: out <= 8'h72;
				5'h11: out <= 8'h73;
				5'h12: out <= 8'h74;
				5'h13: out <= 8'h20;
				5'h14: out <= 8'h31;
				5'h15: out <= 8'h36;
				5'h16: out <= 8'h20;
				5'h17: out <= 8'h62;
				5'h18: out <= 8'h69;
				5'h19: out <= 8'h74;
				5'h1A: out <= 8'h73;
				5'h1B: out <= 8'h20;
			default: out <= 8'h20;
			endcase
		end
		
		16'b0000000000001011:
		begin
			case (index)
				5'h00: out <= 8'h49;
				5'h01: out <= 8'h6e;
				5'h02: out <= 8'h73;
				5'h03: out <= 8'h74;
				5'h04: out <= 8'h72;
				5'h05: out <= 8'h75;
				5'h06: out <= 8'h63;
				5'h07: out <= 8'h74;
				5'h08: out <= 8'h69;
				5'h09: out <= 8'h6f;
				5'h0A: out <= 8'h6e;
				5'h0B: out <= 8'h27;
				5'h0C: out <= 8'h73;
				5'h0D: out <= 8'h20;
				5'h0E: out <= 8'h6c;
				5'h0F: out <= 8'h61;
				5'h10: out <= 8'h73;
				5'h11: out <= 8'h74;
				5'h12: out <= 8'h20;
				5'h13: out <= 8'h31;
				5'h14: out <= 8'h36;
				5'h15: out <= 8'h20;
				5'h16: out <= 8'h62;
				5'h17: out <= 8'h69;
				5'h18: out <= 8'h74;
				5'h19: out <= 8'h73;
				5'h1A: out <= 8'h20;
			default: out <= 8'h20;
			endcase
		end
		
		16'b0000000000001100:
		begin
			case (index)
				5'h00: out <= 8'h49;
				5'h01: out <= 8'h6e;
				5'h02: out <= 8'h73;
				5'h03: out <= 8'h65;
				5'h04: out <= 8'h72;
				5'h05: out <= 8'h74;
				5'h06: out <= 8'h20;
				5'h07: out <= 8'h61;
				5'h08: out <= 8'h20;
				5'h09: out <= 8'h49;
				5'h0A: out <= 8'h44;
				5'h0B: out <= 8'h20;
				5'h0C: out <= 8'h66;
				5'h0D: out <= 8'h6f;
				5'h0E: out <= 8'h72;
				5'h0F: out <= 8'h20;
				5'h10: out <= 8'h74;
				5'h11: out <= 8'h68;
				5'h12: out <= 8'h65;
				5'h13: out <= 8'h20;
				5'h14: out <= 8'h6e;
				5'h15: out <= 8'h65;
				5'h16: out <= 8'h77;
				5'h17: out <= 8'h20;
				5'h18: out <= 8'h66;
				5'h19: out <= 8'h69;
				5'h1A: out <= 8'h6c;
				5'h1B: out <= 8'h65;
				5'h1C: out <= 8'h20;
			default: out <= 8'h20;
			endcase
		end
		
		16'b0000000000001101:
		begin
			case (index)
				5'h00: out <= 8'h4e;
				5'h01: out <= 8'h65;
				5'h02: out <= 8'h77;
				5'h03: out <= 8'h20;
				5'h04: out <= 8'h49;
				5'h05: out <= 8'h44;
				5'h06: out <= 8'h20;
				5'h07: out <= 8'h63;
				5'h08: out <= 8'h61;
				5'h09: out <= 8'h6e;
				5'h0A: out <= 8'h27;
				5'h0B: out <= 8'h74;
				5'h0C: out <= 8'h20;
				5'h0D: out <= 8'h61;
				5'h0E: out <= 8'h6c;
				5'h0F: out <= 8'h72;
				5'h10: out <= 8'h65;
				5'h11: out <= 8'h61;
				5'h12: out <= 8'h64;
				5'h13: out <= 8'h79;
				5'h14: out <= 8'h20;
				5'h15: out <= 8'h65;
				5'h16: out <= 8'h78;
				5'h17: out <= 8'h69;
				5'h18: out <= 8'h73;
				5'h19: out <= 8'h74;
				5'h1A: out <= 8'h21;
				5'h1B: out <= 8'h20;
			default: out <= 8'h20;
			endcase
		end
		
		16'b0000000000001110:
		begin
			case (index)
				5'h00: out <= 8'h46;
				5'h01: out <= 8'h69;
				5'h02: out <= 8'h6c;
				5'h03: out <= 8'h65;
				5'h04: out <= 8'h20;
				5'h05: out <= 8'h63;
				5'h06: out <= 8'h72;
				5'h07: out <= 8'h65;
				5'h08: out <= 8'h61;
				5'h09: out <= 8'h74;
				5'h0A: out <= 8'h65;
				5'h0B: out <= 8'h64;
				5'h0C: out <= 8'h20;
				5'h0D: out <= 8'h73;
				5'h0E: out <= 8'h75;
				5'h0F: out <= 8'h63;
				5'h10: out <= 8'h63;
				5'h11: out <= 8'h65;
				5'h12: out <= 8'h73;
				5'h13: out <= 8'h66;
				5'h14: out <= 8'h75;
				5'h15: out <= 8'h6c;
				5'h16: out <= 8'h6c;
				5'h17: out <= 8'h79;
				5'h18: out <= 8'h20;
			default: out <= 8'h20;
			endcase
		end
		
		16'b0000000000001111:
		begin
			case (index)
				5'h00: out <= 8'h43;
				5'h01: out <= 8'h68;
				5'h02: out <= 8'h6f;
				5'h03: out <= 8'h6f;
				5'h04: out <= 8'h73;
				5'h05: out <= 8'h65;
				5'h06: out <= 8'h20;
				5'h07: out <= 8'h61;
				5'h08: out <= 8'h20;
				5'h09: out <= 8'h66;
				5'h0A: out <= 8'h69;
				5'h0B: out <= 8'h6c;
				5'h0C: out <= 8'h65;
				5'h0D: out <= 8'h20;
				5'h0E: out <= 8'h74;
				5'h0F: out <= 8'h6f;
				5'h10: out <= 8'h20;
				5'h11: out <= 8'h62;
				5'h12: out <= 8'h65;
				5'h13: out <= 8'h20;
				5'h14: out <= 8'h72;
				5'h15: out <= 8'h65;
				5'h16: out <= 8'h6e;
				5'h17: out <= 8'h61;
				5'h18: out <= 8'h6d;
				5'h19: out <= 8'h65;
				5'h1A: out <= 8'h64;
				5'h1B: out <= 8'h20;
			default: out <= 8'h20;
			endcase
		end
		
		16'b0000000000010000:
		begin
			case (index)
				5'h00: out <= 8'h43;
				5'h01: out <= 8'h68;
				5'h02: out <= 8'h6f;
				5'h03: out <= 8'h6f;
				5'h04: out <= 8'h73;
				5'h05: out <= 8'h65;
				5'h06: out <= 8'h20;
				5'h07: out <= 8'h61;
				5'h08: out <= 8'h20;
				5'h09: out <= 8'h65;
				5'h0A: out <= 8'h78;
				5'h0B: out <= 8'h69;
				5'h0C: out <= 8'h73;
				5'h0D: out <= 8'h74;
				5'h0E: out <= 8'h65;
				5'h0F: out <= 8'h6e;
				5'h10: out <= 8'h74;
				5'h11: out <= 8'h20;
				5'h12: out <= 8'h66;
				5'h13: out <= 8'h69;
				5'h14: out <= 8'h6c;
				5'h15: out <= 8'h65;
				5'h16: out <= 8'h21;
				5'h17: out <= 8'h20;
			default: out <= 8'h20;
			endcase
		end
		
		16'b0000000000010001:
		begin
			case (index)
				5'h00: out <= 8'h43;
				5'h01: out <= 8'h68;
				5'h02: out <= 8'h6f;
				5'h03: out <= 8'h6f;
				5'h04: out <= 8'h73;
				5'h05: out <= 8'h65;
				5'h06: out <= 8'h20;
				5'h07: out <= 8'h74;
				5'h08: out <= 8'h68;
				5'h09: out <= 8'h65;
				5'h0A: out <= 8'h20;
				5'h0B: out <= 8'h6e;
				5'h0C: out <= 8'h65;
				5'h0D: out <= 8'h77;
				5'h0E: out <= 8'h20;
				5'h0F: out <= 8'h66;
				5'h10: out <= 8'h69;
				5'h11: out <= 8'h6c;
				5'h12: out <= 8'h65;
				5'h13: out <= 8'h20;
				5'h14: out <= 8'h49;
				5'h15: out <= 8'h44;
				5'h16: out <= 8'h20;
			default: out <= 8'h20;
			endcase
		end
		
		16'b0000000000010010:
		begin
			case (index)
				5'h00: out <= 8'h43;
				5'h01: out <= 8'h68;
				5'h02: out <= 8'h6f;
				5'h03: out <= 8'h73;
				5'h04: out <= 8'h65;
				5'h05: out <= 8'h6e;
				5'h06: out <= 8'h20;
				5'h07: out <= 8'h49;
				5'h08: out <= 8'h44;
				5'h09: out <= 8'h20;
				5'h0A: out <= 8'h6d;
				5'h0B: out <= 8'h75;
				5'h0C: out <= 8'h73;
				5'h0D: out <= 8'h74;
				5'h0E: out <= 8'h20;
				5'h0F: out <= 8'h62;
				5'h10: out <= 8'h65;
				5'h11: out <= 8'h20;
				5'h12: out <= 8'h75;
				5'h13: out <= 8'h6e;
				5'h14: out <= 8'h69;
				5'h15: out <= 8'h71;
				5'h16: out <= 8'h75;
				5'h17: out <= 8'h65;
				5'h18: out <= 8'h21;
				5'h19: out <= 8'h20;
			default: out <= 8'h20;
			endcase
		end
		
		16'b0000000000010011:
		begin
			case (index)
				5'h00: out <= 8'h46;
				5'h01: out <= 8'h69;
				5'h02: out <= 8'h6c;
				5'h03: out <= 8'h65;
				5'h04: out <= 8'h20;
				5'h05: out <= 8'h77;
				5'h06: out <= 8'h61;
				5'h07: out <= 8'h73;
				5'h08: out <= 8'h20;
				5'h09: out <= 8'h73;
				5'h0A: out <= 8'h75;
				5'h0B: out <= 8'h63;
				5'h0C: out <= 8'h63;
				5'h0D: out <= 8'h65;
				5'h0E: out <= 8'h73;
				5'h0F: out <= 8'h66;
				5'h10: out <= 8'h75;
				5'h11: out <= 8'h6c;
				5'h12: out <= 8'h6c;
				5'h13: out <= 8'h79;
				5'h14: out <= 8'h20;
				5'h15: out <= 8'h72;
				5'h16: out <= 8'h65;
				5'h17: out <= 8'h6e;
				5'h18: out <= 8'h61;
				5'h19: out <= 8'h6d;
				5'h1A: out <= 8'h65;
				5'h1B: out <= 8'h64;
				5'h1C: out <= 8'h20;
			default: out <= 8'h20;
			endcase
		end
		
		16'b0000000000010100:
		begin
			case (index)
				5'h00: out <= 8'h43;
				5'h01: out <= 8'h68;
				5'h02: out <= 8'h6f;
				5'h03: out <= 8'h6f;
				5'h04: out <= 8'h73;
				5'h05: out <= 8'h65;
				5'h06: out <= 8'h20;
				5'h07: out <= 8'h61;
				5'h08: out <= 8'h20;
				5'h09: out <= 8'h66;
				5'h0A: out <= 8'h69;
				5'h0B: out <= 8'h6c;
				5'h0C: out <= 8'h65;
				5'h0D: out <= 8'h20;
				5'h0E: out <= 8'h74;
				5'h0F: out <= 8'h6f;
				5'h10: out <= 8'h20;
				5'h11: out <= 8'h62;
				5'h12: out <= 8'h65;
				5'h13: out <= 8'h20;
				5'h14: out <= 8'h64;
				5'h15: out <= 8'h65;
				5'h16: out <= 8'h6c;
				5'h17: out <= 8'h65;
				5'h18: out <= 8'h74;
				5'h19: out <= 8'h65;
				5'h1A: out <= 8'h64;
				5'h1B: out <= 8'h20;
			default: out <= 8'h20;
			endcase
		end

    16'b0000000000010101:
		begin
			case (index)
				5'h00: out <= 8'h46;
				5'h01: out <= 8'h69;
				5'h02: out <= 8'h6c;
				5'h03: out <= 8'h65;
				5'h04: out <= 8'h20;
				5'h05: out <= 8'h77;
				5'h06: out <= 8'h61;
				5'h07: out <= 8'h73;
				5'h08: out <= 8'h20;
				5'h09: out <= 8'h73;
				5'h0A: out <= 8'h75;
				5'h0B: out <= 8'h63;
				5'h0C: out <= 8'h63;
				5'h0D: out <= 8'h65;
				5'h0E: out <= 8'h73;
				5'h0F: out <= 8'h66;
				5'h10: out <= 8'h75;
				5'h11: out <= 8'h6c;
				5'h12: out <= 8'h6c;
				5'h13: out <= 8'h79;
				5'h14: out <= 8'h20;
				5'h15: out <= 8'h64;
				5'h16: out <= 8'h65;
				5'h17: out <= 8'h6c;
				5'h18: out <= 8'h65;
				5'h19: out <= 8'h74;
				5'h1A: out <= 8'h65;
				5'h1B: out <= 8'h64;
				5'h1C: out <= 8'h20;
			default: out <= 8'h20;
			endcase
		end
		
		16'b0000000000010110: //- OK
		begin
			case (index)
			//______BIOS__________STARTING____
				5'h00: out <= 8'h5f;
				5'h01: out <= 8'h5f;
				5'h02: out <= 8'h5f;
				5'h03: out <= 8'h5f;
				5'h04: out <= 8'h5f;
				5'h05: out <= 8'h5f;
				5'h06: out <= 8'h42;
				5'h07: out <= 8'h49;
				5'h08: out <= 8'h4f;
				5'h09: out <= 8'h53;
				5'h0A: out <= 8'h5f;
				5'h0B: out <= 8'h5f;
				5'h0C: out <= 8'h5f;
				5'h0D: out <= 8'h5f;
				5'h0E: out <= 8'h5f;
				5'h0F: out <= 8'h5f;
				5'h10: out <= 8'h5f;
				5'h11: out <= 8'h5f;
				5'h12: out <= 8'h5f;
				5'h13: out <= 8'h5f;
				5'h14: out <= 8'h53;
				5'h15: out <= 8'h54;
				5'h16: out <= 8'h41;
				5'h17: out <= 8'h52;
				5'h18: out <= 8'h54;
				5'h19: out <= 8'h49;
				5'h1A: out <= 8'h4e;
				5'h1B: out <= 8'h47;
				5'h1C: out <= 8'h5f;
				5'h1D: out <= 8'h5f;
				5'h1E: out <= 8'h5f;
				5'h1F: out <= 8'h5f;
				default: out <= 8'h20;
			endcase
		end
		
		16'b0000000000010111: // - OK
		begin
			case (index)
				// Enter number 13
				5'h00: out <= 8'h45;
				5'h01: out <= 8'h6e;
				5'h02: out <= 8'h74;
				5'h03: out <= 8'h65;
				5'h04: out <= 8'h72;
				5'h05: out <= 8'h20;
				5'h06: out <= 8'h6e;
				5'h07: out <= 8'h75;
				5'h08: out <= 8'h6d;
				5'h09: out <= 8'h62;
				5'h0A: out <= 8'h65;
				5'h0B: out <= 8'h72;
				5'h0C: out <= 8'h20;
				5'h0D: out <= 8'h31;
				5'h0E: out <= 8'h33;
				5'h0F: out <= 8'h20;
				default: out <= 8'h20;
			endcase
		end
		
		16'b0000000000011000: // - OK
		begin
			case (index)
				//Please enter the required value!
				5'h00: out <= 8'h50;
				5'h01: out <= 8'h6c;
				5'h02: out <= 8'h65;
				5'h03: out <= 8'h61;
				5'h04: out <= 8'h73;
				5'h05: out <= 8'h65;
				5'h06: out <= 8'h20;
				5'h07: out <= 8'h65;
				5'h08: out <= 8'h6e;
				5'h09: out <= 8'h74;
				5'h0A: out <= 8'h65;
				5'h0B: out <= 8'h72;
				5'h0C: out <= 8'h20;
				5'h0D: out <= 8'h74;
				5'h0E: out <= 8'h68;
				5'h0F: out <= 8'h65;
				5'h10: out <= 8'h20;
				5'h11: out <= 8'h72;
				5'h12: out <= 8'h65;
				5'h13: out <= 8'h71;
				5'h14: out <= 8'h75;
				5'h15: out <= 8'h69;
				5'h16: out <= 8'h72;
				5'h17: out <= 8'h65;
				5'h18: out <= 8'h64;
				5'h19: out <= 8'h20;
				5'h1A: out <= 8'h76;
				5'h1B: out <= 8'h61;
				5'h1C: out <= 8'h6c;
				5'h1D: out <= 8'h75;
				5'h1E: out <= 8'h65;
				5'h1F: out <= 8'h21;

				default: out <= 8'h20;
			endcase
		end
		
		16'b0000000000011001: // - NOK
		begin
			case (index)
				//Memory access working
				5'h00: out <= 8'h4d;
				5'h01: out <= 8'h65;
				5'h02: out <= 8'h6d;
				5'h03: out <= 8'h6f;
				5'h04: out <= 8'h72;
				5'h05: out <= 8'h79;
				5'h06: out <= 8'h20;
				5'h07: out <= 8'h61;
				5'h08: out <= 8'h63;
				5'h09: out <= 8'h63;
				5'h0A: out <= 8'h65;
				5'h0B: out <= 8'h73;
				5'h0C: out <= 8'h73;
				5'h0D: out <= 8'h20;
				5'h0E: out <= 8'h77;
				5'h0F: out <= 8'h6f;
				5'h10: out <= 8'h72;
				5'h11: out <= 8'h6b;
				5'h12: out <= 8'h69;
				5'h13: out <= 8'h6e;
				5'h14: out <= 8'h67;
				5'h15: out <= 8'h20;
				default: out <= 8'h20;
			endcase
		end
		
		16'b0000000000011010: // - OK
		begin
			case (index)
				//Logical componentes working
				5'h00: out <= 8'h4c;
				5'h01: out <= 8'h6f;
				5'h02: out <= 8'h67;
				5'h03: out <= 8'h69;
				5'h04: out <= 8'h63;
				5'h05: out <= 8'h61;
				5'h06: out <= 8'h6c;
				5'h07: out <= 8'h20;
				5'h08: out <= 8'h63;
				5'h09: out <= 8'h6f;
				5'h0A: out <= 8'h6d;
				5'h0B: out <= 8'h70;
				5'h0C: out <= 8'h6f;
				5'h0D: out <= 8'h6e;
				5'h0E: out <= 8'h65;
				5'h0F: out <= 8'h6e;
				5'h10: out <= 8'h74;
				5'h11: out <= 8'h65;
				5'h12: out <= 8'h73;
				5'h13: out <= 8'h20;
				5'h14: out <= 8'h77;
				5'h15: out <= 8'h6f;
				5'h16: out <= 8'h72;
				5'h17: out <= 8'h6b;
				5'h18: out <= 8'h69;
				5'h19: out <= 8'h6e;
				5'h1A: out <= 8'h67;
				5'h1B: out <= 8'h20;
				default: out <= 8'h20;
			endcase
		end
		
		16'b0000000000011011: // - OK
		begin
			case (index)
				//OS will now be loaded from HD
				5'h00: out <= 8'h4f;
				5'h01: out <= 8'h53;
				5'h02: out <= 8'h20;
				5'h03: out <= 8'h77;
				5'h04: out <= 8'h69;
				5'h05: out <= 8'h6c;
				5'h06: out <= 8'h6c;
				5'h07: out <= 8'h20;
				5'h08: out <= 8'h6e;
				5'h09: out <= 8'h6f;
				5'h0A: out <= 8'h77;
				5'h0B: out <= 8'h20;
				5'h0C: out <= 8'h62;
				5'h0D: out <= 8'h65;
				5'h0E: out <= 8'h20;
				5'h0F: out <= 8'h6c;
				5'h10: out <= 8'h6f;
				5'h11: out <= 8'h61;
				5'h12: out <= 8'h64;
				5'h13: out <= 8'h65;
				5'h14: out <= 8'h64;
				5'h15: out <= 8'h20;
				5'h16: out <= 8'h66;
				5'h17: out <= 8'h72;
				5'h18: out <= 8'h6f;
				5'h19: out <= 8'h6d;
				5'h1A: out <= 8'h20;
				5'h1B: out <= 8'h48;
				5'h1C: out <= 8'h44;
				5'h1D: out <= 8'h20;
				default: out <= 8'h20;
			endcase
		end
		
		16'b0000000000011100: // - NOK
		begin
			case (index)
				//System will now be deployed :D
				5'h00: out <= 8'h53;
				5'h01: out <= 8'h79;
				5'h02: out <= 8'h73;
				5'h03: out <= 8'h74;
				5'h04: out <= 8'h65;
				5'h05: out <= 8'h6d;
				5'h06: out <= 8'h20;
				5'h07: out <= 8'h77;
				5'h08: out <= 8'h69;
				5'h09: out <= 8'h6c;
				5'h0A: out <= 8'h6c;
				5'h0B: out <= 8'h20;
				5'h0C: out <= 8'h6e;
				5'h0D: out <= 8'h6f;
				5'h0E: out <= 8'h77;
				5'h0F: out <= 8'h20;
				5'h10: out <= 8'h62;
				5'h11: out <= 8'h65;
				5'h12: out <= 8'h20;
				5'h13: out <= 8'h64;
				5'h14: out <= 8'h65;
				5'h15: out <= 8'h70;
				5'h16: out <= 8'h6c;
				5'h17: out <= 8'h6f;
				5'h18: out <= 8'h79;
				5'h19: out <= 8'h65;
				5'h1A: out <= 8'h64;
				5'h1B: out <= 8'h20;
				5'h1C: out <= 8'h3a;
				5'h1D: out <= 8'h44;
				5'h1E: out <= 8'h20;
				default: out <= 8'h20;
			endcase
		end
		
		16'b0000000000011101: // - NOK
		begin
			case (index)
				// Insert the file's ID's
				5'h00: out <= 8'h49;
				5'h01: out <= 8'h6e;
				5'h02: out <= 8'h73;
				5'h03: out <= 8'h65;
				5'h04: out <= 8'h72;
				5'h05: out <= 8'h74;
				5'h06: out <= 8'h20;
				5'h07: out <= 8'h74;
				5'h08: out <= 8'h68;
				5'h09: out <= 8'h65;
				5'h0A: out <= 8'h20;
				5'h0B: out <= 8'h66;
				5'h0C: out <= 8'h69;
				5'h0D: out <= 8'h6c;
				5'h0E: out <= 8'h65;
				5'h0F: out <= 8'h27;
				5'h10: out <= 8'h73;
				5'h11: out <= 8'h20;
				5'h12: out <= 8'h49;
				5'h13: out <= 8'h44;
				5'h14: out <= 8'h27;
				5'h15: out <= 8'h73;
				5'h16: out <= 8'h20;
				default: out <= 8'h20;
			endcase
		end
		
		16'b0000000000011110: // - NOK
		begin
			case (index)
				// Process requires input...
				5'h00: out <= 8'h50;
				5'h01: out <= 8'h72;
				5'h02: out <= 8'h6f;
				5'h03: out <= 8'h63;
				5'h04: out <= 8'h65;
				5'h05: out <= 8'h73;
				5'h06: out <= 8'h73;
				5'h07: out <= 8'h20;
				5'h08: out <= 8'h72;
				5'h09: out <= 8'h65;
				5'h0A: out <= 8'h71;
				5'h0B: out <= 8'h75;
				5'h0C: out <= 8'h69;
				5'h0D: out <= 8'h72;
				5'h0E: out <= 8'h65;
				5'h0F: out <= 8'h73;
				5'h10: out <= 8'h20;
				5'h11: out <= 8'h69;
				5'h12: out <= 8'h6e;
				5'h13: out <= 8'h70;
				5'h14: out <= 8'h75;
				5'h15: out <= 8'h74;
				5'h16: out <= 8'h2e;
				5'h17: out <= 8'h2e;
				5'h18: out <= 8'h2e;
				5'h19: out <= 8'h20;
				default: out <= 8'h20;
			endcase
		end
		
		16'b0000000000011111: // - NOK
		begin
			case (index)
				// Process requires output...
				5'h00: out <= 8'h50;
				5'h01: out <= 8'h72;
				5'h02: out <= 8'h6f;
				5'h03: out <= 8'h63;
				5'h04: out <= 8'h65;
				5'h05: out <= 8'h73;
				5'h06: out <= 8'h73;
				5'h07: out <= 8'h20;
				5'h08: out <= 8'h72;
				5'h09: out <= 8'h65;
				5'h0A: out <= 8'h71;
				5'h0B: out <= 8'h75;
				5'h0C: out <= 8'h69;
				5'h0D: out <= 8'h72;
				5'h0E: out <= 8'h65;
				5'h0F: out <= 8'h73;
				5'h10: out <= 8'h20;
				5'h11: out <= 8'h6f;
				5'h12: out <= 8'h75;
				5'h13: out <= 8'h74;
				5'h14: out <= 8'h70;
				5'h15: out <= 8'h75;
				5'h16: out <= 8'h74;
				5'h17: out <= 8'h2e;
				5'h18: out <= 8'h2e;
				5'h19: out <= 8'h2e;
				5'h1A: out <= 8'h20;
				default: out <= 8'h20;
			endcase
		end
		
		16'b0000000000100000: // - NOK
		begin
			case (index)
				// A process finished running
				5'h00: out <= 8'h41;
				5'h01: out <= 8'h20;
				5'h02: out <= 8'h70;
				5'h03: out <= 8'h72;
				5'h04: out <= 8'h6f;
				5'h05: out <= 8'h63;
				5'h06: out <= 8'h65;
				5'h07: out <= 8'h73;
				5'h08: out <= 8'h73;
				5'h09: out <= 8'h20;
				5'h0A: out <= 8'h66;
				5'h0B: out <= 8'h69;
				5'h0C: out <= 8'h6e;
				5'h0D: out <= 8'h69;
				5'h0E: out <= 8'h73;
				5'h0F: out <= 8'h68;
				5'h10: out <= 8'h65;
				5'h11: out <= 8'h64;
				5'h12: out <= 8'h20;
				5'h13: out <= 8'h72;
				5'h14: out <= 8'h75;
				5'h15: out <= 8'h6e;
				5'h16: out <= 8'h6e;
				5'h17: out <= 8'h69;
				5'h18: out <= 8'h6e;
				5'h19: out <= 8'h67;
				5'h1A: out <= 8'h20;
				default: out <= 8'h20;
			endcase
		end
		
		16'b0000000000100001:
		begin // A process requires uart input	
			case(index)
				5'h00: out <= 8'h41;
				5'h01: out <= 8'h20;
				5'h02: out <= 8'h70;
				5'h03: out <= 8'h72;
				5'h04: out <= 8'h6f;
				5'h05: out <= 8'h63;
				5'h06: out <= 8'h65;
				5'h07: out <= 8'h73;
				5'h08: out <= 8'h73;
				5'h09: out <= 8'h20;
				5'h0A: out <= 8'h72;
				5'h0B: out <= 8'h65;
				5'h0C: out <= 8'h71;
				5'h0D: out <= 8'h75;
				5'h0E: out <= 8'h69;
				5'h0F: out <= 8'h72;
				5'h10: out <= 8'h65;
				5'h11: out <= 8'h73;
				5'h12: out <= 8'h20;
				5'h13: out <= 8'h75;
				5'h14: out <= 8'h61;
				5'h15: out <= 8'h72;
				5'h16: out <= 8'h74;
				5'h17: out <= 8'h20;
				5'h18: out <= 8'h69;
				5'h19: out <= 8'h6e;
				5'h1A: out <= 8'h70;
				5'h1B: out <= 8'h75;
				5'h1C: out <= 8'h74;
				5'h1D: out <= 8'h20;
				default: out <= 8'h20;
			endcase
		end
		
		16'b0000000000100010:
		begin // A process requires uart output
			case(index)
				5'h00: out <= 8'h41;
				5'h01: out <= 8'h20;
				5'h02: out <= 8'h70;
				5'h03: out <= 8'h72;
				5'h04: out <= 8'h6f;
				5'h05: out <= 8'h63;
				5'h06: out <= 8'h65;
				5'h07: out <= 8'h73;
				5'h08: out <= 8'h73;
				5'h09: out <= 8'h20;
				5'h0A: out <= 8'h72;
				5'h0B: out <= 8'h65;
				5'h0C: out <= 8'h71;
				5'h0D: out <= 8'h75;
				5'h0E: out <= 8'h69;
				5'h0F: out <= 8'h72;
				5'h10: out <= 8'h65;
				5'h11: out <= 8'h73;
				5'h12: out <= 8'h20;
				5'h13: out <= 8'h75;
				5'h14: out <= 8'h61;
				5'h15: out <= 8'h72;
				5'h16: out <= 8'h74;
				5'h17: out <= 8'h20;
				5'h18: out <= 8'h6f;
				5'h19: out <= 8'h75;
				5'h1A: out <= 8'h74;
				5'h1B: out <= 8'h70;
				5'h1C: out <= 8'h75;
				5'h1D: out <= 8'h74;
				5'h1E: out <= 8'h20;
				default: out <= 8'h20;
			endcase
		end
		
		default:
			case (index)
				default: out <= 8'h20;
			endcase
			
		
     endcase 
	  
endmodule 








