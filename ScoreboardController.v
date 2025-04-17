// ScoreboardController.v
// Top-level module that handles pushbuttons, score counting, and 7-segment display

module ScoreboardController (
    input clk,
    input rst_n,            // global async reset
    input inc1_btn_n,       // active-low INC1 button
    input inc10_btn_n,      // active-low INC10 button
    input reset_btn_n,      // active-low RESET button
    output [6:0] hex0,      // right digit
    output [6:0] hex1       // left digit
);
    // Internal wires
    wire inc1_pulse, inc10_pulse;
    wire reset_debounced, reset_ready;
    wire [3:0] ones, tens;

    // Debounce and one-pulse generators (all inputs are active-low)
    DebounceOnePulse inc1_debouncer (
        .clk(clk),
        .btn_in(inc1_btn_n),
        .pulse(inc1_pulse)
    );

    DebounceOnePulse inc10_debouncer (
        .clk(clk),
        .btn_in(inc10_btn_n),
        .pulse(inc10_pulse)
    );

    ResetHold holdlogic (
        .clk(clk),
        .rst_button(reset_btn_n),
        .reset_ready(reset_ready)
    );

    // Score counting logic
    ScoreCounter counter (
        .clk(clk),
        .rst_n(rst_n),
        .inc1_pulse(inc1_pulse),
        .inc10_pulse(inc10_pulse),
        .reset_ready(reset_ready),
        .tens(tens),
        .ones(ones)
    );

    // Seven-segment display converters
    SevenSegmentDecoder ones_disp (
        .value(ones),
        .seg(hex0)
    );

    SevenSegmentDecoder tens_disp (
        .value(tens),
        .seg(hex1)
    );
endmodule
