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
    input  var logic TMS,


    // TAP Controller output for implementing wrappers
    output var logic sdr_o,
    output var logic sir_o,
    output var logic uir_o,
    // probably these two are actually the only ones needed from outside
    output var logic cdr_o,
    output var logic udr_o,

    output var logic [4-1:0] instruction_o
);
    // ---
    // TAP Controller

    logic         SDR  ;
    logic         SIR  ;
    logic         UIR  ;
    logic         CDR  ;
    logic         UDR  ;
    logic [4-1:0] state;
    always_comb sdr_o = SDR;
    always_comb sir_o = SIR;
    always_comb uir_o = UIR;
    always_comb cdr_o = CDR;
    always_comb udr_o = UDR;
    tap_controller_TAPController tap_ctl (
        .rst   (rst  ),
        .TCK   (TCK  ),
        .TMS   (TMS  ),
        .SDR   (SDR  ),
        .SIR   (SIR  ),
        .UIR   (UIR  ),
        .CDR   (CDR  ),
        .UDR   (UDR  ),
        .state (state)
    );
    // ---
    // JTAG Registers
    // Instruction Reg
    // Intermediate signals
    logic [4-1:0] insn         ;
    always_comb instruction_o = insn;
    // TODO: Rename this project to something else.
    // Maybe jtag_regs?
    jtag_vr_InstructionRegister instr_reg (
        .rst_ni (rst),
        .td_i   (TDI),
        .tck_i  (TCK),
        .
        tms_i (TMS),
        .
        sir_i (SIR),
        .uir_i (UIR),
        .
        insn_o (insn)
    );
    // Data Regs
    logic [8-1:0] data_reg;
    jtag_vr_DataRegisters data_regs (
        .rst_ni        (rst ),
        .tck_i         (TCK ),
        .instruction_i (insn),
        .data_o        (TDO ),
        .tdi_i         (TDI ),
        .cdr_i         (CDR ),
        .sdr_i         (SDR ),
        .udr_i         (UDR ),
        .tms_i         (TMS ),
        .
        data_reg_o (data_reg)
    );
    // Debugging
    always_comb led0 = data_reg[0];
    always_comb led1 = data_reg[1];
    always_comb led2 = data_reg[2];
    always_comb led3 = data_reg[3];
    // ---
endmodule
//# sourceMappingURL=veryl_jtag.sv.map
