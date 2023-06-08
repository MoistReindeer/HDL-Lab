module display #(
    parameter REFRESH_OVERFLOW = 2**19-1
) (
    input logic clk,
    input logic reset,
    input logic [13:0] to_display_nr,
    output logic [3:0] digit_select,
    output logic [6:0] led_select
);
    
    logic [3:0] digit_display;
    logic [3:0] split_nr[4];

    bcd_mux #(
        .REFRESH_OVERFLOW(REFRESH_OVERFLOW)
    ) MUX (
        .clk(clk),
        .reset(reset),
        .number_0(split_nr[0]),
        .number_1(split_nr[1]),
        .number_2(split_nr[2]),
        .number_3(split_nr[3]),
        .output_number(digit_display),
        .digit_select(digit_select));

    seg_dec seg_dec_mod (
        .disp_num(digit_display),
        .bcn(led_select));
    
    // Splits the number into four decimal places
    split_number number_mod (
        .number_i(to_display_nr),
        .number_o(split_nr));
    
endmodule
