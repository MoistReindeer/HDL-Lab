module slider_increment (
    input logic clk,
    input logic rst_ext,
    input logic slider_1,
    input logic slider_2,
    input logic slider_3,
    input logic slider_4,
    output logic [13:0] number_1,
    output logic [13:0] number_2
);

    logic rst_int = 0;
    logic rst = 0;

    assign rst = rst_ext | rst_int;

    // slider_1 - counter
    logic [25:0] cnt_1 = 0;
    logic [25:0] cnt_2 = 0;
    logic [25:0] cnt_3 = 0;
    logic [25:0] cnt_4 = 0;

    always_ff @( posedge clk ) begin
        if (rst) begin
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
        if(cnt_1 == 32500000)
            number_1 <= number_1 + 1;
        else if(cnt_2 == 32500000)
            number_1 <= number_1 + 10;
        else if(cnt_3 == 32500000)
            number_1 <= number_1 + 10;
        else if(cnt_4 == 32500000)
            number_1 <= number_1 + 10;
    end

endmodule
