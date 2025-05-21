# jtag-vr

Veryl interpretation of the JTAG specification.

## Dependencies

The toolchain consists of:

- [Veryl](https://veryl-lang.org/install/) for transpiling Veryl code to SystemVerilog.
- [Yosys](https://github.com/YosysHQ/yosys?tab=readme-ov-file#building-from-source) for synthesis
- [NextPNR](https://github.com/YosysHQ/nextpnr?tab=readme-ov-file#getting-started) for place and route
- [OpenOCD](https://openocd.org/pages/getting-openocd.html) for programming the device
- [Project Trellis](https://github.com/YosysHQ/prjtrellis) for bitstream generation, and other device specifics

## Building and programming

With the toolchain set up, and the dev board connected, run 
```
make
```
to build the project and reprogram the FPGA. 

## Expected behavior

A simple counter, button 0 increments the counter, button 1 decrements it. LEDs 0-3 are used as a bit display of the counter.
