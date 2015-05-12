// Used for drawing a circle
module circle(
	input wire clk,
	input wire signed [9:0]x1,
	input wire signed [9:0]y1,
	input wire signed [9:0]x2,
	input wire signed [9:0]y2,
	output reg match
);
parameter radius = 4;

reg [9:0]dx;
reg [9:0]dy;

always @(posedge clk) begin
	dx <= x1-x2;
	dy <= y1-y2;
end

always @(posedge clk) begin
	match <= (dx*dx+dy*dy < radius*radius);
end


endmodule