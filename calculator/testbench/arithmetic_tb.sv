/* verilator lint_off UNUSEDSIGNAL */
module arithmetic_tb ( );
    logic [13:0] number1 = 1000;
    logic [13:0] number2 = 500;
    logic [13:0] result;
    logic arithmetic_sel = 0;

    arithmetic DUT(
        .number1(number1),
        .number2(number2),
        .arithmetic_sel(arithmetic_sel),
        .result(result));

    initial begin
        $dumpfile("./build/arithmetic.fst");
        $dumpvars(0, DUT);
        #10ns;
        arithmetic_sel = 1;
        #10ns;
        number1 = 2000;
        number2 = 1000;
        #10ns;
        arithmetic_sel = 0;
        #10ns;
        number1 = 9999;
        number2 = 1;
        #10ns
        arithmetic_sel = 1;
        #10ns
        $finish;
    end

endmodule
