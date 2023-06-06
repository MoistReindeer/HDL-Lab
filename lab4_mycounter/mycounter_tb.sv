module mycounter_tb ( );
    timeprecision 100ps;

    logic clk = 0, reset = 1, ena = 0;
    logic [7:0] count;

    //create simulated clock signal
    always #5ns clk = ~clk;

    // instanciate mycounter module
    mycounter DUT(.clk(clk),
                  .reset(reset),
                  .enable(ena),
                  .cnt(count));
    
    initial begin
        $dumpfile("./build/counter.vcd");
        $dumpvars(0, mycounter_tb);
        #56ns;
        reset = 0;
        #50ns;
        ena = 1;
        #2750ns;
        $finish;
    end
endmodule
