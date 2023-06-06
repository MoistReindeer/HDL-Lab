module seg_dec (
    input logic [3:0] disp_num, // Number to decode to a binary 7 segment number
    output logic [6:0] bcn // Pins of the 7 segment LEDs
);

    always_comb
    begin
        case (disp_num)
            0   :   bcn = 8'b1111110;
            1   :   bcn = 8'b0110000;
            2   :   bcn = 8'b1101101;
            3   :   bcn = 8'b1111001;
            4   :   bcn = 8'b0110011;
            5   :   bcn = 8'b1011011;
            6   :   bcn = 8'b1011110;
            7   :   bcn = 8'b1110000;
            8   :   bcn = 8'b1111111;
            9   :   bcn = 8'b1110011;
            default : bcn = 8'bxxxxxxx;
        endcase
    end
endmodule