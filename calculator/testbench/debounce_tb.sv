/* verilator lint_off UNUSEDSIGNAL */
module debounce_tb ();
    logic clk = 0;
    logic reset = 1;
    logic button = 0;
    logic slider = 0;
    logic button_deb;
    logic slider_deb;

    debounce DUT_bt (
        .clk(clk),
        .rst_ext(reset),
        .undeb(button),
        .deb(button_deb)
    );

    debounce DUT_sl (
        .clk(clk),
        .rst_ext(reset),
        .undeb(slider),
        .deb(slider_deb)
    );

    always #1ns clk <= ~clk;

    initial begin
        $dumpfile("./build/debounce.fst");
        $dumpvars(0, DUT_bt, DUT_sl);
        #2ns;
        reset = 0;
        #2ns;
        button = 1;
        #2ns;
        button = 0;
        #2ns;
        button = 1;
        #50ns;
        button = 0;

        slider = 1;
        #2ns;
        slider = 0;
        #2ns;
        slider = 1;
        #50ns;
        slider = 0;
        #2ns;
        $finish;
    end

endmodule
