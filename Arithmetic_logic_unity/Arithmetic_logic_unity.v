/*
op - operation code
data_1 - first operator
data_2 - second operator
result - result of the operation
zero - boolean flag for data_1 and data_2 equality
shamt - shift amount, mips standard
*/

module Arithmetic_logic_unity
#(
	parameter DATA_WIDTH = 32, 
	parameter OP_WIDTH = 5
)
(
	input [(OP_WIDTH-1):0] op, shamt,
	input [(DATA_WIDTH-1):0] data_1, data_2,
	output reg[(DATA_WIDTH-1):0] result,
	output zero
); 		

	wire[(DATA_WIDTH-1):0] n_zero; 
	
	assign n_zero = ( data_2 == 0 ) ? 1 : data_2;
	
	always @ ( * ) 
	begin
		case( op )
			5'b00000: result = data_1 + data_2;
			5'b00001: result = data_1 - data_2; 
			5'b00010: result = data_1 + 1; 
			5'b00011: result = data_1 - 1; 
			5'b00100: result = data_1 < data_2 ? 1 : 0; // set on less than
			5'b00101: result = data_1[15:0] * data_2[15:0]; 
			5'b00110: result = data_1 / n_zero; 
			5'b00111: result = data_1 << shamt;
			5'b01000: result = data_1 >> shamt;
			5'b01001: result = ~data_1; 
			5'b01010: result = data_1 & data_2; 
			5'b01011: result = data_1 | data_2; 
			5'b01100: result = data_1 ^ data_2; 
			5'b01101: result = data_1 <= data_2 ? 1 : 0; // set on less or equal than - slet
			5'b01110: result = data_1 == data_2 ? 1 : 0; // set on equal - seq
			5'b01111: result = data_1 != data_2 ? 1 : 0; // set on not equal - sneq
			5'b10000: result = { data_1[15:0], data_2[15:0] }; // concatenation
			default: result = 0;
		endcase
	end

	assign zero = ( result == 0 );
	
endmodule 