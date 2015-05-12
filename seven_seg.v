// Controls a 7 segment display
module seven_seg(
	input clk,
	input reset,
	input count,
	output reg [6:0]display,
	output reg overflow	
);

reg [3:0]counter;

always @(posedge clk) begin
	if (reset) begin
		counter <= 1'b0;
		overflow <= 1'b0;
	end else begin
		if(count) begin
			if (counter == 4'd9) begin
				counter <= 1'b0;
				overflow <= 1'b1;
			end else begin
				counter <= counter + 1'b1;
				overflow <= 1'b0;
			end
		end else begin
			overflow <= 1'b0;
		end
	end
	
end

always @(*) begin
	case(counter)
		4'd0	:	display = 7'b1000000;
		4'd1	:	display = 7'b1111001;
		4'd2	:	display = 7'b0100100;
		4'd3	:	display = 7'b0110000;
		4'd4	:	display = 7'b0011001;
		4'd5	:	display = 7'b0010010;
		4'd6	:	display = 7'b0000010;
		4'd7	:	display = 7'b1111000;
		4'd8	:	display = 7'b0000000;
		4'd9	:	display = 7'b0010000;
		default	:	display = 7'b0000000;
	endcase 
end

endmodule
