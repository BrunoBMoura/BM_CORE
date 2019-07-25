# BM_CORE ![CI status](https://img.shields.io/badge/build-passing-brightgreen.svg)

This project consists in a single-cycle MIPS-based processor architecture, designed mainly as the final project for the Laboratory of Computer Architecture and Organization lecture and later enhanced for both Laboratory of Operational Systems and Laboratory of Computer Networks lectures.

## Specifications

The designed architecture works with a small set of instructions (50<), whose respective types and behaviour can be found on both .pdf files on the documents folder of this repository. Any other information about the project can be found on these documents as well, such as I/O pin specification for the hardware platform, operational-system-related adaptations and data flux treatments for the UART communication.

To run the project as it is, you will need:
* Quartus
* Altera FPGA (DE2-115)

## Usage

1 - The main project file is *processa.qpf*, so it must be open and then compiled on your Quartus version. Be sure to no make any changes on the *processa.qsf*, once it contains the pin map specifically for the DE2-115 Board.

2 - The project already has some files stored on it's simmulated HD, so upon starting the user will be presented with the BIOS and it's interface in the LCD Display, which is responsible for verifying the hardware integrity and communication if all the components of the processor and then launching the operational system BM32OS.

3 - During it's use, the user can select files to be executed, deleted, renamed or even created, simmulating a full computational system.

## Notes

The **BM32OS_msg_center** folder contains a .ino file and the implementation of a graphical interface to send and receive UART data from the processor by the arduino during the BM32OS process scheduling, so it's not related strictly to the hardware architecture by itself, however it was used during the project development so it made it's way to the git repository.



