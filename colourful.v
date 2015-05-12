// Debugging module to choose colours based on x/y coordinate
module colourful(
	input wire clk,
	input wire [9:0]x,
	input wire [9:0]y,
	output reg [3:0]red,
	output reg [3:0]green,
	output reg [3:0]blue
);

always @(posedge clk)
begin
	red <= x[4:1];
	green <= y[4:1];
	blue[1:0] <= x[6:5];
	blue[3:2] <= y[6:5];
end


endmodule
