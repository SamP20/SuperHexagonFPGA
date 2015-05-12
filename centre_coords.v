// Translates coordinates so screen centre is (0,0)
module centre_coords(
	input wire clk,
	input wire [9:0]x_i,
	input wire [9:0]y_i,
	output reg signed [9:0]x_o,
	output reg signed [9:0]y_o
);

always @(posedge clk)
begin
	x_o <= x_i - 10'd320;
	y_o <= y_i - 10'd240;
end

endmodule
