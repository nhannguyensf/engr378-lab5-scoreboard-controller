// DebounceOnePulse.v
// Debounces an active-low pushbutton and outputs a clean, one-clock-cycle pulse
// on each valid press (falling edge of raw button input).

module DebounceOnePulse (
    input clk,         // system clock
    input btn_in,      // raw active-low button input (0 = pressed, 1 = released)
    output reg pulse   // clean one-cycle-wide pulse when button is pressed
);
    reg [2:0] sync;     // 3-bit shift register for debounce
    reg debounced;      // debounced button state (1 = pressed)
    reg prev;           // previous debounced state

    wire btn_active;    // internal active-high signal (1 when button is pressed)

    // Convert active-low input to active-high internally
    assign btn_active = ~btn_in;

    always @(posedge clk) begin
        // Step 1: Sample and shift raw input (converted to active-high)
        sync <= {sync[1:0], btn_active};

        // Step 2: Debounce logic: stable if all 3 bits are the same
        if (sync == 3'b111)
            debounced <= 1;   // button is steadily pressed
        else if (sync == 3'b000)
            debounced <= 0;   // button is steadily released

        // Step 3: One-pulse output: only HIGH for 1 cycle on press
        pulse <= debounced & ~prev;

        // Step 4: Save previous debounced value for edge detection
        prev <= debounced;
    end
endmodule
