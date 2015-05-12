// Provides colour information based on walls, player and colour scheme
module drawing(
	input clk,
	input alternate,
	input change_colours,
	input reset,
	input [2:0]quadrant,
	input draw_walls,
	input draw_island,
	input draw_player,
	input [63:0]rand,
	output reg [3:0]red,
	output reg [3:0]green,
	output reg [3:0]blue
);

reg colour_flipped;

reg [11:0]colour_schemes[0:15];
reg [1:0]scheme;

always @(posedge clk) begin
	if(alternate) begin
		colour_flipped <= !colour_flipped;
	end
end

always @(posedge clk) begin
	if(change_colours) begin
		scheme <= rand[18:17];
	end
end

always @(posedge clk) begin
	if(draw_player) begin
		red <= colour_schemes[{scheme,2'd3}][3:0];
		green <= colour_schemes[{scheme,2'd3}][7:4];
		blue <= colour_schemes[{scheme,2'd3}][11:8];
	end else if(draw_island) begin
		red <= colour_schemes[{scheme,2'd1}][3:0];
		green <= colour_schemes[{scheme,2'd1}][7:4];
		blue <= colour_schemes[{scheme,2'd1}][11:8];
	end else if(draw_walls) begin
		red <= colour_schemes[{scheme,2'd2}][3:0];
		green <= colour_schemes[{scheme,2'd2}][7:4];
		blue <= colour_schemes[{scheme,2'd2}][11:8];
	end else begin
		if(quadrant[0] ^ colour_flipped) begin
			red <= colour_schemes[{scheme,2'd0}][3:0];
			green <= colour_schemes[{scheme,2'd0}][7:4];
			blue <= colour_schemes[{scheme,2'd0}][11:8];
		end else begin
			red <= colour_schemes[{scheme,2'd1}][3:0];
			green <= colour_schemes[{scheme,2'd1}][7:4];
			blue <= colour_schemes[{scheme,2'd1}][11:8];
		end
	end
end

initial begin
	colour_schemes[0] = 12'h311;
	colour_schemes[1] = 12'h000;
	colour_schemes[2] = 12'hF11;
	colour_schemes[3] = 12'hEEE;
	
	colour_schemes[4] = 12'h131;
	colour_schemes[5] = 12'h000;
	colour_schemes[6] = 12'h1F1;
	colour_schemes[7] = 12'hEEE;
	
	colour_schemes[8]  = 12'h113;
	colour_schemes[9]  = 12'h000;
	colour_schemes[10] = 12'h11F;
	colour_schemes[11] = 12'hEEE;
	
	colour_schemes[12] = 12'h313;
	colour_schemes[13] = 12'h000;
	colour_schemes[14] = 12'hF1F;
	colour_schemes[15] = 12'hEEE;
	
end

endmodule
