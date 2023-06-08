module top #(
    parameter REFRESH_OVERFLOW = 2**19-1
) (
    input logic clk,
    input logic reset,
    input logic [3:0] split_nr[4],
    output logic [3:0] digit_select,
    output logic [6:0] led_select
);
    
    logic [3:0] digit_display;

    bcd_mux #(
        .REFRESH_OVERFLOW(REFRESH_OVERFLOW)
    ) MUX (
        .clk(clk),
        .reset(reset),
        .number(split_nr),
        .output_number(digit_display),
        .digit_select(digit_select));

    seg_dec seg_dec_mod (
        .disp_num(digit_display),
        .bcn(led_select));
    
endmodule
