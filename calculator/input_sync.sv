module input_sync (
    input logic clk,
    input logic rst,
    input logic unsync,
    output logic synced
);
    
    logic [2:0] input_signal;
    always_ff @( posedge clk ) begin
        if (rst)
            input_signal <= 0;
        else
            input_signal <= {input_signal[1:0], unsync};
    end

    assign synced = ~input_signal[2] & input_signal[1];

endmodule
