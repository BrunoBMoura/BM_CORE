#include <SoftwareSerial.h>
#include <stdlib.h>

/* --- msgcenter communication data --- */

// buffer int value
int msgcenter_buff_int;
// number of bytes used in the msgcenter communication
int msgcenter_byte_num = 4;
// buffer for serial 4 byte reading/writing
char msgcenter_buff_char[] = {' ', ' ', ' ', ' '};

// waits until there is available data from the msgcenter
void wait_msgcenter_connection() {

  while (!Serial.available()) {}
}

// reads data sent by msgcenter
void read_msgcenter_serial() {

  wait_msgcenter_connection();
  Serial.readBytes(msgcenter_buff_char, msgcenter_byte_num);
}

// writes data to the msgcenter
void write_msgcenter_serial() {

  if (msgcenter_buff_int == 0) {
    fulfill_with_zeros(4);
  }
  else if (msgcenter_buff_int < 10) {
    fulfill_with_zeros(3);
  }
  else if (msgcenter_buff_int < 100) {
    fulfill_with_zeros(2);
  }
  else if (msgcenter_buff_int < 1000) {
    fulfill_with_zeros(1);
  }
  Serial.print(msgcenter_buff_int);
}

// fulfills serial connection with zero-bytes
void fulfill_with_zeros(int n_zeros) {

  for (int idx = 0; idx < n_zeros; idx++) {
    Serial.write('0');
  }
}

// clears the buffer manually
void clear_msgcenter_buffer() {

  msgcenter_buff_char[0] = (char)0;
}

// converts the buffer value to an int
void msgcenter_buffer_to_int() {

  msgcenter_buff_int = atoi(msgcenter_buff_char);
}

// converts the buffer value to char
void msgcenter_buffer_to_char() {

  clear_msgcenter_buffer();
  itoa(msgcenter_buff_int, msgcenter_buff_char, 10);
}

/* --- end of msgcenter communication data --- */

/* --- fpga communication data --- */

// rx = 10(red), tx = 11(brown)
//SoftwareSerial fpga_serial(10, 11);
SoftwareSerial fpga_serial(8, 9);
// buffer for serial reading/writing
int fpga_buff_int = 0;

// waits until there is available data from the fpga
void wait_fpga_connection() {

  while (!fpga_serial.available()) {}
}

// reads data sent by fpga
void read_fpga_serial() {

  wait_fpga_connection();
  //fpga_serial.readBytes(msgcenter_buff_char, msgcenter_byte_num);
  clear_fpga_buffer();
  fpga_buff_int = fpga_serial.read();
}

// writes data to the fpga
void write_fpga_serial() {

  fpga_serial.write(fpga_buff_int);
}

// clears the buffer manually
void clear_fpga_buffer() {

  fpga_buff_int = 0;
}

/* --- end of fpga communication data --- */

/* --- verbose functions --- */

// copy the value of the fpga buffer into the msgcenter buffer
void copy_buffer_fpga_to_msgcenter() {

  msgcenter_buff_int = fpga_buff_int;
}

// copy the value of the msgcenter buffer into the fpga buffer
void copy_buffer_msgcenter_to_fpga() {

  fpga_buff_int = msgcenter_buff_int;
}

/* --- end of verbose functions --- */

void setup() {

  // default serial, used for msgcenter communication
  Serial.begin(9600);
  // fpga serial, used for os communication
  fpga_serial.begin(115200);
}

void loop() {

  bool fpga = fpga_serial.available();
  bool msgcenter = Serial.available();
  // data is beeing sent from the msgcenter
  if (msgcenter) {
    read_msgcenter_serial();
    msgcenter_buffer_to_int();
    copy_buffer_msgcenter_to_fpga();
    write_fpga_serial();
  }
  // data is beeing sent by the fpga
  else if (fpga) {
    read_fpga_serial();
    copy_buffer_fpga_to_msgcenter();
    msgcenter_buffer_to_char();
    write_msgcenter_serial();
  }
  else { // zero conditions
    clear_fpga_buffer();
    clear_msgcenter_buffer();
  }
}
