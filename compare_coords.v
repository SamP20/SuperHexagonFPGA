// Returns true when two coordinates match
module compare_coords(
	input wire [9:0]x1,
	input wire [9:0]y1,
	input wire [9:0]x2,
	input wire [9:0]y2,
	output wire match
);

assign match = (x1==x2 && y1==y2);

endmodule
