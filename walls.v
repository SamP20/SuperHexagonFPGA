// Used for drawing, moving and updating of walls
module walls(
	input clk,
	input update,

	input [5:0]data,
	output wire hold,
	output wire [5:0]data_addr,
	
	input [2:0]quadrant_collision,
	input [9:0]radius_collision,
	input [2:0]quadrant,
	input [9:0]radius,
	input reset,
	input [1:0]difficulty,
	output reg [2:0]quadrant_out,
	output reg visible,
	output reg island,
	output reg visible_collision
);

reg [5:0]walls[0:127];
reg [11:-2]center;
reg [6:0]write_ptr;

wire [11:0]offset = center[11:0] + radius;
wire [11:0]offset_collision = center[11:0] + radius_collision;

integer i;

always @(posedge clk) begin
	if(reset) begin
		center <= 14'd6144;
	end else if(update) begin
		case(difficulty)
		2'd0: center <= center + 14'd6;
		2'd1: center <= center + 14'd9;
		2'd2: center <= center + 14'd12;
		2'd3:	center <= center + 14'd15;
		endcase		
	end
end

always @(posedge clk) begin
	quadrant_out <= quadrant;
	if(radius < 10'd28) begin
		visible <= 1'b0;
		visible_collision <= 1'b0;
		island <= 1'b1;
	end else if(radius < 10'd32) begin
		visible <= 1'b1;
		visible_collision <= 1'b0;
		island <= 1'b0;
	end else begin
		visible <= walls[offset[11:5]][quadrant+:1];
		visible_collision <= walls[offset_collision[11:5]][quadrant_collision+:1];
		island <= 1'b0;
	end
end

assign data_addr = write_ptr[5:0];

assign hold = write_ptr[5:0]!=6'd0 || (write_ptr==7'b0000000 && center[11]) || (write_ptr==7'b1000000 && !center[11]);

always @(posedge clk) begin
	if(reset) begin
		write_ptr <= 7'b1000000;
		for (i=0; i<128; i=i+1) walls[i] <= 6'b000000;
	end else if(hold) begin
		walls[write_ptr] <= data;
		write_ptr <= write_ptr + 7'd1;
	end
	
end



endmodule
