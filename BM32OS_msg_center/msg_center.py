from PyQt5 import QtGui, QtCore, QtWidgets
import sys
import msg_center_display
import serial
import time
# 11 = laranja, 10 = cinza

# Calls the msg_center_display.py generated file as an object.
class Msg_center(QtWidgets.QMainWindow, msg_center_display.Ui_MainWindow):

    def __init__(self, parent = None):

        super(Msg_center, self).__init__(parent)
        self.setupUi(self)
        # serial connection object
        self.arduino = None
        # connection atribute
        self.connected = False
        self.wait_time = 1
        # size of received data
        self.byte_num = 4
        # received data
        self.received_data = None
        # counters
        self.sent_values = []
        self.received_values = []
        self.clicked_on_send = 0
        self.clicked_on_receive = 0
        # qt signals
        self.text_browser_status.append("Connected" if self.connected else "Disconnected")
        self.push_button_send.clicked.connect(self.send_data)
        self.push_button_receive.clicked.connect(self.receive_data)
        self.push_button_start.clicked.connect(self.begin_serial_connection)

    # Verbose.
    def wait(self, mult = 1):

        time.sleep(mult * self.wait_time)

    # Change message center's status.
    def set_interface_status(self, status, status_val):

        self.connected = status_val
        self.text_browser_status.clear()
        self.text_browser_status.append(status)

    # Returns text written on text box.
    def get_input_data(self):

        return str(self.line_edit_data.text())

    # Writes msg to the text browser.
    def write_text_browser(self, msg):

        self.text_browser_receive.append(msg)

    # Reads data sent from arduino, thread usage.
    def read_from_arduino(self):

        try:
            # read is only done if there are 4 bytes received
            self.custom_print(f"Trying to read from the arduino. Available bytes: {self.arduino.in_waiting}")
            if self.arduino.in_waiting >= self.byte_num:
                data = self.arduino.read(self.byte_num)
                if data:
                    self.custom_print(f"Data was read from the arduino. Still, available bytes: {self.arduino.in_waiting}")
                    self.custom_print(f"raw data: {data}")
                    read = True
                    # string treatment
                    data = ''.join(list(str(data))[2:6])

                # if burst is received, fpga is sending no-response data
                if int(self.arduino.in_waiting) > 16:
                    trash = self.arduino.read(self.arduino.in_waiting)
                    self.custom_print("Data from the fpga received, cleaning trash bytes.")
                    trash = 0

                self.received_data = data
                self.wait()
            else:
                self.custom_print(f"The correct number of bytes haven't reached the interface!")
                self.custom_print(f"Available bytes: {self.arduino.in_waiting}, which are:", False)
                trash = self.   arduino.read(self.arduino.in_waiting)
                self.custom_print(trash)

        except Exception as err:
            self.custom_print("Failed to receive data!")
            self.custom_print(err)

    # Sends data to the arduino, thread_usage.
    def write_to_arduino(self, msg):

        try:
            msg = ''.join(['0' for missing in range(4 - len(msg))]) + msg if len(msg) < 4 else msg
            self.custom_print(f"msg: {msg}, type(msg): {type(msg)}, msg.encode(): {msg.encode()}")
            self.arduino.write(msg.encode())
            self.wait()
            # uart module behaviour will send the value sent to the interface, so it's bytes must be read and not used
            clear_response = self.arduino.read(self.byte_num)
            self.custom_print(clear_response)
        except Exception as err:
            self.custom_print("Failed to send data!")
            self.custom_print(err)

    # Reads from the serial port.
    def receive_data(self):

        if self.connected:
            self.read_from_arduino()
            if self.received_data:
                self.clicked_on_receive += 1
                self.received_values.append(self.received_data)
                msg = f"Interface received data: {self.received_data}"
            else:
                msg = f"Interface received data: {self.received_data}"
        else:
            msg = "Message center not connected to OS"

        self.write_text_browser(msg)
        self.custom_print(f"Clicks on receive: {self.clicked_on_receive}")
        self.custom_print("Received values: ", False)
        self.custom_print(self.received_values, True, False)

    # Sends input data to the OS.
    def send_data(self):

        if self.connected:
            data = self.get_input_data()
            if data.isdigit():
                self.clicked_on_send += 1
                self.sent_values.append(str(data))
                self.write_to_arduino(str(data))
                msg = "Message center sent " + str(data) + " to OS"
            else:
                msg = "Only integer values can be sent, please insert a valid value!"
        else:
            msg = "Message center not connected to OS!"

        self.write_text_browser(msg)
        self.custom_print(f"Clicks on send: {self.clicked_on_send}")
        self.custom_print("Sent values: ", False)
        self.custom_print(self.sent_values, True, False)

    # Sets up serial connection.
    def begin_serial_connection(self):

        msg = "Setting up serial connection..."
        try:
            self.write_text_browser(msg)
            self.arduino = serial.Serial('/dev/ttyACM0', 9600)
            self.wait(2)
        except Exception as err:
            self.custom_print("Failed to stablish first connection!")
            self.custom_print(err)

        # text message, could have been any value
        #hs_msg = "9191"
        hs_msg = "0001"
        self.custom_print("Preparing hs msg.")
        # first read for initial fpga handdata
        self.read_from_arduino()
        # write sends the handshaking data
        self.custom_print("Sending hs msg.")
        self.write_to_arduino(hs_msg)
        # read result should be the same value as the handshaking message
        self.custom_print("Reading hs.")
        self.read_from_arduino()
        self.custom_print(f"Hs response: {self.received_data}.")
        status = True
        if status:
            interface_status = "Connected"
            msg = "Serial connection stablished!"
        else:
            interface_status = "Disconnected"
            msg = "Coudn't stablish serial connection D:"

        self.set_interface_status(interface_status, status)
        self.write_text_browser(msg)

        # cleanup
        self.sent_values.clear()
        self.received_values.clear()
        self.received_data = None

    # auxiliar
    def custom_print(self, msg, new_line = True, is_list = False):

        if new_line:
            if is_list:
                print(msg)
            else:
                print(f"Log: {msg}")
        else:
            print(f"Log: {msg}", end = '')

def main():
    app = QtWidgets.QApplication(sys.argv)
    window = Msg_center()
    window.show()
    app.exec()

if __name__ == '__main__':
    main() 