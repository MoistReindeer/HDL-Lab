/* verilator lint_off UNOPTFLAT */
module split_number (
    input logic [13:0] number_i,
    output logic [3:0] number_o [4]
);

    logic [13:0] split_nr[4];

    assign split_nr[3] = number_i / 1000;
    assign split_nr[2] = (number_i - split_nr[3] *1000)/100;
    assign split_nr[1] = (number_i - split_nr[2] *100 - split_nr[3] *1000)/10;
    assign split_nr[0] = (number_i - split_nr[1] *10 - split_nr[2] * 100 - split_nr[3] *1000);

    assign number_o[3] = split_nr[3][3:0];
    assign number_o[2] = split_nr[2][3:0];
    assign number_o[1] = split_nr[1][3:0];
    assign number_o[0] = split_nr[0][3:0];

endmodule
