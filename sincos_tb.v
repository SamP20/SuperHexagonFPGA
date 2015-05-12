// Testbench for sincos.v
module sincos_tb();
reg clk;
reg [9:0]angle;
wire signed [11:0]sin;
wire signed [11:0]cos;

initial begin
	clk = 0;
	angle = 10'd0;
end

always begin
	#2 clk = 1;
	#2 clk = 0;
	angle = angle + 10'd1;
end

sincos sincos(.clk(clk), .angle(angle), .sin(sin), .cos(cos));

endmodule
