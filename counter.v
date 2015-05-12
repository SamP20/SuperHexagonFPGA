// Customisable counter using parameters
module counter(
	input clk,
	input reset,
	input increment,	
	output reg overflow
);

parameter BITS = 3;
parameter LIMIT = 6;

reg [BITS-1:0]count;

always @(posedge clk) begin
	if(reset) begin
		count <= 1'b0;
		overflow <= 1'b0;
	end else if(increment) begin
		if(count==(LIMIT-1)) begin
			count <= 1'b0;
			overflow <= 1'b1;
		end else begin
			count <= count + 1'b1;
			overflow <= 1'b0;
		end
	end else begin
		overflow <= 1'b0;
	end
end

endmodule
