// Controls player positioning/movement
module player(
	input clk,
	input update,
	input revert,
	input [1:0]difficulty,
	input cw_btn,
	input ccw_btn,
	output reg signed [9:0]x,
	output reg signed [9:0]y,
	output reg signed [9:0]x_old,
	output reg signed [9:0]y_old
);

reg [9:0]speed;
reg [9:0]angle;
reg [9:0]old_angle;
wire signed [11:0]sin;
wire signed [11:0]cos;
sincos sincos(.clk(clk), .angle(angle), .sin(sin), .cos(cos));

always @(posedge clk) begin
	case(difficulty)
	2'd0: speed <= 9'd8;
	2'd1: speed <= 9'd12;
	2'd2: speed <= 9'd16;
	2'd3:	speed <= 9'd20;
	endcase
end

always @(posedge clk) begin
	if(update) begin
		x_old <= x;
		y_old <= y;
		old_angle <= angle;
		if(cw_btn) begin
			angle <= angle + speed;
		end else if(ccw_btn) begin
			angle <= angle - speed;
		end
	end else if(revert) begin
		angle <= old_angle;
	end
end

always @(posedge clk) begin
	x <= {{4{cos[11]}}, cos[11:6]} + {{5{cos[11]}}, cos[11:7]};
	y <= {{4{sin[11]}}, sin[11:6]} + {{5{sin[11]}}, sin[11:7]};
end

endmodule
