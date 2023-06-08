module bcd_mux #(
    parameter REFRESH_OVERFLOW = 2**19-1
) (
            input logic clk,
            input logic reset,
            input logic [13:0] number,
            output logic [3:0] output_number,
            output logic [3:0] digit_select
);

    // Splits the number into four decimal places
    logic [3:0] split_nr[4];

    split_number number_mod (
        .number_i(number),
        .number_o(split_nr));

    logic ppms;

    // 19-Bit counter
    logic [19:0] bit_cnt;
    always_ff @(posedge clk) begin
        if (reset)
            bit_cnt <= 0;
        else if (bit_cnt == REFRESH_OVERFLOW)
            bit_cnt <= 0;
        else
            bit_cnt <= bit_cnt + 1;
    end

    // 10ms Pulse for Counter
    assign ppms = (bit_cnt == REFRESH_OVERFLOW) ? 1 : 0;

    // 2-Bit Select Counter
    logic [1:0] sel_cnt;
    always_ff @(posedge clk) begin
        if (reset)
            sel_cnt <= 0;
        else if (ppms == 1)
            sel_cnt <= sel_cnt + 1;
    end

    // 2 to 4 Decoder - Selects one of four connected digits
    always_comb begin
        case (sel_cnt)
            0   :   digit_select = 4'b1110;
            1   :   digit_select = 4'b1101;
            2   :   digit_select = 4'b1011;
            3   :   digit_select = 4'b0111;
            default : digit_select = 4'bxxxx;
        endcase
    end

    // Number MUX - Multiplexes one of the numbers onto the LED-Pins
    always_comb begin
        case (sel_cnt)
            0   :   output_number = split_nr[0];
            1   :   output_number = split_nr[1];
            2   :   output_number = split_nr[2];
            3   :   output_number = split_nr[3];
            default : output_number = 4'bxxxx;
        endcase
    end

endmodule
