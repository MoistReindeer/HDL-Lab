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
    logic [3:0] split_nr_0, split_nr_1, split_nr_2, split_nr_3;

    bcd_mux #(
        .REFRESH_OVERFLOW(REFRESH_OVERFLOW)
    ) MUX (
        .clk(clk),
        .reset(reset),
        .number_0(split_nr_0),
        .number_1(split_nr_1),
        .number_2(split_nr_2),
        .number_3(split_nr_3),
        .output_number(digit_display),
        .digit_select(digit_select));

    seg_dec seg_dec_mod (
        .disp_num(digit_display),
        .bcn(led_select));
    
    // Splits the number into four decimal places
    split_number number_mod (
        .number_i(to_display_nr),
        .number_o0(split_nr_0),
        .number_o1(split_nr_1),
        .number_o2(split_nr_2),
        .number_o3(split_nr_3));
    
endmodule
