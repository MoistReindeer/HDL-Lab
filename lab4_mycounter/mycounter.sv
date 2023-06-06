module mycounter (
    input logic clk, reset,
    input logic enable,
    output logic [7:0] cnt
);
    
    always_ff @( posedge clk ) begin
        if (reset)
            cnt <= 0;
        else if (enable)
            cnt <= cnt + 1;
    end
endmodule