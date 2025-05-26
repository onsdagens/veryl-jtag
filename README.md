# Veryl JTAG

This repo aims to implement a JTAG module.

The current implementation consists of a top module instantiating the instruction register, data registers, and the TAP controller. The top module can be used directly, but currently implements only the `IDCODE` standard register, and one custom register (instruction `0x1`) for writing arbitrary bytes.

## Dependencies

The toolchain used to transpile Veryl into Systemverilog is the standard [Veryl toolchain](https://veryl-lang.org/install).

Additionally, this project includes configuration for synthesis, place and route, and programming of the Numato Lab ECP-5 Mimas Mini development board. For these additional steps, we need the following tools:

- [Yosys](https://github.com/YosysHQ/yosys?tab=readme-ov-file#building-from-source) for synthesis
- [NextPNR](https://github.com/YosysHQ/nextpnr?tab=readme-ov-file#getting-started) for place and route
- [OpenOCD](https://openocd.org/pages/getting-openocd.html) for programming the device
- [Project Trellis](https://github.com/YosysHQ/prjtrellis) for bitstream generation, and other device specifics.

To interact with the JTAG interface, we have been using the [`ftdaye`](https://github.com/onsdagens/ftdaye) library. The `ECP5` example contains minimal code for connecting, reading out the `IDCODE` register and writing to the `0x1` custom register.

## Building and programming

With the toolchain set up, and the dev board connected, run 
```
make flash
```
to build the project and reprogram the FPGA. 

## Expected behavior

The FPGA acts as a JTAG device. The monochrome LEDs act as a bit display, showing the current state of the data register under instruction `0x1`. 

For our own (very simple testing) purposes, we have been using the `ftdaye` [`ECP5`](https://github.com/onsdagens/ftdaye/blob/master/examples/ECP5.rs) example to read out the `IDCODE` register, and for writing to the `0x1` custom register.
