module mycounter_tb ( );

    logic clk = 0, reset = 1, ena = 0;
    logic [7:0] count;

    //create simulated clock signal
    always #1 clk = ~clk;

    // instanciate mycounter module
    mycounter DUT(.clk(clk),
                  .reset(reset),
                  .enable(ena),
                  .cnt(count));
    
    initial begin
        $dumpfile("./build/counter.vcd");
        $dumpvars(0, mycounter_tb);
        $monitor($time,"%b, %b, %b, %d", clk, reset, ena, count);
        #56;
        reset = 0;
        #50;
        ena = 1;
        #200;
        $finish;
    end
endmodule