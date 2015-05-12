// Linear feedback shift register to generate pesudo-random numbers
module random_gen(clk, sample, out);

parameter BITS = 64;
input clk;
input sample;
output wire [BITS-1:0]out;

reg [63:0]data;
assign out = data[BITS-1:0];
wire zero = data == 64'b0;

initial begin
	data = 64'd1;
end

always @(posedge clk) begin
	data <= {data[62:0], (data[63]^data[62]^data[60]^data[59]^sample) || zero};
end

endmodule
