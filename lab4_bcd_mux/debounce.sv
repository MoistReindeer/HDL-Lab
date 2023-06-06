module debounce (
    input logic clk,
    input logic rst_ext,
    input logic undeb,
    output logic deb
);
    logic [19:0] cnt;
    logic exp;
    logic rst = rst_ext | undeb;

    always_ff @( posedge clk ) begin
        if (rst && cnt == 999999)
            cnt <= 0;
        else if (cnt == 999999)
            cnt <= cnt;
        else
            cnt <= cnt + 1;
    end

    // Check if expired
    assign exp = (cnt == 999999) ? 1 : 0;

    assign deb = exp & undeb;

endmodule
