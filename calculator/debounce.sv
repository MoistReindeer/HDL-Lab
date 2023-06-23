module debounce #(
    parameter DB_OVERFLOW = 100000000
)(
    input logic clk,
    input logic rst_ext,
    input logic undeb,
    output logic deb
);
    logic [26:0] cnt;
    logic exp;
    logic rst;
    assign rst = rst_ext | undeb;

    always_ff @( posedge clk ) begin
        if (rst)
            cnt <= 0;
        else if (cnt == DB_OVERFLOW)
            cnt <= cnt;
        else
            cnt <= cnt + 1;
    end

    // Check if expired
    assign exp = (cnt == DB_OVERFLOW) ? 1 : 0;

    assign deb = exp & undeb;

endmodule
