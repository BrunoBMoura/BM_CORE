module LCD (
  input CLOCK_50, clk_div, lcd_trd_msg,   //    50 MHz clock
  input [7:0] SW,    //    Toggle Switch[17:0]
  input [15:0] offset,
  
  
//    LCD Module 16X2
  output LCD_ON,    // LCD Power ON/OFF
  output LCD_BLON,    // LCD Back Light ON/OFF
  output LCD_RW,    // LCD Read/Write Select, 0 = Write, 1 = Read
  output LCD_EN,    // LCD Enable
  output LCD_RS,    // LCD Command/Data Select, 0 = Command, 1 = Data
  inout [7:0] LCD_DATA    // LCD Data bus 8 bits
);

//    All inout port turn to tri-state

// reset delay gives some time for peripherals to initialize
wire DLY_RST;
Reset_Delay r0(.iCLK(CLOCK_50),.oRESET(DLY_RST) );

reg [15:0] reg_msg = 0;

always @ (posedge clk_div)
begin
	if(lcd_trd_msg)
		reg_msg <= offset;
end


// turn LCD ON
assign    LCD_ON        =    1'b1;
assign    LCD_BLON    =    1'b1;

wire [3:0] hex1, hex0;
assign hex1 = SW[7:4];
assign hex0 = SW[3:0];


LCD_Display u1(
// Host Side
   .iCLK_50MHZ(CLOCK_50),
   .iRST_N(DLY_RST),
   .hex0(hex0),
   .hex1(hex1),
	.reg_msg(reg_msg), ////
// LCD Side
   .DATA_BUS(LCD_DATA),
   .LCD_RW(LCD_RW),
   .LCD_E(LCD_EN),
   .LCD_RS(LCD_RS)
);




endmodule 