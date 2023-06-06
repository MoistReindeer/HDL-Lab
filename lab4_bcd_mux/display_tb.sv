/* verilator lint_off UNUSEDSIGNAL */
module display_tb ();
    logic clk = 0;
    logic rst = 1;

    always #1ns clk <= ~clk;

    logic [13:0] number_out = 5423;
    logic [3:0] digit_select;
    logic [6:0] led_select;

    display #(
        .REFRESH_OVERFLOW(4)
    ) DUT (
        .clk(clk),
        .reset(rst),
        .to_display_nr(number_out),
        .digit_select(digit_select),
        .led_select(led_select));
    
    initial begin
        $dumpfile("./build/display.fst");
        $dumpvars(0, DUT);

        #2ns;
        rst = 0;
        #30ns;
        number_out = 1432;
        #30ns;
        number_out = 8483;
        #10ns;
        $finish;
    end
        
endmodule
