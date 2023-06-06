/* verilator lint_off WIDTHTRUNC */
module top #(
    parameter REFRESH_OVERFLOW = 2**19-1
)(
    input logic clk,
    input logic reset,
    input logic [13:0] sld,
    output logic [3:0] digit_select,
    output logic [6:0] led_select
);

    display #(
        .REFRESH_OVERFLOW(REFRESH_OVERFLOW)
    ) display (
        .clk(clk),
        .reset(reset),
        .to_display_nr(sld),
        .digit_select(digit_select),
        .led_select(led_select)
    );

endmodule
