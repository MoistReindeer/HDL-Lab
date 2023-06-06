/* verilator lint_off UNUSEDSIGNAL */
module calculator_input_tb ();
    logic clk = 0;
    logic rst = 1;

    always #5ns clk <= ~clk;

    logic btn_clr_async = 0;
    logic btn_ent_async = 0;
    logic btn_add_async = 0;
    logic btn_sub_async = 0;
    logic btn_clr;
    logic btn_ent;
    logic btn_add;
    logic btn_sub;
    logic sld_async [4];
    logic sld [4];

    calculator_input DUT (
        .clk(clk),
        .reset(rst),
        .button_clr_undeb(btn_clr_async),
        .button_ent_undeb(btn_ent_async),
        .button_add_undeb(btn_add_async),
        .button_sub_undeb(btn_sub_async),
        .button_clr(btn_clr),
        .button_ent(btn_ent),
        .button_add(btn_add),
        .button_sub(btn_sub),
        .slider_1_undeb(sld_async[0]),
        .slider_2_undeb(sld_async[1]),
        .slider_3_undeb(sld_async[2]),
        .slider_4_undeb(sld_async[3]),
        .slider_1(sld[0]),
        .slider_2(sld[1]),
        .slider_3(sld[2]),
        .slider_4(sld[3]));
    
    initial begin
        $dumpfile("./build/calculator_input.fst");
        $dumpvars(0, DUT);

        #10ns;
        rst = 0;
        #7ns;
        btn_clr_async = 1;
        btn_ent_async = 1;
        btn_add_async = 1;
        btn_sub_async = 1;
        #37ns;
        btn_clr_async = 0;
        btn_ent_async = 0;
        btn_add_async = 0;
        btn_sub_async = 0;

        sld_async[0] = 1;
        sld_async[1] = 1;
        sld_async[2] = 1;
        sld_async[3] = 1;
        #17ns;
        sld_async[0] = 0;
        sld_async[1] = 0;
        sld_async[2] = 0;
        sld_async[3] = 0;

        $finish;
    end
    
endmodule
