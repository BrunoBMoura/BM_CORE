/*
send - control unit flag
clk_auto - 50MHz clock
output_data - data that will be sent to the interface
UART_RX - receiver, goes into the arduino tx pin
UART_TX - transmitter, goes into the arduino rx pin
data_receive - data received by UART communication
*/

module UART_Manager
#(parameter DATA_WIDTH = 16)
(
	input send,
	input clk_auto,
	input [(DATA_WIDTH/2)-1:0] output_data, 
	input UART_RX,
	output UART_TX,
	output wire [(DATA_WIDTH/2)-1:0] data_receive
);

wire rx_data, tx_data, rdempty, write;
wire [(DATA_WIDTH/2)-1:0] uart_data_read, uart_data_write, data_send;
reg [DATA_WIDTH-1:0] UART_reg;
reg read, count, send_reg, send_enabler;

// uart data
assign  UART_TX = tx_data;
assign  rx_data  = UART_RX;

// send/receive data directioning
assign data_send = output_data;
assign data_receive = UART_reg;

// send/receive treatment
assign uart_data_write = send_reg ? data_send : uart_data_read;
assign  write = ( read & (~rdempty) ) || send_reg;

uart_control UART0(
	.clk(clk_auto),
	.reset_n(1'b1),
	// tx
	.write(write),
	.writedata(uart_data_write),
	// rx
	.read(read),
	.readdata(uart_data_read),
	.rdempty(rdempty),
	// ¯\_(ツ)_/¯
	.uart_clk_25m(count),
	.uart_tx(tx_data),
	.uart_rx(rx_data)
);	

always@(posedge clk_auto)
begin
  if (~rdempty)
		read <= 1'b1;
  else
		read <= 1'b0;
end

always@(posedge clk_auto)
begin
		if (send)
		begin
			UART_reg <= 16'b0;
		end
		if (write)
		begin
			UART_reg <= {8'b0 ,uart_data_read}; 
		end
		else
		begin
			UART_reg <= UART_reg;
		end
end

always@(posedge clk_auto)
begin
	count <= count + 1'b1;
end

always@(posedge clk_auto)
begin
	// occurs only on send instruction
	if(send)
	begin
		// send enablers works holding send_reg value as 1 during only one pulse
		if( send_enabler == 1'b0 )
		begin
			send_enabler = 1'b1;
			send_reg = 1'b1;
		end
		// else statement doesn't let send_reg be 1 again until there is another send instruction
		else 
		begin
			send_reg = 1'b0;
		end
	end
	else
	begin
		send_enabler = 1'b0;
		send_reg = 1'b0;
	end
end

endmodule
