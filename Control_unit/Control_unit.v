/*
check - signal for input usage
clk - cocl
opcode - operation code
PRBM_select - pre-regbank mux selection
bm_select - big mux selection
PAM_select - pre-ALU mux selection
hlt, jmp, rst, beq, bneq, jal - pc flags
PDMM_select - post-data mem mux selection
write_data_mem, stck - datamem write and stack usage flags
write_reg - RegBank write flag
alu_code - operation code for ALU
input_mux_select - input control signal
*/

module Control_unit
#(
	parameter OP_WIDTH = 6, 
	parameter ALU_OP_WIDTH = 5, 
	parameter SIGNAL_WIDTH = 2
)
(
	input check,
	input [(OP_WIDTH-1):0] opcode,
	output reg PRBM_select,										
	output reg PAM_select,								
	output reg [(SIGNAL_WIDTH-1):0] bm_select,						
	output reg hlt, jmp, rst, beq, bneq, jal,		
	output reg PDMM_select,										
	output reg write_data_mem, stck,									
	output reg write_reg,											
	output reg[(ALU_OP_WIDTH-1):0] alu_code,							
	output reg input_mux_select,
	//os related flags
	output reg bios_mem_mux_select, write_instr_mem, 
	output reg load_os, HDRM_select, write_hd, lcd_trd_msg, proc_swap, 
	output reg [(SIGNAL_WIDTH-1):0] change_shift, pc_operation,
	// network communication flags
	output reg send, receive
	
);

	always @ ( * ) 
	begin
		case( opcode )
			6'b000000: //ADD - OK - 0
			begin 
				PRBM_select = 1'b1;
				PAM_select = 1'b0;
				bm_select = 2'b00;
				PDMM_select = 1'b1;
				input_mux_select = 1'b0;
				alu_code = 5'b00000; 
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				jal = 1'b0;
				rst = 1'b0;
				write_data_mem = 1'b0;
				stck = 1'b0;
				write_reg = 1'b1;
				// OS
				bios_mem_mux_select = 1'b0;
				write_instr_mem = 1'b0;
				proc_swap = 1'b0;
				load_os = 1'b0;
				HDRM_select = 1'b0;
				write_hd = 1'b0;
				lcd_trd_msg = 1'b0;
				change_shift = 2'b00;
				pc_operation = 2'b00;
				// NET
				send = 1'b0;
				receive = 1'b0;
			end
			
			6'b000001: //SUB - OK - 1
			begin 
				PRBM_select = 1'b1;
				PAM_select = 1'b0 ;
				bm_select = 2'b00;
				PDMM_select = 1'b1;
				input_mux_select = 1'b0;
				alu_code = 5'b00001; 
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				jal = 1'b0;
				rst = 1'b0;
				write_data_mem = 1'b0;
				stck = 1'b0;
				write_reg = 1'b1;
				// OS
				bios_mem_mux_select = 1'b0;
				write_instr_mem = 1'b0;
				proc_swap = 1'b0;
				load_os = 1'b0;
				HDRM_select = 1'b0;
				write_hd = 1'b0;
				lcd_trd_msg = 1'b0;
				change_shift = 2'b00;
				pc_operation = 2'b00;
				// NET
				send = 1'b0;
				receive = 1'b0;
			end
			
			6'b000010: //ADDI - OK - 2
			begin 
				PRBM_select = 1'b0;
				PAM_select = 1'b1;
				bm_select = 2'b00;
				PDMM_select = 1'b1;
				input_mux_select = 1'b0;
				alu_code = 5'b00000; 
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				jal = 1'b0;
				rst = 1'b0;
				write_data_mem = 1'b0;
				stck = 1'b0;
				write_reg = 1'b1;
				// OS
				bios_mem_mux_select = 1'b0;
				write_instr_mem = 1'b0;
				proc_swap = 1'b0;
				load_os = 1'b0;
				HDRM_select = 1'b0;
				write_hd = 1'b0;
				lcd_trd_msg = 1'b0;
				change_shift = 2'b00;
				pc_operation = 2'b00;
				// NET
				send = 1'b0;
				receive = 1'b0;
			end
			
			6'b000011: //SUBI - OK - 3
			begin 
				PRBM_select = 1'b0;
				PAM_select = 1'b1;
				bm_select = 2'b00;
				PDMM_select = 1'b1;
				input_mux_select = 1'b0;
				alu_code = 5'b00001; 
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				jal = 1'b0;
				rst = 1'b0;
				write_data_mem = 1'b0;
				stck = 1'b0;
				write_reg = 1'b1;
				// OS
				bios_mem_mux_select = 1'b0;
				write_instr_mem = 1'b0;
				proc_swap = 1'b0;
				load_os = 1'b0;
				HDRM_select = 1'b0;
				write_hd = 1'b0;
				lcd_trd_msg = 1'b0;
				change_shift = 2'b00;
				pc_operation = 2'b00;
				// NET
				send = 1'b0;
				receive = 1'b0;
			end
			
			6'b000100://INC - OK - 4
			 begin 
				PRBM_select = 1'b0;
				PAM_select = 1'b1;
				bm_select = 2'b00;
				PDMM_select = 1'b1;
				input_mux_select = 1'b0;
				alu_code = 5'b00010; 
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				jal = 1'b0;
				rst = 1'b0;
				write_data_mem = 1'b0;
				stck = 1'b0;
				write_reg = 1'b1;
				// OS
				bios_mem_mux_select = 1'b0;
				write_instr_mem = 1'b0;
				proc_swap = 1'b0;
				load_os = 1'b0;
				HDRM_select = 1'b0;
				write_hd = 1'b0;
				lcd_trd_msg = 1'b0;
				change_shift = 2'b00;
				pc_operation = 2'b00;
				// NET
				send = 1'b0;
				receive = 1'b0;
			end
			
			6'b000101: //DEC - OK - 5
			begin 
				PRBM_select = 1'b0;
				PAM_select = 1'b1;
				bm_select = 2'b00;
				PDMM_select = 1'b1;
				input_mux_select = 1'b0;
				alu_code = 5'b00011; 
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				jal = 1'b0;
				rst = 1'b0;
				write_data_mem = 1'b0;
				stck = 1'b0;
				write_reg = 1'b1;
				// OS
				bios_mem_mux_select = 1'b0;
				write_instr_mem = 1'b0;
				proc_swap = 1'b0;
				load_os = 1'b0;
				HDRM_select = 1'b0;
				write_hd = 1'b0;
				lcd_trd_msg = 1'b0;
				change_shift = 2'b00;
				pc_operation = 2'b00;
				// NET
				send = 1'b0;
				receive = 1'b0;
			end
			
			6'b000110: //SLT - OK - 6
			begin 
				PRBM_select = 1'b1;
				PAM_select = 1'b0;
				bm_select = 2'b00;
				PDMM_select = 1'b1;
				input_mux_select = 1'b0;
				alu_code = 5'b00100; 
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				jal = 1'b0;
				rst = 1'b0;
				write_data_mem = 1'b0;
				stck = 1'b0;
				write_reg = 1'b1;
				// OS
				bios_mem_mux_select = 1'b0;
				write_instr_mem = 1'b0;
				proc_swap = 1'b0;
				load_os = 1'b0;
				HDRM_select = 1'b0;
				write_hd = 1'b0;
				lcd_trd_msg = 1'b0;
				change_shift = 2'b00;
				pc_operation = 2'b00;
				// NET
				send = 1'b0;
				receive = 1'b0;
			end
			
			6'b000111: //SHFL - OK - 7
			begin 
				PRBM_select = 1'b1;
				PAM_select = 1'b0;
				bm_select = 2'b00;
				PDMM_select = 1'b1;
				input_mux_select = 1'b0;
				alu_code = 5'b00111; 
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				jal = 1'b0;
				rst = 1'b0;
				write_data_mem = 1'b0;
				stck = 1'b0;
				write_reg = 1'b1;
				// OS
				bios_mem_mux_select = 1'b0;
				write_instr_mem = 1'b0;
				proc_swap = 1'b0;
				load_os = 1'b0;
				HDRM_select = 1'b0;
				write_hd = 1'b0;
				lcd_trd_msg = 1'b0;
				change_shift = 2'b00;
				pc_operation = 2'b00;
				// NET
				send = 1'b0;
				receive = 1'b0;
			end
			
			6'b001000: //SHFR - OK - 8
			begin 
				PRBM_select = 1'b1;
				PAM_select = 1'b0;
				bm_select = 2'b00;
				PDMM_select = 1'b1;
				input_mux_select = 1'b0;
				alu_code = 5'b01000; 
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				jal = 1'b0;
				rst = 1'b0;
				write_data_mem = 1'b0;
				stck = 1'b0;
				write_reg = 1'b1;
				// OS
				bios_mem_mux_select = 1'b0;
				write_instr_mem = 1'b0;
				proc_swap = 1'b0;
				load_os = 1'b0;
				HDRM_select = 1'b0;
				write_hd = 1'b0;
				lcd_trd_msg = 1'b0;
				change_shift = 2'b00;
				pc_operation = 2'b00;
				// NET
				send = 1'b0;
				receive = 1'b0;
			end
			
			6'b001001: //NOT - OK - 9
			begin 
				PRBM_select = 1'b1;
				PAM_select = 1'b0;
				bm_select = 2'b00;
				PDMM_select = 1'b1;
				input_mux_select = 1'b0;
				alu_code = 5'b01001; 
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				jal = 1'b0;
				rst = 1'b0;
				write_data_mem = 1'b0;
				stck = 1'b0;
				write_reg = 1'b1;
				// OS
				bios_mem_mux_select = 1'b0;
				write_instr_mem = 1'b0;
				proc_swap = 1'b0;
				load_os = 1'b0;
				HDRM_select = 1'b0;
				write_hd = 1'b0;
				lcd_trd_msg = 1'b0;
				change_shift = 2'b00;
				pc_operation = 2'b00;
				// NET
				send = 1'b0;
				receive = 1'b0;
			end
			
			6'b001010: //AND - OK - 10
			begin 	
				PRBM_select = 1'b1;
				PAM_select = 1'b0;
				bm_select = 2'b00;
				PDMM_select = 1'b1;
				input_mux_select = 1'b0;
				alu_code = 5'b01010; 
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				jal = 1'b0;
				rst = 1'b0;
				write_data_mem = 1'b0;
				stck = 1'b0;
				write_reg = 1'b1;
				// OS
				bios_mem_mux_select = 1'b0;
				write_instr_mem = 1'b0;
				proc_swap = 1'b0;
				load_os = 1'b0;
				HDRM_select = 1'b0;
				write_hd = 1'b0;
				lcd_trd_msg = 1'b0;
				change_shift = 2'b00;
				pc_operation = 2'b00;
				// NET
				send = 1'b0;
				receive = 1'b0;
			end
			
			6'b001011: //OR - OK - 11
			begin 
				PRBM_select = 1'b1;
				PAM_select = 1'b0;
				bm_select = 2'b00;
				PDMM_select = 1'b1;
				input_mux_select = 1'b0;
				alu_code = 5'b01011; 
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				jal = 1'b0;
				rst = 1'b0;
				write_data_mem = 1'b0;
				stck = 1'b0;
				write_reg = 1'b1;
				// OS
				bios_mem_mux_select = 1'b0;
				write_instr_mem = 1'b0;
				proc_swap = 1'b0;
				load_os = 1'b0;
				HDRM_select = 1'b0;
				write_hd = 1'b0;
				lcd_trd_msg = 1'b0;
				change_shift = 2'b00;
				pc_operation = 2'b00;
				// NET
				send = 1'b0;
				receive = 1'b0;
			end
			
			6'b001100: //XOR - OK - 12
			begin 
				PRBM_select = 1'b1;
				PAM_select = 1'b0;
				bm_select = 2'b00;
				PDMM_select = 1'b1;
				input_mux_select = 1'b0;
				alu_code = 5'b01100; 
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				jal = 1'b0;
				rst = 1'b0;
				write_data_mem = 1'b0;
				stck = 1'b0;
				write_reg = 1'b1;
				// OS
				bios_mem_mux_select = 1'b0;
				write_instr_mem = 1'b0;
				proc_swap = 1'b0;
				load_os = 1'b0;
				HDRM_select = 1'b0;
				write_hd = 1'b0;
				lcd_trd_msg = 1'b0;
				change_shift = 2'b00;
				pc_operation = 2'b00;
				// NET
				send = 1'b0;
				receive = 1'b0;
			end
			
			6'b001101: //MULT- OK - 13
			begin 
				PRBM_select = 1'b1;
				PAM_select = 1'b0;
				bm_select = 2'b00;
				PDMM_select = 1'b1;
				input_mux_select = 1'b0;
				alu_code = 5'b00101; 
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				jal = 1'b0;
				rst = 1'b0;
				write_data_mem = 1'b0;
				stck = 1'b0;
				write_reg = 1'b1;
				// OS
				bios_mem_mux_select = 1'b0;
				write_instr_mem = 1'b0;
				proc_swap = 1'b0;
				load_os = 1'b0;
				HDRM_select = 1'b0;
				write_hd = 1'b0;
				lcd_trd_msg = 1'b0;
				change_shift = 2'b00;
				pc_operation = 2'b00;
				// NET
				send = 1'b0;
				receive = 1'b0;
			end
			
			6'b001110: //DIV - OK - 14
			begin 
				PRBM_select = 1'b1;
				PAM_select = 1'b0;
				bm_select = 2'b00;
				PDMM_select = 1'b1;
				input_mux_select = 1'b0;
				alu_code = 5'b00110; 
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				jal = 1'b0;
				rst = 1'b0;
				write_data_mem = 1'b0;
				stck = 1'b0;
				write_reg = 1'b1;
				// OS
				bios_mem_mux_select = 1'b0;
				write_instr_mem = 1'b0;
				proc_swap = 1'b0;
				load_os = 1'b0;
				HDRM_select = 1'b0;
				write_hd = 1'b0;
				lcd_trd_msg = 1'b0;
				change_shift = 2'b00;
				pc_operation = 2'b00;
				// NET
				send = 1'b0;
				receive = 1'b0;
			end
			6'b001111: //LD - OK - 15
			begin 
				PRBM_select = 1'b0;
				PAM_select = 1'b1;
				bm_select = 2'b00;
				PDMM_select = 1'b0;
				input_mux_select = 1'b0;
				alu_code = 5'b00000; 
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				jal = 1'b0;
				rst = 1'b0;
				write_data_mem = 1'b0;
				stck = 1'b0;
				write_reg = 1'b1;
				// OS
				bios_mem_mux_select = 1'b0;
				write_instr_mem = 1'b0;
				proc_swap = 1'b0;
				load_os = 1'b0;
				HDRM_select = 1'b0;
				write_hd = 1'b0;
				lcd_trd_msg = 1'b0;
				change_shift = 2'b00;
				pc_operation = 2'b00;
				// NET
				send = 1'b0;
				receive = 1'b0;
			end
			
			6'b010000: 
			begin //LDI - OK - 16
				PRBM_select = 1'b0;
				PAM_select = 1'b1;
				bm_select = 2'b00;
				PDMM_select = 1'b1;
				input_mux_select = 1'b0;
				alu_code = 5'b00000; 
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				jal = 1'b0;
				rst = 1'b0;
				write_data_mem = 1'b0;
				stck = 1'b0;
				write_reg = 1'b1;
				// OS
				bios_mem_mux_select = 1'b0;
				write_instr_mem = 1'b0;
				proc_swap = 1'b0;
				load_os = 1'b0;
				HDRM_select = 1'b0;
				write_hd = 1'b0;
				lcd_trd_msg = 1'b0;
				change_shift = 2'b00;
				pc_operation = 2'b00;
				// NET
				send = 1'b0;
				receive = 1'b0;
			end
			6'b010001: //STR - OK - 17 ;D
			 begin 
				PRBM_select = 1'b0;
				PAM_select = 1'b1;
				bm_select = 2'b00;
				PDMM_select = 1'b0;
				input_mux_select = 1'b0;
				alu_code = 5'b00000; 
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				jal = 1'b0;
				rst = 1'b0;
				write_data_mem = 1'b1;
				stck = 1'b0;
				write_reg = 1'b0;
				// OS
				bios_mem_mux_select = 1'b0;
				write_instr_mem = 1'b0;
				proc_swap = 1'b0;
				load_os = 1'b0;
				HDRM_select = 1'b0;
				write_hd = 1'b0;
				lcd_trd_msg = 1'b0;
				change_shift = 2'b00;
				pc_operation = 2'b00;
				// NET
				send = 1'b0;
				receive = 1'b0;
			end
			
			6'b010010: 
			begin //BEQ - OK - 18
				PRBM_select = 1'b0;
				PAM_select = 1'b0;
				bm_select = 2'b01;
				PDMM_select = 1'b0;
				input_mux_select = 1'b0;
				alu_code = 5'b00001; 
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b1;
				bneq = 1'b0;
				jal = 1'b0;
				rst = 1'b0;
				write_data_mem = 1'b0;
				stck = 1'b0;
				write_reg = 1'b0;
				// OS
				bios_mem_mux_select = 1'b0;
				write_instr_mem = 1'b0;
				proc_swap = 1'b0;
				load_os = 1'b0;
				HDRM_select = 1'b0;
				write_hd = 1'b0;
				lcd_trd_msg = 1'b0;
				change_shift = 2'b00;
				pc_operation = 2'b00;
				// NET
				send = 1'b0;
				receive = 1'b0;
			end
			
			6'b010011: 
			begin //BNEQ - OK - 19
				PRBM_select = 1'b0;
				PAM_select = 1'b0;
				bm_select = 2'b01;
				PDMM_select = 1'b0;
				input_mux_select = 1'b0;
				alu_code = 5'b00001; 
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b1;
				jal = 1'b0;
				rst = 1'b0;
				write_data_mem = 1'b0;
				stck = 1'b0;
				write_reg = 1'b0;
				// OS
				bios_mem_mux_select = 1'b0;
				write_instr_mem = 1'b0;
				proc_swap = 1'b0;
				load_os = 1'b0;
				HDRM_select = 1'b0;
				write_hd = 1'b0;
				lcd_trd_msg = 1'b0;
				change_shift = 2'b00;
				pc_operation = 2'b00;
				// NET
				send = 1'b0;
				receive = 1'b0;
			end
			
			6'b010100: 
			begin //JMP - OK - 20
				PRBM_select = 1'b0;
				PAM_select = 1'b0;
				bm_select = 2'b10;
				PDMM_select = 1'b0;
				input_mux_select = 1'b0;
				alu_code = 5'b00010; 
				hlt = 1'b0;
				jmp = 1'b1;
				beq = 1'b0;
				bneq = 1'b0;
				jal = 1'b0;
				rst = 1'b0;
				write_data_mem = 1'b0;
				stck = 1'b0;
				write_reg = 1'b0;
				// OS
				bios_mem_mux_select = 1'b0;
				write_instr_mem = 1'b0;
				proc_swap = 1'b0;
				load_os = 1'b0;
				HDRM_select = 1'b0;
				write_hd = 1'b0;
				lcd_trd_msg = 1'b0;
				change_shift = 2'b00;
				pc_operation = 2'b00;
				// NET
				send = 1'b0;
				receive = 1'b0;
			end
			
			6'b010101: 
			begin //JMPR - OK - 21
				PRBM_select = 1'b0;
				PAM_select = 1'b0;
				bm_select = 2'b11;
				PDMM_select = 1'b0;
				input_mux_select = 1'b0;
				alu_code = 5'b00000; 
				hlt = 1'b0;
				jmp = 1'b1;
				beq = 1'b0;
				bneq = 1'b0;
				jal = 1'b0;
				rst = 1'b0;
				write_data_mem = 1'b0;
				stck = 1'b0;
				write_reg = 1'b0;
				// OS
				bios_mem_mux_select = 1'b0;
				write_instr_mem = 1'b0;
				proc_swap = 1'b0;
				load_os = 1'b0;
				HDRM_select = 1'b0;
				write_hd = 1'b0;
				lcd_trd_msg = 1'b0;
				change_shift = 2'b00;
				pc_operation = 2'b00;
				// NET
				send = 1'b0;
				receive = 1'b0;
			end
			
			6'b010110: 
			begin //NOP - OK - 22 
				PRBM_select = 1'b1;
				PAM_select = 1'b0;
				bm_select = 2'b00;
				PDMM_select = 1'b1;
				input_mux_select = 1'b0;
				alu_code = 5'b00000; 
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				jal = 1'b0;
				rst = 1'b0;
				write_data_mem = 1'b0;
				stck = 1'b0;
				write_reg = 1'b0;  
				// OS
				bios_mem_mux_select = 1'b0;
				write_instr_mem = 1'b0;
				proc_swap = 1'b0;
				load_os = 1'b0;
				HDRM_select = 1'b0;
				write_hd = 1'b0;
				lcd_trd_msg = 1'b0;
				change_shift = 2'b00;
				pc_operation = 2'b00;
				// NET
				send = 1'b0;
				receive = 1'b0;
			end
			
			6'b010111:
			begin //hlt - OK - 23
				PRBM_select = 1'b0;
				PAM_select = 1'b0;
				bm_select = 2'b00;
				PDMM_select = 1'b0;
				input_mux_select = 1'b0;
				alu_code = 5'b00000; 
				hlt = 1'b1;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				jal = 1'b0;
				rst = 1'b0;
				write_data_mem = 1'b0;
				stck = 1'b0;
				write_reg = 1'b0;
				// OS
				bios_mem_mux_select = 1'b0;
				write_instr_mem = 1'b0;
				proc_swap = 1'b0;
				load_os = 1'b0;
				HDRM_select = 1'b0;
				write_hd = 1'b0;
				lcd_trd_msg = 1'b0;
				change_shift = 2'b00;
				pc_operation = 2'b00;
				// NET
				send = 1'b0;
				receive = 1'b0;
			end
			
			6'b011000: 
			begin //IN - OK - 24
				PRBM_select = 1'b0;
				PAM_select = 1'b1;
				bm_select = 2'b00;
				PDMM_select = 1'b1;
				input_mux_select = 1'b1;
				alu_code = 5'b00000; 
				if(check)
					hlt = 1'b0;
				else
					hlt = 1'b1;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				jal = 1'b0;
				rst = 1'b0;
				write_data_mem = 1'b0;
				stck = 1'b0;
				write_reg = 1'b1;
				// OS
				bios_mem_mux_select = 1'b0;
				write_instr_mem = 1'b0;
				proc_swap = 1'b0;
				load_os = 1'b0;
				HDRM_select = 1'b0;
				write_hd = 1'b0;
				lcd_trd_msg = 1'b0;
				change_shift = 2'b00;	
				pc_operation = 2'b00;
				// NET
				send = 1'b0;
				receive = 1'b0;
			end
				
			6'b011001: 
			begin //OUT - OK - 25
				PRBM_select = 1'b1;
				PAM_select = 1'b0;
				bm_select = 2'b00;
				PDMM_select = 1'b1;
				input_mux_select = 1'b0;
				alu_code = 5'b00000; 
				if(check)
					hlt = 1'b0;
				else
					hlt = 1'b1;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				jal = 1'b0;
				rst = 1'b0;
				write_data_mem = 1'b0;
				stck = 1'b0;
				write_reg = 1'b0;
				// OS
				bios_mem_mux_select = 1'b0;
				write_instr_mem = 1'b0;
				proc_swap = 1'b0;
				load_os = 1'b0;
				HDRM_select = 1'b0;
				write_hd = 1'b0;
				lcd_trd_msg = 1'b0;
				change_shift = 2'b00;	
				pc_operation = 2'b00;
				// NET
				send = 1'b0;
				receive = 1'b0;
			end
			
			6'b011010: 
			begin //JAL - OK - 26
				PRBM_select = 1'b0;
				PAM_select = 1'b0;
				bm_select = 2'b10;
				PDMM_select = 1'b0;
				input_mux_select = 1'b0;
				alu_code = 5'b00010; 
				hlt = 1'b0;
				jmp = 1'b1;
				beq = 1'b0;
				bneq = 1'b0;
				jal = 1'b1;
				rst = 1'b0;
				write_data_mem = 1'b0;
				stck = 1'b0;
				write_reg = 1'b0;
				// OS
				bios_mem_mux_select = 1'b0;
				write_instr_mem = 1'b0;
				proc_swap = 1'b0;
				load_os = 1'b0;
				HDRM_select = 1'b0;
				write_hd = 1'b0;
				lcd_trd_msg = 1'b0;
				change_shift = 2'b00;
				pc_operation = 2'b00;
				// NET
				send = 1'b0;
				receive = 1'b0;
			end
			
			6'b011011: 
			begin // PUSH - 27
				PRBM_select = 1'b0;
				PAM_select = 1'b1;
				bm_select = 2'b00;
				PDMM_select = 1'b0;
				input_mux_select = 1'b0;
				alu_code = 5'b00000; 
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				jal = 1'b0;
				rst = 1'b0;
				write_data_mem = 1'b1;
				stck = 1'b1; //
				write_reg = 1'b0;
				// OS
				bios_mem_mux_select = 1'b0;
				write_instr_mem = 1'b0;
				proc_swap = 1'b0;
				load_os = 1'b0;
				HDRM_select = 1'b0;
				write_hd = 1'b0;
				lcd_trd_msg = 1'b0;
				change_shift = 2'b00;
				pc_operation = 2'b00;
				// NET
				send = 1'b0;
				receive = 1'b0;
			end
			
			6'b011100: 
			begin // POP - 28
				PRBM_select = 1'b0;
				PAM_select = 1'b1;
				bm_select = 2'b00;
				PDMM_select = 1'b0;
				input_mux_select = 1'b0;
				alu_code = 5'b00000; 
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				jal = 1'b0;
				rst = 1'b0;
				write_data_mem = 1'b0;
				stck = 1'b1; // 
				write_reg = 1'b1;
				// OS
				bios_mem_mux_select = 1'b0;
				write_instr_mem = 1'b0;
				proc_swap = 1'b0;
				load_os = 1'b0;
				HDRM_select = 1'b0;
				write_hd = 1'b0;
				lcd_trd_msg = 1'b0;
				change_shift = 2'b00;
				pc_operation = 2'b00;
				// NET
				send = 1'b0;
				receive = 1'b0;
			end
			
			6'b011101: 
			begin //SLET - OK - 29
				PRBM_select = 1'b1;
				PAM_select = 1'b0;
				bm_select = 2'b00;
				PDMM_select = 1'b1;
				input_mux_select = 1'b0;
				alu_code = 5'b01101; 
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				jal = 1'b0;
				rst = 1'b0;
				write_data_mem = 1'b0;
				stck = 1'b0;
				write_reg = 1'b1;
				// OS
				bios_mem_mux_select = 1'b0;
				write_instr_mem = 1'b0;
				proc_swap = 1'b0;
				load_os = 1'b0;
				HDRM_select = 1'b0;
				write_hd = 1'b0;
				lcd_trd_msg = 1'b0;
				change_shift = 2'b00;
				pc_operation = 2'b00;
				// NET
				send = 1'b0;
				receive = 1'b0;
			end
				
			6'b011110: 
			begin //SEQ - OK - 30
				PRBM_select = 1'b1;
				PAM_select = 1'b0;
				bm_select = 2'b00;
				PDMM_select = 1'b1;
				input_mux_select = 1'b0;
				alu_code = 5'b01110; 
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				jal = 1'b0;
				rst = 1'b0;
				write_data_mem = 1'b0;
				stck = 1'b0;
				write_reg = 1'b1;
				// OS
				bios_mem_mux_select = 1'b0;
				write_instr_mem = 1'b0;
				proc_swap = 1'b0;
				load_os = 1'b0;
				HDRM_select = 1'b0;
				write_hd = 1'b0;
				lcd_trd_msg = 1'b0;
				change_shift = 2'b00;
				pc_operation = 2'b00;
				// NET
				send = 1'b0;
				receive = 1'b0;
			end
				
			6'b011111: 
			begin //SNEQ - OK - 30
				PRBM_select = 1'b1;
				PAM_select = 1'b0;
				bm_select = 2'b00;
				PDMM_select = 1'b1;
				input_mux_select = 1'b0;
				alu_code = 5'b01111; 
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				jal = 1'b0;
				rst = 1'b0;
				write_data_mem = 1'b0;
				stck = 1'b0;
				write_reg = 1'b1;
				// OS
				bios_mem_mux_select = 1'b0;
				write_instr_mem = 1'b0;
				proc_swap = 1'b0;
				load_os = 1'b0;
				HDRM_select = 1'b0;
				write_hd = 1'b0;
				lcd_trd_msg = 1'b0;
				change_shift = 2'b00;
				pc_operation = 2'b00;
				// NET
				send = 1'b0;
				receive = 1'b0;
			end
			
			// OS/NET RELATED INSTRUCTIONS - X TYPE
			
			// BIOS to memory - OK - 31
			6'b100000: 
			begin //BTM - changes context from bios to memory
				PRBM_select = 1'b1;
				PAM_select = 1'b0;
				bm_select = 2'b00;
				PDMM_select = 1'b1;
				input_mux_select = 1'b0;
				alu_code = 5'b00000; 
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				jal = 1'b0;
				rst = 1'b1;
				write_data_mem = 1'b0;
				stck = 1'b0;
				write_reg = 1'b1;
				// OS
				bios_mem_mux_select = 1'b1;
				write_instr_mem = 1'b0;
				proc_swap = 1'b0;
				load_os = 1'b0;
				HDRM_select = 1'b0;
				write_hd = 1'b0;
				lcd_trd_msg = 1'b0;
				change_shift = 2'b00;
				pc_operation = 2'b00;
				// NET
				send = 1'b0;
				receive = 1'b0;
			end	
			
			// SET QUANTUM - 32 - NAAAAAAAAAAAAAAAAAAO
			// SQTM - x type, changes the timer's quantum value 
			// 32'b100001_{5'b reg}_000000000000000000000; QUANTUM <= r[2]
			6'b100001: 
			begin 
				PRBM_select = 1'b1;
				PAM_select = 1'b0; 
				bm_select = 2'b00;
				PDMM_select = 1'b1;
				input_mux_select = 1'b0;
				alu_code = 5'b00000; 
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				jal = 1'b0;
				rst = 1'b0; // :
				write_data_mem = 1'b0;
				stck = 1'b0;
				write_reg = 1'b1;
				// OS
				bios_mem_mux_select = 1'b0;
				write_instr_mem = 1'b0;
				proc_swap = 1'b0;
				load_os = 1'b0;
				HDRM_select = 1'b0;
				write_hd = 1'b0;
				lcd_trd_msg = 1'b0;
				change_shift = 2'b00;
				pc_operation = 2'b00;
				// NET
				send = 1'b0;
				receive = 1'b0;
			end	
			
			// LOAD_OS - 33, almost equal to MDHM - OK
			6'b100010:
			begin 
				PRBM_select = 1'b1; //////
				PAM_select = 1'b0;
				bm_select = 2'b00;
				PDMM_select = 1'b0;
				input_mux_select = 1'b0;
				alu_code = 5'b00000; 
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				jal = 1'b0;
				rst = 1'b0;
				write_data_mem = 1'b0;
				stck = 1'b0;
				write_reg = 1'b0;
				// OS
				bios_mem_mux_select = 1'b0;
				write_instr_mem = 1'b1;
				proc_swap = 1'b0;
				load_os = 1'b1;
				HDRM_select = 1'b0;
				write_hd = 1'b0;
				lcd_trd_msg = 1'b0;
				change_shift = 2'b00;
				pc_operation = 2'b00;
				// NET
				send = 1'b0;
				receive = 1'b0;
			end	
			
			// MOVE_HD_TO_MEM - 34 - OK
			// MHDM -> 32'b100011_{5'b hd_proc_num}_{5'b hd_line}_{5'b mem_line }_11'b0; // mem[PROC[r[4]][line=r[3]] <= hd[PROC=r[4]][line=r[2]]
			6'b100011: 
			begin 
				PRBM_select = 1'b1;
				PAM_select = 1'b0;
				bm_select = 2'b00;
				PDMM_select = 1'b0;
				input_mux_select = 1'b0;
				alu_code = 5'b00000; 
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				jal = 1'b0;
				rst = 1'b0;
				write_data_mem = 1'b0;
				stck = 1'b0;
				write_reg = 1'b0;
				// OS
				bios_mem_mux_select = 1'b0;
				write_instr_mem = 1'b1;
				proc_swap = 1'b0;
				load_os = 1'b0;
				HDRM_select = 1'b0;
				write_hd = 1'b0;
				lcd_trd_msg = 1'b0;
				change_shift = 2'b00;
				pc_operation = 2'b00;
				// NET
				send = 1'b0;
				receive = 1'b0;
			end	
			
			// MOVE_HD_TO_REG - 35 - OK
			// MHR - > 32'b100100_{5'b hd_proc_num }_{ 5'b hd_line }_{5'b reg destiny }_11'b0; // reg[4] <= hd[PROC=r[6]][line=r[2]]
			6'b100100: 
			begin 
				PRBM_select = 1'b1; 
				PAM_select = 1'b0;
				bm_select = 2'b00;
				PDMM_select = 1'b0;
				input_mux_select = 1'b0;
				alu_code = 5'b00000; 
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				jal = 1'b0;
				rst = 1'b0;
				write_data_mem = 1'b0;
				stck = 1'b0;
				write_reg = 1'b1;
				// OS
				bios_mem_mux_select = 1'b0;
				write_instr_mem = 1'b0;
				proc_swap = 1'b0;
				load_os = 1'b0;
				HDRM_select = 1'b1;
				write_hd = 1'b0;
				lcd_trd_msg = 1'b0;
				change_shift = 2'b00;
				pc_operation = 2'b00;
				// NET
				send = 1'b0;
				receive = 1'b0;
			end	
			
			// STORE_HD - 36  
			// STHD - > 32'b100101_{5'b hd_proc_num }_{ 5'b hd_line }_{5'b reg data }_11'b0; // hd[PROC=r[6]][line=r[2]] <= reg[4]
			6'b100101: 
			begin 
				PRBM_select = 1'b1; 
				PAM_select = 1'b0;
				bm_select = 2'b00;
				PDMM_select = 1'b0;
				input_mux_select = 1'b0;
				alu_code = 5'b00000; 
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				jal = 1'b0;
				rst = 1'b0;
				write_data_mem = 1'b0;
				stck = 1'b0;
				write_reg = 1'b0;
				// OS
				bios_mem_mux_select = 1'b0;
				write_instr_mem = 1'b0;
				proc_swap = 1'b0;
				load_os = 1'b0;
				HDRM_select = 1'b0;
				write_hd = 1'b1;
				lcd_trd_msg = 1'b0;
				change_shift = 2'b00;
				pc_operation = 2'b00;
				// NET
				send = 1'b0;
				receive = 1'b0;
			end	
			
			6'b100110: 
			begin // SPRC - OK  - 37-> swap process number ->32'b100110_{5'b reg}_000000000000000000000; // current process <= RS(r[1])
				PRBM_select = 1'b1;
				PAM_select = 1'b0;
				bm_select = 2'b00;
				PDMM_select = 1'b1;
				input_mux_select = 1'b0;
				alu_code = 5'b00000; 
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				jal = 1'b0;
				rst = 1'b0;
				write_data_mem = 1'b0;
				stck = 1'b0;
				write_reg = 1'b0;  
				// OS
				bios_mem_mux_select = 1'b0;
				write_instr_mem = 1'b0;
				proc_swap = 1'b1; //
				load_os = 1'b0;
				HDRM_select = 1'b0;
				write_hd = 1'b0;
				lcd_trd_msg = 1'b0;
				change_shift = 2'b00;
				pc_operation = 2'b00;
				// NET
				send = 1'b0;
				receive = 1'b0;
			end
			
			// R type
			6'b100111: 
			begin //CONCAT - 38 - OK
				PRBM_select = 1'b1;
				PAM_select = 1'b0;
				bm_select = 2'b00;
				PDMM_select = 1'b1;
				input_mux_select = 1'b0;
				alu_code = 5'b10000; ////// 
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				jal = 1'b0;
				rst = 1'b0;
				write_data_mem = 1'b0;
				stck = 1'b0;
				write_reg = 1'b1;
				// OS
				bios_mem_mux_select = 1'b0;
				write_instr_mem = 1'b0;
				proc_swap = 1'b0;
				load_os = 1'b0;
				HDRM_select = 1'b0;
				write_hd = 1'b0;
				lcd_trd_msg = 1'b0;
				change_shift = 2'b00;
				pc_operation = 2'b00;
				// NET
				send = 1'b0;
				receive = 1'b0;
			end
			
			6'b101000: 
			begin // change msg - 39
				PRBM_select = 1'b1;
				PAM_select = 1'b0;
				bm_select = 2'b00;
				PDMM_select = 1'b1;
				input_mux_select = 1'b0;
				alu_code = 5'b00000; 
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				jal = 1'b0;
				rst = 1'b0;
				write_data_mem = 1'b0;
				stck = 1'b0;
				write_reg = 1'b0;  
				// OS
				bios_mem_mux_select = 1'b0;
				write_instr_mem = 1'b0;
				proc_swap = 1'b0; //
				load_os = 1'b0;
				HDRM_select = 1'b0;
				write_hd = 1'b0;
				lcd_trd_msg = 1'b1;
				change_shift = 2'b00;
				pc_operation = 2'b00;
				// NET
				send = 1'b0;
				receive = 1'b0;
			end
			
			6'b101001: 
			begin // change write shift - 40
				PRBM_select = 1'b1;
				PAM_select = 1'b0;
				bm_select = 2'b00;
				PDMM_select = 1'b1;
				input_mux_select = 1'b0;
				alu_code = 5'b00000; 
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				jal = 1'b0;
				rst = 1'b0;
				write_data_mem = 1'b0;
				stck = 1'b0;
				write_reg = 1'b0;  
				// OS
				bios_mem_mux_select = 1'b0;
				write_instr_mem = 1'b0;
				proc_swap = 1'b0; //
				load_os = 1'b0;
				HDRM_select = 1'b0;
				write_hd = 1'b0;
				lcd_trd_msg = 1'b0;
				change_shift = 2'b01;
				pc_operation = 2'b00;
				// NET
				send = 1'b0;
				receive = 1'b0;
			end
			
			6'b101010: 
			begin // change read shift - 41
				PRBM_select = 1'b1;
				PAM_select = 1'b0;
				bm_select = 2'b00;
				PDMM_select = 1'b1;
				input_mux_select = 1'b0;
				alu_code = 5'b00000; 
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				jal = 1'b0;
				rst = 1'b0;
				write_data_mem = 1'b0;
				stck = 1'b0;
				write_reg = 1'b0;  
				// OS
				bios_mem_mux_select = 1'b0;
				write_instr_mem = 1'b0;
				proc_swap = 1'b0; //
				load_os = 1'b0;
				HDRM_select = 1'b0;
				write_hd = 1'b0;
				lcd_trd_msg = 1'b0;
				change_shift = 2'b11;
				pc_operation = 2'b00;
				// NET
				send = 1'b0;
				receive = 1'b0;
			end
			
			6'b101011: 
			begin // getpc - 42
				PRBM_select = 1'b1;
				PAM_select = 1'b0;
				bm_select = 2'b00;
				PDMM_select = 1'b1;
				input_mux_select = 1'b0;
				alu_code = 5'b00000; 
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				jal = 1'b0;
				rst = 1'b0;
				write_data_mem = 1'b0;
				stck = 1'b0;
				write_reg = 1'b0;  
				// OS
				bios_mem_mux_select = 1'b0;
				write_instr_mem = 1'b0;
				proc_swap = 1'b0; //
				load_os = 1'b0;
				HDRM_select = 1'b0;
				write_hd = 1'b0;
				lcd_trd_msg = 1'b0;
				change_shift = 2'b00;
				pc_operation = 2'b01;
				// NET
				send = 1'b0;
				receive = 1'b0;
			end

			6'b101100: 
			begin // setpc - 43
				PRBM_select = 1'b1;
				PAM_select = 1'b0;
				bm_select = 2'b00;
				PDMM_select = 1'b1;
				input_mux_select = 1'b0;
				alu_code = 5'b00000; 
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				jal = 1'b0;
				rst = 1'b0;
				write_data_mem = 1'b0;
				stck = 1'b0;
				write_reg = 1'b0;  
				// OS
				bios_mem_mux_select = 1'b0;
				write_instr_mem = 1'b0;
				proc_swap = 1'b0; //
				load_os = 1'b0;
				HDRM_select = 1'b0;
				write_hd = 1'b0;
				lcd_trd_msg = 1'b0;
				change_shift = 2'b00;
				pc_operation = 2'b10;
				// NET
				send = 1'b0;
				receive = 1'b0;
			end
			
			6'b111110: 
			begin // SYSCALL - 44
				PRBM_select = 1'b1;
				PAM_select = 1'b0;
				bm_select = 2'b00;
				PDMM_select = 1'b1;
				input_mux_select = 1'b0;
				alu_code = 5'b00000; 
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				jal = 1'b0;
				rst = 1'b0;
				write_data_mem = 1'b0;
				stck = 1'b0;
				write_reg = 1'b0;  
				// OS
				bios_mem_mux_select = 1'b0;
				write_instr_mem = 1'b0;
				proc_swap = 1'b0;
				load_os = 1'b0;
				HDRM_select = 1'b0;
				write_hd = 1'b0;
				lcd_trd_msg = 1'b0;
				change_shift = 2'b00;
				pc_operation = 2'b00;
				// NET
				send = 1'b0;
				receive = 1'b0;
			end
			
			6'b111111: 
			begin // end_program - 45
				PRBM_select = 1'b1;
				PAM_select = 1'b0;
				bm_select = 2'b00;
				PDMM_select = 1'b1;
				input_mux_select = 1'b0;
				alu_code = 5'b00000; 
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				jal = 1'b0;
				rst = 1'b0;
				write_data_mem = 1'b0;
				stck = 1'b0;
				write_reg = 1'b0;  
				// OS
				bios_mem_mux_select = 1'b0;
				write_instr_mem = 1'b0;
				proc_swap = 1'b0;
				load_os = 1'b0;
				HDRM_select = 1'b0;
				write_hd = 1'b0;
				lcd_trd_msg = 1'b0;
				change_shift = 2'b00;
				pc_operation = 2'b00;
				// NET
				send = 1'b0;
				receive = 1'b0;
			end
			
			6'b101101: //receive
			begin
				PRBM_select = 1'b0;
				PAM_select = 1'b1;
				bm_select = 2'b00;
				PDMM_select = 1'b1;
				input_mux_select = 1'b1;
				alu_code = 5'b00000; 
				if(check)
					hlt = 1'b0;
				else
					hlt = 1'b1;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				jal = 1'b0;
				rst = 1'b0;
				write_data_mem = 1'b0;
				stck = 1'b0;
				write_reg = 1'b1;
				// OS
				bios_mem_mux_select = 1'b0;
				write_instr_mem = 1'b0;
				proc_swap = 1'b0;
				load_os = 1'b0;
				HDRM_select = 1'b0;
				write_hd = 1'b0;
				lcd_trd_msg = 1'b0;
				change_shift = 2'b00;	
				pc_operation = 2'b00;
				// NET
				send = 1'b0;
				receive = 1'b1; //////
			end
			
			6'b101110:
			begin // send
				PRBM_select = 1'b1;
				PAM_select = 1'b0;
				bm_select = 2'b00;
				PDMM_select = 1'b1;
				input_mux_select = 1'b0;
				alu_code = 5'b00000; 
				if(check)
					hlt = 1'b0;
				else
					hlt = 1'b1;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				jal = 1'b0;
				rst = 1'b0;
				write_data_mem = 1'b0;
				stck = 1'b0;
				write_reg = 1'b0;
				// OS
				bios_mem_mux_select = 1'b0;
				write_instr_mem = 1'b0;
				proc_swap = 1'b0;
				load_os = 1'b0;
				HDRM_select = 1'b0;
				write_hd = 1'b0;
				lcd_trd_msg = 1'b0;
				change_shift = 2'b00;	
				pc_operation = 2'b00;
				// NET
				send = 1'b1; //////
				receive = 1'b0;
			end
			
			default: 
			begin
				PRBM_select = 1'b0;
				PAM_select = 1'b0;
				bm_select = 2'b00;
				PDMM_select = 1'b0;
				input_mux_select = 1'b0;
				alu_code = 5'b00000; 
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				jal = 1'b0;
				bneq = 1'b0;
				rst = 1'b0;
				write_data_mem = 1'b0;
				stck = 1'b0;
				write_reg = 1'b0;
				// OS
				bios_mem_mux_select = 1'b0;
				write_instr_mem = 1'b0;
				proc_swap = 1'b0;
				load_os = 1'b0;
				HDRM_select = 1'b0;
				write_hd = 1'b0;
				lcd_trd_msg = 1'b0;
				change_shift = 2'b00;
				pc_operation = 2'b00;
				// NET
				send = 1'b0;
				receive = 1'b0;
			end
		
		endcase
	end

endmodule 

