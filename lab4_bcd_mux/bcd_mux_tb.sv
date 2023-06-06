/* verilator lint_off UNUSEDSIGNAL */
module bcd_mux_tb ( );
    logic clk = 0;
    logic ena = 0;
    logic rst = 0;
    logic [13:0] number_in;
    logic [3:0] muxed_number;
    logic [3:0] split_out[4];
    logic [3:0] digit_select;

    always #5ns clk <= ~clk;

    bcd_mux #(
        .REFRESH_OVERFLOW(8)
    ) DUT (
            .clk(clk),
            .enable(ena),
            .reset(rst),
            .number(number_in),
            .output_number(muxed_number),
            .digit_select(digit_select));

    initial begin
        $dumpfile("./build/bcd_mux.fst");
        $dumpvars(0, DUT);
        #1ns;
        number_in = 0;
        rst = 1;
        #5ns;
        rst = 0;
        #1ns;
        ena = 1;

        for (int i = 0; i < 100; i++)
        begin
            number_in = number_in + 1;
            #20ns;
        end

        #1ns;
        $finish;
    end
endmodule
