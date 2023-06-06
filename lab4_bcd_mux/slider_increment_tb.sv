/* verilator lint_off UNUSEDSIGNAL */
module slider_increment_tb ();
    logic clk = 0;
    logic rst = 1;

    always #5ns clk <= ~clk;

    logic slider_1 = 0;
    logic slider_2 = 0;
    logic slider_3 = 0;
    logic slider_4 = 0;


    slider_increment DUT (
                        .clk(clk),
                        .rst_ext(rst),
                        .slider_1(slider_1),
                        .slider_2(slider_2),
                        .slider_3(slider_3),
                        .slider_4(slider_4)
                        );

    initial begin
        $dumpfile("./build/slider_increment.fst");
        $dumpvars(0, DUT);

        #10ns;
        rst = 0;
        #10ns;
        slider_1 = 1;
        #50ns;
        slider_1 = 0;
        #50ns;
        slider_2 = 1;
        #50ns;
        slider_2 = 0;
        #50ns;
        slider_3 = 1;
        #50ns;
        slider_3 = 0;
        #50ns;
        slider_4 = 1;
        #50ns;
        slider_4 = 0;
        #50ns;
        slider_1 = 1;
        #1ns;
        slider_2 = 1;
        #50ns;
        slider_1 = 0;
        #10ns;
        slider_2 = 0;
        #1ns;
        $finish;
    end

endmodule
