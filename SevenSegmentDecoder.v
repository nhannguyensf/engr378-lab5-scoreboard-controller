// SevenSegmentDecoder.v
// Converts a 4-bit binary value (0–9) into 7-segment display pattern
// Segment output is active-low (0 = LED ON, 1 = LED OFF)

module SevenSegmentDecoder (
    input [3:0] value,     // 4-bit BCD input (0–9)
    output reg [6:0] seg   // 7-segment output {a,b,c,d,e,f,g}
);
    always @(*) begin
        case (value)
            4'd0: seg = 7'b1000000; // 0
            4'd1: seg = 7'b1111001; // 1
            4'd2: seg = 7'b0100100; // 2
            4'd3: seg = 7'b0110000; // 3
            4'd4: seg = 7'b0011001; // 4
            4'd5: seg = 7'b0010010; // 5
            4'd6: seg = 7'b0000010; // 6
            4'd7: seg = 7'b1111000; // 7
            4'd8: seg = 7'b0000000; // 8
            4'd9: seg = 7'b0011000; // 9
            4'd15: seg = 7'b1111111; // Blank (optional)
            default: seg = 7'b0000110; // Error: display "E"
        endcase
    end
endmodule
