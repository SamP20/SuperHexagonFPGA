// Spins the playfield
module rotate(
	input clk,
	input update,
	input signed [9:0]x_i,
	input signed [9:0]y_i,
	input [9:0]angle,
	output reg signed [9:0]x_o,
	output reg signed [9:0]y_o
);


wire signed [11:0]sin;
wire signed [11:0]cos;
sincos sincos(.clk(clk), .angle(angle), .sin(sin), .cos(cos));

wire signed [9:-11]x_temp = (x_i*cos) - (y_i*sin);
wire signed [9:-11]y_temp = (x_i*sin) + (y_i*cos);

always @(posedge clk) begin
	x_o <= x_temp[9:0];
	y_o <= y_temp[9:0];
end

endmodule
