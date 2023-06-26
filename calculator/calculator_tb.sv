/* verilator lint_off UNUSEDSIGNAL */
module calculator_tb ();
    logic clk = 0;
    logic rst = 1;

    always #5ns clk <= ~clk;

    logic btn_clr_in = 0;
    logic btn_ent_in = 0;
    logic sld_1_in = 0;
    logic sld_2_in = 0;
    logic sld_3_in = 0;
    logic sld_4_in = 0;
    logic sld_arith_in = 0;
    logic [3:0] digit_select;
    logic [6:0] led_select;

    calculator #(
        .REFRESH_OVERFLOW(10),
        .DB_OVERFLOW(1),
        .SLIDER_OVERFLOW(3)
    ) DUT (
        .clk(clk),
        .reset(rst),
        .digit_select(digit_select),
        .led_select(led_select),
        .button_clr_undeb(btn_clr_in),
        .button_ent_undeb(btn_ent_in),
        .sld_1(sld_1_in),
        .sld_2(sld_2_in),
        .sld_3(sld_3_in),
        .sld_4(sld_4_in),
        .sld_arith(sld_arith_in));
    
    initial begin
        $dumpfile("./build/calculator.fst");
        $dumpvars(0, DUT);

        #15ns;
        rst = 0;
        #20ns;
        // Set first number
        sld_1_in = 1;
        #20ns;
        sld_1_in = 0;
        sld_2_in = 1;
        #80ns;
        sld_2_in = 0;
        sld_3_in = 1;
        #40ns;
        sld_3_in = 0;
        sld_4_in = 1;
        #120ns;
        sld_4_in = 0;
        #5ns;
        btn_ent_in = 1;
        #10ns;
        btn_ent_in = 0;

        // Set second number
        #10ns;
        sld_1_in = 1;
        #60ns;
        sld_1_in = 0;
        sld_2_in = 1;
        #150ns;
        sld_2_in = 0;
        sld_3_in = 1;
        #40ns;
        sld_3_in = 0;
        sld_4_in = 1;
        #200ns;
        sld_4_in = 0;
        #5ns;
        btn_ent_in = 1;
        #10ns;
        btn_ent_in = 0;

        #100ns;
        sld_arith_in = 1;
        #100ns;
        sld_arith_in = 0;
        #10ns;

        $finish;
    end
endmodule
