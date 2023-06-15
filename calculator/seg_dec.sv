module seg_dec (
    input logic [3:0] disp_num, // Number to decode to a binary 7 segment number
    output logic [6:0] bcn // Pins of the 7 segment LEDs
);

    always_comb
    begin
        case (disp_num)
            0   :   bcn = 7'b0000001;
            1   :   bcn = 7'b1001111;
            2   :   bcn = 7'b0010010;
            3   :   bcn = 7'b0000110;
            4   :   bcn = 7'b1001100;
            5   :   bcn = 7'b0100100;
            6   :   bcn = 7'b0100000;
            7   :   bcn = 7'b0001111;
            8   :   bcn = 7'b0000000;
            9   :   bcn = 7'b0000100;
            default : bcn = 7'bxxxxxxx;
        endcase
    end
endmodule
