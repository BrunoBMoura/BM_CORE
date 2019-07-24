/*
check - interruption for input
clk_auto - automatic clock from pin Y2
input_reset - user reset signal
switches - FPGA pins for bitwise input
hlt - signal for interruption sinalization
negative - signal for negative values
reset - input_reset - Y23
clkAuto - clk_auto - Y2
check- check - M21

pins for output:
cent_out 
dez_out
uni_out
dez_out_pc
uni_out_pc
dez_out_reg_address
uni_out_reg_address
lcd_on 
lcd_blon
lcd_rw
lcd_en
lcd_rs
lcd_data
*/

module BMCORE_FPGA 
(
	input wire check, clk_auto, input_reset,	
	input wire [15:0] switches,						
	output wire hlt, negative, lcd_on, lcd_blon, lcd_rw, lcd_en, lcd_rs,
	output wire [6:0] mil_out, cent_out, dez_out, uni_out, dez_out_pc, uni_out_pc, dez_out_reg_address, uni_out_reg_address,
	output wire [7:0] lcd_data,
	output wire [15:0] input_mux_output, // output value from input mux which selects immediate/input
	input wire uart_rx,
	output wire uart_tx
);
	
	wire [31:0] output_value;				// value stored on output value
	wire [31:0] bios_output; 				// bios instruction output
	wire [31:0] instr_mem_output;			// instruction memory instruction output
	wire [31:0] Extend26_32;				// 26 - 32 bit extender output
	wire [31:0] Extend16_32;				// 16 - 32 bit extender output
	wire [31:0] PAM_output;					// pre-ALU mux output, ALU's second operand input
	wire [31:0] address_in;					// input address of program counter
	wire [31:0] last_proc;					//	number of the last process executed other than OS
	wire [31:0] HDRM_out;					// hd-to-reg mux control
	wire [31:0] data_write;					// data to be written on regbank
	wire [31:0] data_1, data_2, data_3;	// data outputs from regbank
	wire [31:0] ALU_result;					// alu operation result
	wire [31:0] data_mem_output;			// data memory output value
	wire [31:0] address_out;				// pc (os)address output value
	wire [31:0] address_out_proc;			// pc(proc) address output value
	wire [31:0] hd_output;					// hd output value
	wire [31:0] selected_instruction;	// instructon output from bios_mem_mux
	wire [5:0] exec_proc, intrpt_val;	// hardware execution process value, interruption value
	wire [4:0] ALUcode, PRBM_out;			// ALU operation code, pre-reg bank mux output value
	wire [15:0] uart_receive;				// connects data received by uart communication
	wire [15:0] pre_input_mux_output;   // choice between switches or uart data
	
	// datapath conection wires
	wire zero, bounce_button, true_pin_button, clk_div, intrpt;				
	wire reg_read_shift, reg_write_shift, decoded_exec_proc;
	
	// control unit signals
	wire PRBM_select, PAM_select, jmp, PDMM_select, write_data_mem, stck,  beq, bneq, in_mux_select, jal;
	wire bmm_select, rst, write_instr_mem, proc_swap, load_os, write_reg, write_hd, HDRM_select, trd_msg;
	wire [1:0] bm_select,change_reg_shift, pc_op;
	wire send, receive;
	
	// output wires
	wire [3:0] mil, cent, dez, uni, cent_pc, dez_pc, uni_pc, cent_reg_address, dez_reg_address, uni_reg_address, cent_a, dez_a, uni_a;
	
	Frequency_divider FD(
		.clk_in(clk_auto),
		.clk_out(clk_div)
	);
	
	DeBounce_v DBNCR( 
		.clk(clk_auto), 
		.n_reset(1'b1), 
		.button_in(check),// inputs
		.DB_out(bounce_button)
	);
						
	one_shot_button OSB(
		.clk(clk_div), 
		.dbOut(bounce_button),
		.one_shot_out(true_pin_button)
	);
	
	Interruption_trigger IT(
		.offset(selected_instruction[5:0]), 
		.single_clk(clk_div),
		.proc_num(decoded_exec_proc),
		.opcode(selected_instruction[31:26]),
		.intrpt_val(intrpt_val),
		.intrpt(intrpt)
	);
	
	Process_keeper PK(
		.proc_swap(proc_swap),
		.single_clk(clk_div),
		.true_intrpt(intrpt),
		.new_proc_num(data_1[5:0]),
		.exec_proc(exec_proc)
	);
	
	Control_unit CU(
		.check(~true_pin_button),
		.opcode(selected_instruction[31:26]),
		.PRBM_select(PRBM_select), 
		.PAM_select(PAM_select),
		.bm_select(bm_select),
		.hlt(hlt),
		.jmp(jmp),
		.beq(beq),
		.bneq(bneq),
		.jal(jal),
		.rst(rst),
		.PDMM_select(PDMM_select),
		.write_data_mem(write_data_mem),
		.stck(stck),
		.write_reg(write_reg),
		.alu_code(ALUcode),
		.input_mux_select(in_mux_select),
		.bios_mem_mux_select(bmm_select),
		.write_instr_mem(write_instr_mem),
		.proc_swap(proc_swap),
		.load_os(load_os),
		.HDRM_select(HDRM_select),
		.write_hd(write_hd),
		.lcd_trd_msg(trd_msg),
		.change_shift(change_reg_shift),
		.pc_operation(pc_op),
		.send(send),
		.receive(receive)
	);

	Program_counter PC (
		 .proc_num(decoded_exec_proc),
		 .address(address_in),
		 .clk_write(clk_div),
		 .rst(input_reset || rst),
		 .jmp(jmp),
		 .beq(beq),
		 .bneq(bneq),
		 .hlt(hlt),
		 .prog_count(address_out),
		 .zero(zero),
		 .pc_operation(pc_op),
		 .stored_pc(data_1), 
		 .only_proc_pc(address_out_proc)
	);
					
	Hard_drive HD(
		.clk_write(clk_div),
		.clk_read(clk_auto),
		.write_flag(write_hd),
		.proc_num(data_1),
		.track_line(data_2),
		.input_data(data_3), 
		.hd_output(hd_output)
		);
	
	BIOS bios(
		.clk_read(clk_auto),
		.address(address_out),
		.BIOS_out(bios_output)
	);
				 
	Process_decoder PD(
		.input_exec_proc(exec_proc),
		.output_exec_proc(decoded_exec_proc)
	);
	
	Instruction_memory IM (
		.proc_num(decoded_exec_proc),
		.write_os(load_os),
		.write_flag(write_instr_mem),
		.write_address(data_3[15:0]), 
		.read_address(address_out),
		.input_data(hd_output),
		.clk_write(clk_div),
		.clk_read(clk_auto), 
		.instr_mem_out(instr_mem_output)
	);
	
	State_Mux_32 Bios_to_mem_mux(
		.mux_select(bmm_select),
		.clk(clk_div),
		.rst(rst),
		.hlt(hlt),
		.input_data_1(bios_output),
		.input_data_2(instr_mem_output),
		.mux_output(selected_instruction)
	);
	
	Mux_16 PRE_INPUT_MUX (
		.input_data_1(switches),
		.input_data_2(uart_receive),
		.mux_output(pre_input_mux_output),
		.mux_select(receive)
	);
	
	Mux_16 INPUT_MUX (
		.input_data_1(selected_instruction[15:0]),
		.input_data_2(pre_input_mux_output),
		.mux_output(input_mux_output),
		.mux_select(in_mux_select)
	);

	Mux_5 PRE_REG_BANK_MUX (
		.input_data_1(selected_instruction[20:16]),
		.input_data_2(selected_instruction[15:11]),
		.mux_output(PRBM_out),
		.mux_select(PRBM_select)
	);

	Mux_32 HD_TO_REG_MUX(
		.input_data_1(data_write),
		.input_data_2(hd_output),
		.mux_output(HDRM_out),
		.mux_select(HDRM_select)
	);
	
	Address_setter AS (
		.single_clk(clk_div),
		.change_shift(change_reg_shift),
		.read_shift_enabler(reg_read_shift),
		.write_shift_enabler(reg_write_shift)
	);
	
	Register_bank RB (
		.intrpt(intrpt_val),
		.write_flag(write_reg),
		.clk_write(clk_div),
		.hlt(hlt),
		.jal(jal),
		.PC(address_out),
		.PROC_PC(address_out_proc),
		.pc_operation(pc_op),
		.read_shift_enabler(reg_read_shift),
		.write_shift_enabler(reg_write_shift),
		.write_address(PRBM_out),
		.read_address_1(selected_instruction[25:21]),
		.read_address_2(selected_instruction[20:16]),
		.data_write(HDRM_out),
		.data_1(data_1),
		.data_2(data_2),
		.data_3(data_3),
		.value_address(output_value)
	);

	Extender_26_32 Ext_26_32 (
		.ext_input(selected_instruction[25:0]),
		.ext_output(Extend26_32)
	);

	Extender_16_32 Ext_16_32 (
		.ext_input(input_mux_output),
		.ext_output(Extend16_32)
	);

	Mux_32 PRE_ALU_MUX (
		.input_data_1(data_2),
		.input_data_2(Extend16_32),
		.mux_output(PAM_output),
		.mux_select(PAM_select)
	);

	Arithmetic_logic_unity ALU (
		.op(ALUcode),
		.data_1(data_1),
		.data_2(PAM_output),
		.result(ALU_result),
		.zero(zero),
		.shamt(selected_instruction[10:6])
	);

	Data_memory DM (
	   .data(data_2),
	   .address(ALU_result),
	   .clk_write(clk_div),
	   .clk_read(clk_auto), 
	   .data_mem_out(data_mem_output),
	   .write_flag(write_data_mem),
	   .stack_use(stck)
	);

	Mux_32 POST_DATA_MEM_MUX (
		.input_data_1(data_mem_output),
		.input_data_2(ALU_result),
		.mux_output(data_write),
		.mux_select(PDMM_select)
	);

	Big_mux BM (
		.zero(zero),
		.bm_select(bm_select),
		.beq(beq),
		.bneq(bneq),
		.ext_sum(Extend16_32),
		.ext_signal(Extend26_32),
		.reg_bank_upper_data(data_1),
		.pc_out(address_out),
		.bm_out(address_in)
	);

	/* NETWORK COMMUNICATION MODULE */
	
	UART_Manager UART_M (
		.send(send),
		.clk_auto(clk_auto),
		.output_data(output_value),
		.UART_RX(uart_rx),
		.UART_TX(uart_tx),
		.data_receive(uart_receive)
	);
	
	/* OUTPUT MODULES */
	
	OUT pc_address_output (
		.cent(cent),
		.dez(dez),
		.uni(uni),
		.hlt(1'b1),
		.cent_out(cent_out),
		.dez_out(dez_out), 
		.uni_out(uni_out)
	); 
					
	OUT pc_address_mil(
		.uni(mil),
		.uni_out(mil_out),
		.hlt(1'b1)
	);				
					
	Bin_BCD_converter pc_address(
		.binary(address_out), // address_out
		.first(uni),
		.second(dez),
		.third(cent),
		.fourth(mil),
		.neg(negative)
	);
	
	Display_process_number(
		.single_clk(clk_div),
		.new_proc_num(exec_proc),
		.last_proc_num(last_proc)
	);
	
	Bin_BCD_converter exec_proc_output(
		.binary(last_proc),
		.first(uni_reg_address),
		.second(dez_reg_address),
		.third(cent_reg_address)
	);
	
	OUT execution_process (
		.cent(cent_reg_address),
		.dez(dez_reg_address),
		.uni(uni_reg_address),
		.hlt(1'b1),
		.dez_out(dez_out_reg_address), 
		.uni_out(uni_out_reg_address) 
	); 
	
	Bin_BCD_converter operation_value_output (
		.binary(output_value), // output_value
		.first(uni_pc),
		.second(dez_pc),
		.third(cent_pc)
	);
	
	OUT op_value (
		.cent(cent_pc),
		.dez(dez_pc),
		.uni(uni_pc),
		.hlt(hlt),
		.dez_out(dez_out_pc), 
		.uni_out(uni_out_pc) 
	); 

	LCD DISP(
		.CLOCK_50(clk_auto),
		.SW(switches[7:0]),
		.LCD_ON(lcd_on),
		.LCD_BLON(lcd_blon),
		.LCD_RW(lcd_rw),
		.LCD_EN(lcd_en),
		.LCD_RS(lcd_rs),
		.LCD_DATA(lcd_data),
		.offset(selected_instruction[15:0]),
		.lcd_trd_msg(trd_msg),
		.clk_div(clk_div)
	);
	
endmodule






