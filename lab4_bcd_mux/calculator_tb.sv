module calculator_tb ();
    logic clk = 0;
    logic ena = 1;
    logic rst = 1;

    always #5ns clk <= ~clk;

    logic btn_add = 0;
    logic btn_sub = 0;
    logic btn_clr = 0;
    logic btn_ent = 0;
    logic sld_1, sld_2, sld_3, sld_4;

    calculator DUT (
        .clk(clk),
        .reset(rst),
        .enable(ena),
        .button_clr_undeb(btn_clr),
        .button_add_undeb(btn_add),
        .button_sub_undeb(btn_sub),
        .button_ent_undeb(btn_ent),
        .slider_1_undeb(sld_1),
        .slider_2_undeb(sld_2),
        .slider_3_undeb(sld_3),
        .slider_4_undeb(sld_4));
    
    initial begin
        $dumpfile("./build/calculator.fst");
        $dumpvars(0, DUT);

        #5ns;
        rst = 0;
        #20ns;
        // Set first number
        sld_1 = 1;
        #20ns;
        sld_1 = 0;
        sld_2 = 1;
        #40ns;
        sld_2 = 0;
        sld_3 = 1;
        #40ns;
        sld_3 = 0;
        sld_4 = 1;
        #40ns;
        sld_4 = 0;
        #5ns;
        btn_ent = 1;
        #10ns;
        btn_ent = 0;

        // Set second number
        #40ns;
        sld_1 = 1;
        #40ns;
        sld_1 = 0;
        sld_2 = 1;
        #40ns;
        sld_2 = 0;
        sld_3 = 1;
        #40ns;
        sld_3 = 0;
        sld_4 = 1;
        #40ns;
        sld_4 = 0;
        #5ns;
        btn_ent = 1;
        #10ns;
        btn_ent = 0;

        #100ns;
        btn_sub = 1;
        #10ns;
        btn_sub = 0;
        #100ns;

        $finish;
    end
endmodule
