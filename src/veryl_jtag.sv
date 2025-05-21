module veryl_jtag_JtagTop (
    // Physical on board reset
    input var logic rst,

    // Debugging
    output var logic led0,
    output var logic led1,
    output var logic led2,
    output var logic led3,

    // JTAG Clock
    input var logic TCK,
    // JTAG IO
    output var logic TDO,
    input  var logic TDI,
    input  var logic TMS
);
    // for now
    always_comb TDO = 0;
    // ---
    // TAP Controller
    logic         SDR  ;
    logic         SIR  ;
    logic         UIR  ;
    logic [4-1:0] state;
    tap_controller_TAPController tap_ctl (
        .rst   (rst  ),
        .TCK   (TCK  ),
        .TMS   (TMS  ),
        .SDR   (SDR  ),
        .SIR   (SIR  ),
        .UIR   (UIR  ),
        .state (state)
    );
    // ---
    // JTAG Registers
    // Intermediate signals
    logic [4-1:0] insn;
    // TODO: Rename this project to something else.
    // Maybe jtag_regs?
    jtag_vr_InstructionRegister instr_reg (
        .rst   (rst),
        .td_i  (TDI),
        .tck   (TCK),
        .sir_i (SIR),
        .uir_i (UIR),
        .
        insn_o (insn)
    );
    // Debugging
    always_comb led0 = insn[0];
    always_comb led1 = insn[1];
    always_comb led2 = insn[2];
    always_comb led3 = insn[3];
    // ---
endmodule
//# sourceMappingURL=veryl_jtag.sv.map
