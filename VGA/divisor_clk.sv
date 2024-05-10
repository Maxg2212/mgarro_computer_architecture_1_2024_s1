module divisor_clk ( input clk, output reg clk_out);

    reg [31:0] counter;
    always @(posedge clk) begin
        if (counter == 0) begin
            counter <= 12500000;
            clk_out <= ~clk_out;
        end else begin
            counter <= counter - 1;
        end
    end

endmodule