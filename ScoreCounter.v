// ScoreCounter.v
// Internal logic for score counting, used by the top-level ScoreboardController

module ScoreCounter (
    input clk,
    input rst_n,
    input inc1_pulse,
    input inc10_pulse,
    input reset_ready,
    output reg [3:0] tens,
    output reg [3:0] ones
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            tens <= 0;
            ones <= 0;
        end else if (reset_ready) begin
            tens <= 0;
            ones <= 0;
        end else if (inc10_pulse) begin
            if (tens < 9)
                tens <= tens + 1;
        end else if (inc1_pulse) begin
            if (tens * 10 + ones < 99) begin
                if (ones < 9)
                    ones <= ones + 1;
                else begin
                    ones <= 0;
                    if (tens < 9)
                        tens <= tens + 1;
                end
            end
        end
    end
endmodule
