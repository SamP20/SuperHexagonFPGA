// Testbench for random_gen.v
module random_gen_tb();
reg clk;
reg sample;
wire [63:0]out;

initial begin
	clk = 0;
	sample = 0;
end

always begin
	#10 clk = ~clk;
end

always begin
	#79 sample = ~sample;
end

random_gen random_gen(clk, sample, out);

endmodule
