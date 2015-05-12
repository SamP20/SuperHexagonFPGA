// Provides user interface for selecting difficulty
module difficulty(
	input clk,
	input gameover,
	input [1:0]select,
	output reg [1:0]difficulty,
	output reg [7:0]red_leds,
	output reg [7:0]green_leds
);

always @(posedge clk) begin
	case(difficulty)
	2'd0: begin
		if(gameover) begin
			red_leds   <= 8'b00000011;
			green_leds <= 8'b00000000;
		end else begin
			red_leds   <= 8'b00000000;
			green_leds <= 8'b00000011;
		end
	end
	2'd1: begin
		if(gameover) begin
			red_leds   <= 8'b00001111;
			green_leds <= 8'b00000000;
		end else begin
			red_leds   <= 8'b00000000;
			green_leds <= 8'b00001111;
		end
	end
	2'd2: begin
		if(gameover) begin
			red_leds   <= 8'b00111111;
			green_leds <= 8'b00000000;
		end else begin
			red_leds   <= 8'b00000000;
			green_leds <= 8'b00111111;
		end
	end
	2'd3: begin
		if(gameover) begin
			red_leds   <= 8'b11111111;
			green_leds <= 8'b00000000;
		end else begin
			red_leds   <= 8'b00000000;
			green_leds <= 8'b11111111;
		end
	end
	endcase
end

always @(posedge clk) begin
	if(gameover) begin
		difficulty <= select;
	end
end

endmodule
