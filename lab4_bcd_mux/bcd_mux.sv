module bcd_mux (
            input logic clk,
            input logic enable,
            input logic reset,
            input logic [13:0] number,
            output logic [3:0] output_number,
            output logic [3:0] split_out[4]
);

    logic ppms;
    logic [3:0] split_numbers[4];
    logic [13:0] tmp_number;
    assign split_out = split_numbers;

    // Splits the number into four decimal places
    assign split_numbers[3] = number / 1000;
    assign split_numbers[2] = (number - split_numbers[3] * 1000)/100;
    assign split_numbers[1] = (number - split_numbers[2] * 100 - split_numbers[3] *1000)/10;
    assign split_numbers[0] = (number - split_numbers[1] * 10 - split_numbers[2] * 100 - split_numbers[3] *1000)/10;

    // 19-Bit counter
    logic [18:0] bit_cnt;
    always_ff @(posedge clk) begin
        if (reset)
            bit_cnt <= 0;
        else if (bit_cnt == 999999)
            bit_cnt <= 0;
        else
            bit_cnt <= bit_cnt + 1;
    end

    // 10ms Pulse for Counter
    assign ppms = (bit_cnt == 999999) ? 1 : 0;

    // 2-Bit Select Counter
    logic [1:0] sel_cnt;
    always_ff @(posedge clk) begin
        if (reset)
            sel_cnt <= 0;
        else if (ppms == 1)
            sel_cnt <= sel_cnt + 1;
    end

    // 2 to 4 Decoder
    logic [3:0] digit_select;
    always_comb begin
        case (sel_cnt)
            0   :   digit_select = 4'b1110;
            1   :   digit_select = 4'b1101;
            2   :   digit_select = 4'b1011;
            3   :   digit_select = 4'b0111;
            default : digit_select = 4'bxxxx;
        endcase
    end

    // Number MUX
    always_comb begin
        case (sel_cnt)
            0   :   output_number = split_numbers[0];
            1   :   output_number = split_numbers[1];
            2   :   output_number = split_numbers[2];
            3   :   output_number = split_numbers[3];
            default : output_number = 4'bxxxx;
        endcase
    end

endmodule