// Debugging module to convert a hexagonal coordinate into a colour
module hex_to_colour(
	input clk,
	input [2:0]quadrant,
	input [9:0]radius,
	output reg [3:0]red,
	output reg [3:0]green,
	output reg [3:0]blue
);


always @(posedge clk) begin
	case(quadrant)
	3'd0: begin
		red <= radius[7:4];
		green <= 4'd0;
		blue <= 4'd0;
	end
	3'd1: begin
		red <= radius[6:3];
		green <= radius[6:3];
		blue <= 4'd0;
	end
	3'd2: begin
		red <= 4'd0;
		green <= radius[5:2];
		blue <= 4'd0;
	end
	3'd3: begin
		red <= 4'd0;
		green <= radius[4:1];
		blue <= radius[4:1];
	end
	3'd4: begin
		red <= 4'd0;
		green <= 4'd0;
		blue <= radius[3:0];
	end
	3'd5: begin
		red <= radius[8:5];
		green <= 4'd0;
		blue <= radius[8:5];
	end
	default: begin
		red <= 4'd0;
		green <= 4'd0;
		blue <= 4'd0;
	end	
	endcase
end

endmodule
