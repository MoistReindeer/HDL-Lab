/* verilator lint_off UNOPTFLAT */
module arithmetic (
    input logic [13:0] number1,
    input logic [13:0] number2,
    input logic arithmetic_sel,
    output logic [13:0] result
);

    always_comb begin
        case (arithmetic_sel)
            0   :   result = number1 + number2;
            1   :   result = number1 - number2;
            default:    result = result;
        endcase
    end

endmodule
