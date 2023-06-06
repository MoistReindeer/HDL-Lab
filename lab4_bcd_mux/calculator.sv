/* verilator lint_off UNUSEDSIGNAL */
module calculator #(
    parameter REFRESH_OVERFLOW = 2**19-1,
    parameter DB_OVERFLOW = 100000000,
    parameter SLIDER_OVERFLOW = 32500000
)(
    input logic clk,
    input logic reset,
    input logic button_clr_undeb,
    input logic button_add_undeb,
    input logic button_sub_undeb,
    input logic button_ent_undeb,
    input logic slider_1_undeb,
    input logic slider_2_undeb,
    input logic slider_3_undeb,
    input logic slider_4_undeb,
    output logic [3:0] digit_select,
    output logic [6:0] led_select
);
    logic enable = 1;
    
    // Module to debounce and sync buttons and sliders
    logic btn_clr, btn_ent, btn_add, btn_sub;
    logic sld_1, sld_2, sld_3, sld_4;
    calculator_input #(
        .DB_OVERFLOW(DB_OVERFLOW)
    ) input_mod (
        .clk(clk),
        .reset(reset),
        .button_clr_undeb(button_clr_undeb),
        .button_add_undeb(button_add_undeb),
        .button_sub_undeb(button_sub_undeb),
        .button_ent_undeb(button_ent_undeb),
        .slider_1_undeb(slider_1_undeb),
        .slider_2_undeb(slider_2_undeb),
        .slider_3_undeb(slider_3_undeb),
        .slider_4_undeb(slider_4_undeb),
        .button_clr(btn_clr),
        .button_ent(btn_ent),
        .button_add(btn_add),
        .button_sub(btn_sub),
        .slider_1(sld_1),
        .slider_2(sld_2),
        .slider_3(sld_3),
        .slider_4(sld_4));
    
    // Module to handle the slider input
    logic output_number_select = 0;
    logic [13:0] number_1;
    logic [13:0] number_2;

    always_ff @( posedge clk ) begin
        if (btn_ent)
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
        .number_1(number_1),
        .number_2(number_2));
    
    logic [13:0] number_result;

    // Selects the arithmetic operation
    logic arithmetic_select;
    always_ff @( posedge clk ) begin
        if (btn_sub)
            arithmetic_select <= 1;
        else if (btn_add)
            arithmetic_select <= 0;
        else
            arithmetic_select <= arithmetic_select;
    end
    
    // Arithmetic module
    arithmetic arithmetic_mod (
        .number1(number_1),
        .number2(number_2),
        .arithmetic_sel(arithmetic_select),
        .result(number_result));
    
    // Multiplexer for the display number
    logic [13:0] display_number;
    logic [1:0] select_number;
    
    always_ff @( posedge clk ) begin
        if (reset)
            select_number <= 0;
        else if (btn_ent)
            select_number <= select_number + 1;
    end

    always_comb begin
        case (select_number)
            0   : display_number = number_1;
            1   : display_number = number_2;
            3   : display_number = number_result;
            default: display_number = {14{1'bx}};
        endcase
    end

    logic [3:0] disp_number;

    bcd_mux #(
        .REFRESH_OVERFLOW(REFRESH_OVERFLOW)
    ) bcd_mod (
        .clk(clk),
        .enable(enable),
        .reset(reset),
        .number(display_number),
        .output_number(disp_number),
        .digit_select(digit_select));
    
    seg_dec seg_dec_mod (
        .disp_num(disp_number),
        .bcn(led_select));

endmodule
