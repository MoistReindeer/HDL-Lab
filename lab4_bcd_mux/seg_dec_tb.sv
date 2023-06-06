/* verilator lint_off UNUSEDSIGNAL */
module seg_dec_tb ( );
    timeprecision 1ns;

    logic clk = 0;
    logic [3:0] number;
    logic [6:0] led_select;

    always #5ns clk <= ~clk;

    seg_dec decoder(
                    .disp_num(number),
                    .bcn(led_select));

    initial begin
        $dumpfile("./build/seg_dec.vcd");
        $dumpvars(0, decoder);
        #1ns;

        for (int i = 0; i < 4; i++)
        begin
            for (logic [3:0] j = 0; j < 10; j++)
            begin
                assign number = j;
                #2ns;
            end
        end
        $finish;
    end

endmodule
