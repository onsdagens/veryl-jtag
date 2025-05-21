# Numato ECP-5 TAP Controller

This repo contains a minimal TAP Controller implemented in Veryl.
The bundled OpenOCD config, Makefile programming flow and constraints assume a Numato Lab Mimas ECP-5 Mini board, but the TAP controller implementation itself should be platform agnostic (only the pins must be remapped).
## Dependencies

The toolchain consists of:

- [Veryl](https://veryl-lang.org/install/) for transpiling Veryl code to SystemVerilog.
- [Yosys](https://github.com/YosysHQ/yosys?tab=readme-ov-file#building-from-source) for synthesis
- [NextPNR](https://github.com/YosysHQ/nextpnr?tab=readme-ov-file#getting-started) for place and route
- [OpenOCD](https://openocd.org/pages/getting-openocd.html) for programming the device
- [Project Trellis](https://github.com/YosysHQ/prjtrellis) for bitstream generation, and other device specifics
- [ftdaye](https://github.com/onsdagens/ftdaye) for jumping around the TAP controller state machine

## Building and programming

With the toolchain set up, and the dev board connected, run 
```
make flash
```
to build the project and reprogram the FPGA. 

## Expected behavior

The FPGA acts as a TAP controller. The monochrome LEDs act as a bit display, showing the current state of the internal state machine. The number-state mapping can be viewed in the source code. 

For our own (very simple testing) purposes, we have been using the `ftdaye` [`ECP5`](https://github.com/onsdagens/ftdaye/blob/master/examples/ECP5.rs) example to move around the state machine.
