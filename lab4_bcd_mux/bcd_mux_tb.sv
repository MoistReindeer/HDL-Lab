module bcd_mux_tb ( );
    timeprecision 1ns;

    logic clk = 0;
    logic ena = 0;
    logic rst = 0;
    logic [13:0] number_in;
    logic [3:0] muxed_number;
    output logic [3:0] split_out[4];

    always #5ns clk = ~clk;

    bcd_mux DUT(
            .clk(clk),
            .enable(ena),
            .reset(rst),
            .number(number_in),
            .output_number(muxed_number),
            .split_out(split_out));
    
    initial begin
        $dumpfile("./build/data.vcd");
        $dumpvars(0, DUT);
        #1ns;
        number_in = 0;
        rst = 1;
        #5ns;
        rst = 0;
        #1ns;
        ena = 1;
        
        for (int i = 0; i < 100; i++)
        begin
            number_in = number_in + 1;
            #20ns;
        end

        #1ns;
        $finish;
    end
endmodule