// ResetHold.v
// Requires reset button (active-low) to be held for 2 seconds at 50 MHz (100M cycles)

module ResetHold (
    input clk,                // 50 MHz clock
    input rst_button,         // active-low
    output reg reset_ready    // goes HIGH only after 2 seconds held
);
    reg [26:0] counter;       // 27-bit counter: 2^27 = 134,217,728 > 100M

    always @(posedge clk) begin
        if (~rst_button) begin
            if (counter < 27'd100_000_000)
                counter <= counter + 1;
        end else begin
            counter <= 0;
        end

        reset_ready <= (counter >= 27'd100_000_000);
    end
endmodule
