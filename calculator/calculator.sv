/* verilator lint_off UNUSEDSIGNAL */
module calculator #(
    parameter REFRESH_OVERFLOW = 2**19-1,
    parameter DB_OVERFLOW = 999999,
    parameter SLIDER_OVERFLOW = 32500000
)(
    input logic clk,
    input logic reset,
    input logic button_clr_undeb,
    input logic button_ent_undeb,
    input logic sld_1,
    input logic sld_2,
    input logic sld_3,
    input logic sld_4,
    input logic sld_arith,
    output logic [3:0] digit_select,
    output logic [6:0] led_select
);
    // Module to debounce and sync buttons and sliders
    logic btn_clr, btn_ent;
    calculator_input #(
        .DB_OVERFLOW(DB_OVERFLOW)
    ) input_mod (
        .clk(clk),
        .reset(reset),
        .button_clr_undeb(button_clr_undeb),
        .button_ent_undeb(button_ent_undeb),
        .button_clr(btn_clr),
        .button_ent(btn_ent));
    
    // Module to handle the slider input
    logic output_number_select = 0;
    logic [13:0] number_1;
    logic [13:0] number_2;

    always_ff @( posedge clk ) begin
        if(reset || btn_clr)
            output_number_select <= 0;
        else if (btn_ent)
            output_number_select <= output_number_select + 1;
        else
            output_number_select <= output_number_select;
    end

    slider_increment #(
        .SLIDER_OVERFLOW(SLIDER_OVERFLOW)
    ) slider_mod (
        .clk(clk), 
        .rst_ext(reset),
        .slider_1(sld_1),
        .slider_2(sld_2),
        .slider_3(sld_3),
        .slider_4(sld_4),
        .write_number_select(output_number_select),
        .btn_clr(btn_clr),
        .number_1(number_1),
        .number_2(number_2));
    
    logic [13:0] number_result;

    // Arithmetic module
    arithmetic arithmetic_mod (
        .number1(number_1),
        .number2(number_2),
        .arithmetic_sel(sld_arith),
        .result(number_result));
    
    // Multiplexer for the display number
    logic [13:0] display_number;
    logic [1:0] select_number;
    
    always_ff @( posedge clk ) begin
        if (reset || btn_clr)
            select_number <= 0;
        else if (btn_ent)
            select_number <= select_number + 1;
    end

    always_comb begin
        case (select_number)
            0   : display_number = number_1;
            1   : display_number = number_2;
            2   : display_number = number_result;
            default: display_number = {14{1'bx}};
        endcase
    end

    display #(
        .REFRESH_OVERFLOW(REFRESH_OVERFLOW)
    ) display (
        .clk(clk),
        .reset(reset),
        .to_display_nr(display_number),
        .digit_select(digit_select),
        .led_select(led_select));

endmodule
