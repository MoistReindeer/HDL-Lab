/* verilator lint_off UNUSEDSIGNAL */
module calculator_tb ();
    logic clk = 0;
    logic rst = 1;

    always #1ns clk <= ~clk;

    logic btn_clr_in = 0;
    logic btn_ent_in = 0;
    logic sld_1_in, sld_2_in, sld_3_in, sld_4_in, sld_arith_in;
    logic [3:0] digit_select;
    logic [6:0] led_select;

    calculator #(
                .REFRESH_OVERFLOW(2),
                .DB_OVERFLOW(8),
                .SLIDER_OVERFLOW(2)
    ) DUT (
        .clk(clk),
        .reset(rst),
        .digit_select(digit_select),
        .led_select(led_select),
        .button_clr_undeb(btn_clr_in),
        .button_ent_undeb(btn_ent_in),
        .slider_1_undeb(sld_1_in),
        .slider_2_undeb(sld_2_in),
        .slider_3_undeb(sld_3_in),
        .slider_4_undeb(sld_4_in),
        .slider_arith_undeb(sld_arith_in));
    
    initial begin
        $dumpfile("./build/calculator.fst");
        $dumpvars(0, DUT);

        #5ns;
        rst = 0;
        #20ns;
        // Set first number
        sld_1_in = 1;
        #20ns;
        sld_1_in = 0;
        sld_2_in = 1;
        #40ns;
        sld_2_in = 0;
        sld_3_in = 1;
        #40ns;
        sld_3_in = 0;
        sld_4_in = 1;
        #40ns;
        sld_4_in = 0;
        #5ns;
        btn_ent_in = 1;
        #10ns;
        btn_ent_in = 0;

        // Set second number
        #40ns;
        sld_1_in = 1;
        #40ns;
        sld_1_in = 0;
        sld_2_in = 1;
        #40ns;
        sld_2_in = 0;
        sld_3_in = 1;
        #40ns;
        sld_3_in = 0;
        sld_4_in = 1;
        #40ns;
        sld_4_in = 0;
        #5ns;
        btn_ent_in = 1;
        #10ns;
        btn_ent_in = 0;

        #100ns;
        sld_arith_in = 1;
        #10ns;
        sld_arith_in = 0;
        #100ns;

        $finish;
    end
endmodule
