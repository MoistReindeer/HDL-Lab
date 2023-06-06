module seg_dec (
    input logic [3:0] disp_num, // Number to decode to a binary 7 segment number
    output logic [6:0] bcn // Pins of the 7 segment LEDs
);

    always_comb
    begin
        case (disp_num)
            0   :   bcn = ~7'b1111110;
            1   :   bcn = ~7'b0110000;
            2   :   bcn = ~7'b1101101;
            3   :   bcn = ~7'b1111001;
            4   :   bcn = ~7'b0110011;
            5   :   bcn = ~7'b1011011;
            6   :   bcn = ~7'b1011110;
            7   :   bcn = ~7'b1110000;
            8   :   bcn = ~7'b1111111;
            9   :   bcn = ~7'b1110011;
            default : bcn = 7'bxxxxxxx;
        endcase
    end
endmodule
