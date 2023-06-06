module calculator_input_tb ();
    logic clk = 0;
    logic rst = 1;

    always #5ns clk <= ~clk;

    logic btn_clr = 0;
    logic btn_ent = 0;
    logic btn_add = 0;
    logic btn_sub = 0;
    logic sld_1 = 0;
    logic sld_2 = 0;
    logic sld_3 = 0;
    logic sld_4 = 0;

    calculator_input DUT (
        .clk(clk),
        .reset(rst),
        .button_clr_undeb(btn_clr),
        .button_ent_undeb(btn_ent),
        .button_add_undeb(btn_add),
        .button_sub_undeb(btn_sub),
        .slider_1_undeb(sld_1),
        .slider_2_undeb(sld_2),
        .slider_3_undeb(sld_3),
        .slider_4_undeb(sld_4));
    
    initial begin
        $dumpfile("./build/calculator_input.fst");
        $dumpvars(0, DUT);

        #10ns;
        rst = 0;
        #7ns;
        btn_clr = 1;
        btn_ent = 1;
        btn_add = 1;
        btn_sub = 1;
        #37ns;
        btn_clr = 0;
        btn_ent = 0;
        btn_add = 0;
        btn_sub = 0;

        sld_1 = 1;
        sld_2 = 1;
        sld_3 = 1;
        sld_4 = 1;
        #17ns;
        sld_1 = 0;
        sld_2 = 0;
        sld_3 = 0;
        sld_4 = 0;

        $finish;
    end
    
endmodule
