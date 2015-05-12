// Converts rectangular (cartesian) coordinates into hexagonal coordinates
module rect_to_hex(
	input clk,
	input signed [9:0]x,
	input signed [9:0]y,
	output reg [2:0]quadrant,
	output reg [9:0]radius
);

parameter root3 = 11'b11011101101;

wire signed [10:0]root3x;
wire signed [10:-11]root3x_full;
assign root3x_full = $signed({{1{x[9]}},x}) * $signed({1'b0,root3});
assign root3x = root3x_full[10:0];

wire signed [10:0]neg_root3x;
assign neg_root3x = -root3x;

wire signed [10:0]y_extended;
assign y_extended = {{1{y[9]}}, y};

wire signed [10:0]neg_y;
assign neg_y = -y_extended;

reg [11:0]radius_frac;

always @(posedge clk) begin
	if(y_extended > 11'sd0) begin
		if(y_extended < root3x) begin
			quadrant <= 3'd0;
			radius_frac = y_extended + root3x;
			radius <= radius_frac[11:1];
		end else if(y_extended < neg_root3x) begin
			quadrant <= 3'd2;
			radius_frac = y_extended + neg_root3x;
			radius <= radius_frac[11:1];
		end else begin
			quadrant <= 3'd1;
			radius <= y;
		end
	end else begin
		if(y_extended > root3x) begin
			quadrant <= 3'd3;
			radius_frac = neg_y + neg_root3x;
			radius <= radius_frac[11:1];
		end else if(y_extended > neg_root3x) begin
			quadrant <= 3'd5;
			radius_frac = neg_y + root3x;
			radius <= radius_frac[11:1];
		end else begin
			quadrant <= 3'd4;
			radius <= -y;
		end
	end
end

endmodule
