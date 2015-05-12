// State machine to control game state and player collision
module game(
	input clk,
	input frame_start,
	input frame_end,
	
	input newgame,
	
	input collided_new,
	input collided_old,	
	
	output reg update,
	output reg reset,
	output reg revert_player,
	output reg game_over
);

parameter GAMEOVER = 0;
parameter RESTART = 1;
parameter PLAYING = 2;
parameter NEWCOLLIDE = 3;
parameter OLDCOLLIDE = 4;
parameter BOTHCOLLIDE = 5;


reg [2:0]game_state;

initial begin
	game_state = GAMEOVER;
	game_over <= 1'b1;
end

always @(posedge clk) begin
	case(game_state)
	GAMEOVER: begin
		if(frame_start && newgame) begin
			game_state <= RESTART;
			game_over <= 1'b0;
		end
	end
	RESTART: begin
		if(frame_end) begin
			game_state <= PLAYING;
			reset <= 1'b1;
		end
	end	
	PLAYING: begin
		if(collided_new && collided_old) begin
			game_state <= BOTHCOLLIDE;
		end else if(collided_new) begin
			game_state <= NEWCOLLIDE;
		end else if(collided_old) begin
			game_state <= OLDCOLLIDE;
		end else if(frame_start) begin
			update <= 1'b1;
		end else begin
			reset <= 1'b0;
			revert_player <= 1'b0;
			update <= 1'b0;
		end
	end
	NEWCOLLIDE: begin
		if(collided_old) begin
			game_state <= BOTHCOLLIDE;
		end else if(frame_end) begin
			game_state <= PLAYING;
			revert_player <= 1'b1;
		end
	end
	OLDCOLLIDE: begin
		if(collided_new) begin
			game_state <= BOTHCOLLIDE;			
		end else if(frame_end) begin
			game_state <= PLAYING;			
		end
	end
	BOTHCOLLIDE: begin
		if(frame_end) begin
			game_state <= GAMEOVER;
			game_over <= 1'b1;
		end
	end
	endcase
end


endmodule
