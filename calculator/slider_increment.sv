module slider_increment #(
    parameter SLIDER_OVERFLOW = 32500000
)(
    input logic clk,
    input logic rst_ext,
    input logic slider_1,
    input logic slider_2,
    input logic slider_3,
    input logic slider_4,
    input logic write_number_select,
    input logic btn_clr,
    output logic [13:0] number_1,
    output logic [13:0] number_2
);

    logic rst_int;
    logic rst;

    assign rst = rst_ext | rst_int;

    // slider_1 - counter
    logic [25:0] cnt_1;
    logic [25:0] cnt_2;
    logic [25:0] cnt_3;
    logic [25:0] cnt_4;

    always_ff @( posedge clk ) begin
        if (rst || btn_clr) begin
            cnt_1 <= 0;
            cnt_2 <= 0;
            cnt_3 <= 0;
            cnt_4 <= 0;
        end
        else if (slider_1)
            cnt_1 <= cnt_1 + 1;
        else if (slider_2)
            cnt_2 <= cnt_2 + 1;
        else if (slider_3)
            cnt_3 <= cnt_3 + 1;
        else if (slider_4)
            cnt_4 <= cnt_4 + 1;
    end

    // Increment based on active slider, default max: 32500000
    always_ff @( posedge clk ) begin
        if(rst_ext || btn_clr || number_1 > 9999 || number_2 > 9999) begin
            number_1 <= 0;
            number_2 <= 0;
        end
        else if(cnt_1 == SLIDER_OVERFLOW && write_number_select == 0)
            number_1 <= number_1 + 1;
        else if(cnt_1 == SLIDER_OVERFLOW && write_number_select == 1)
            number_2 <= number_2 + 1;
        else if(cnt_2 == SLIDER_OVERFLOW && write_number_select == 0)
            number_1 <= number_1 + 10;
        else if(cnt_2 == SLIDER_OVERFLOW && write_number_select == 1)
            number_2 <= number_2 + 10;
        else if(cnt_3 == SLIDER_OVERFLOW && write_number_select == 0)
            number_1 <= number_1 + 100;
        else if(cnt_3 == SLIDER_OVERFLOW && write_number_select == 1)
            number_2 <= number_2 + 100;
        else if(cnt_4 == SLIDER_OVERFLOW && write_number_select == 0)
            number_1 <= number_1 + 1000;
        else if(cnt_4 == SLIDER_OVERFLOW && write_number_select == 1)
            number_2 <= number_2 + 1000;
        else begin
            number_1 <= number_1;
            number_2 <= number_2;
        end
    end

    always_comb begin
        if(cnt_1 > SLIDER_OVERFLOW || cnt_2 > SLIDER_OVERFLOW || cnt_3 > SLIDER_OVERFLOW || cnt_4 > SLIDER_OVERFLOW)
            rst_int = 1;
        else
            rst_int = 0;
    end

endmodule
