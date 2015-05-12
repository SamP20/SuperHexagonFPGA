// Controls speed and direction of spin of playfield
module spin_controller(
	input clk,
	input reset,
	input [63:0]rand,
	input update,
	input speedup,
	output reg [9:0]angle
);

reg [9:0]speed;
reg [8:0]alternate_timer;
reg direction;

always @(posedge clk) begin
	if(reset) begin
		speed <= 10'd1;
	end else if(speedup) begin
		speed <= speed + 10'd1;
	end
end

always @(posedge clk) begin
	if(reset) begin
		alternate_timer <= 9'd0;
	end else if(update) begin
		if(alternate_timer==9'd0) begin
			alternate_timer <= rand[16:9] + 9'd60;
			direction = !direction;
		end else begin
			alternate_timer <= alternate_timer - 9'd1;
		end
	end
end

always @(posedge clk) begin
	if(update) begin
		if(direction) begin
			angle <= angle + speed;
		end else begin
			angle <= angle - speed;
		end
	end
end

endmodule
