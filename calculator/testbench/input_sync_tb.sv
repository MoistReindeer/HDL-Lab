/* verilator lint_off UNUSEDSIGNAL */
module input_sync_tb ();
    logic clk = 0;
    logic reset = 1;
    logic unsync_input = 0;
    logic sync_output;

    input_sync DUT (
        .clk(clk),
        .rst(reset),
        .unsync(unsync_input),
        .synced(sync_output)
    );

    always #5ns clk <= ~clk;

    initial begin
        $dumpfile("./build/input_sync.fst");
        $dumpvars(0, DUT);

        #1ns;
        reset = 0;
        #10ns;
        unsync_input = 1;
        #90ns;
        unsync_input = 0;
        #100ns;

        $finish;
    end
endmodule
