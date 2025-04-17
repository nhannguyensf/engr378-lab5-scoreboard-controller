// ResetHold.v
// Requires reset button (active-low) to be held for 1 second at 50 MHz (50M cycles)

module ResetHold (
    input clk,                // 50 MHz clock
    input rst_button,         // active-low input
    output reg reset_ready    // goes HIGH only after 1 second of holding
);
    reg [25:0] counter;       // 26 bits enough for 50 million

    always @(posedge clk) begin
        if (~rst_button) begin
            if (counter < 26'd50_000_000)
                counter <= counter + 1;
        end else begin
            counter <= 0;
        end

        reset_ready <= (counter >= 26'd50_000_000);
    end
endmodule
