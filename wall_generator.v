// Source of information for walls
module wall_generator(
	input clk,
	input [63:0]rand,
	input hold,
	input [5:0]address,
	output reg [5:0]data
);

reg [63:0]randh;

reg [5:0]walls_rand[0:63];
reg [5:0]walls_alt[0:63];
reg [5:0]walls_maze[0:127];

always @(posedge clk) begin
	if(!hold) begin
		randh <= rand;
	end
end

always @* begin
	case(address[5:4])
	2'd0: begin
		data <= walls_rand[{randh[1:0],address[3:0]}];
	end
	2'd1: begin
		data <= walls_alt[{randh[3:2],address[3:0]}];
	end
	2'd2: begin
		data <= walls_rand[{randh[5:4],address[3:0]}];
	end
	2'd3: begin
		data <= walls_maze[{randh[8:6],address[3:0]}];
	end
	endcase
end

initial begin
	walls_rand[0] = 6'b101010;
	walls_rand[1] = 6'b000000;
	walls_rand[2] = 6'b010101;
	walls_rand[3] = 6'b000000;
	walls_rand[4] = 6'b101010;
	walls_rand[5] = 6'b000000;
	walls_rand[6] = 6'b010101;
	walls_rand[7] = 6'b000000;
	walls_rand[8] = 6'b101010;
	walls_rand[9] = 6'b000000;
	walls_rand[10] = 6'b010101;
	walls_rand[11] = 6'b000000;
	walls_rand[12] = 6'b101010;
	walls_rand[13] = 6'b000000;
	walls_rand[14] = 6'b000000;
	walls_rand[15] = 6'b000000;
	
	walls_rand[16] = 6'b010101;
	walls_rand[17] = 6'b000000;
	walls_rand[18] = 6'b101010;
	walls_rand[19] = 6'b000000;
	walls_rand[20] = 6'b010101;
	walls_rand[21] = 6'b000000;
	walls_rand[22] = 6'b101010;
	walls_rand[23] = 6'b000000;
	walls_rand[24] = 6'b010101;
	walls_rand[25] = 6'b000000;
	walls_rand[26] = 6'b101010;
	walls_rand[27] = 6'b000000;
	walls_rand[28] = 6'b010101;
	walls_rand[29] = 6'b000000;
	walls_rand[30] = 6'b000000;
	walls_rand[31] = 6'b000000;
	
	walls_rand[32] = 6'b101010;
	walls_rand[33] = 6'b000000;
	walls_rand[34] = 6'b000000;
	walls_rand[35] = 6'b010101;
	walls_rand[36] = 6'b000000;
	walls_rand[37] = 6'b000000;
	walls_rand[38] = 6'b101110;
	walls_rand[39] = 6'b000000;
	walls_rand[40] = 6'b000000;
	walls_rand[41] = 6'b011011;
	walls_rand[42] = 6'b000000;
	walls_rand[43] = 6'b000000;
	walls_rand[44] = 6'b010101;
	walls_rand[45] = 6'b000000;
	walls_rand[46] = 6'b000000;
	walls_rand[47] = 6'b000000;
	
	walls_rand[48] = 6'b010101;
	walls_rand[49] = 6'b000000;
	walls_rand[50] = 6'b000000;
	walls_rand[51] = 6'b101010;
	walls_rand[52] = 6'b000000;
	walls_rand[53] = 6'b000000;
	walls_rand[54] = 6'b111010;
	walls_rand[55] = 6'b000000;
	walls_rand[56] = 6'b000000;
	walls_rand[57] = 6'b101101;
	walls_rand[58] = 6'b000000;
	walls_rand[59] = 6'b000000;
	walls_rand[60] = 6'b101010;
	walls_rand[61] = 6'b000000;
	walls_rand[62] = 6'b000000;
	walls_rand[63] = 6'b000000;
	
	walls_alt[0] = 6'b011111;
	walls_alt[1] = 6'b000000;
	walls_alt[2] = 6'b000000;
	walls_alt[3] = 6'b000000;
	walls_alt[4] = 6'b111011;
	walls_alt[5] = 6'b000000;
	walls_alt[6] = 6'b000000;
	walls_alt[7] = 6'b000000;
	walls_alt[8] = 6'b011111;
	walls_alt[9] = 6'b000000;
	walls_alt[10] = 6'b000000;
	walls_alt[11] = 6'b000000;
	walls_alt[12] = 6'b111011;
	walls_alt[13] = 6'b000000;
	walls_alt[14] = 6'b000000;
	walls_alt[15] = 6'b000000;
	
	walls_alt[16] = 6'b110111;
	walls_alt[17] = 6'b000000;
	walls_alt[18] = 6'b000000;
	walls_alt[19] = 6'b000000;
	walls_alt[20] = 6'b111110;
	walls_alt[21] = 6'b000000;
	walls_alt[22] = 6'b000000;
	walls_alt[23] = 6'b000000;
	walls_alt[24] = 6'b110111;
	walls_alt[25] = 6'b000000;
	walls_alt[26] = 6'b000000;
	walls_alt[27] = 6'b000000;
	walls_alt[28] = 6'b111110;
	walls_alt[29] = 6'b000000;
	walls_alt[30] = 6'b000000;
	walls_alt[31] = 6'b000000;

	walls_alt[32] = 6'b111101;
	walls_alt[33] = 6'b000000;
	walls_alt[34] = 6'b000000;
	walls_alt[35] = 6'b000000;
	walls_alt[36] = 6'b101111;
	walls_alt[37] = 6'b000000;
	walls_alt[38] = 6'b000000;
	walls_alt[39] = 6'b000000;
	walls_alt[40] = 6'b111101;
	walls_alt[41] = 6'b000000;
	walls_alt[42] = 6'b000000;
	walls_alt[43] = 6'b000000;
	walls_alt[44] = 6'b101111;
	walls_alt[45] = 6'b000000;
	walls_alt[46] = 6'b000000;
	walls_alt[47] = 6'b000000;

	walls_alt[48] = 6'b111011;
	walls_alt[49] = 6'b000000;
	walls_alt[50] = 6'b000000;
	walls_alt[51] = 6'b000000;
	walls_alt[52] = 6'b101111;
	walls_alt[53] = 6'b000000;
	walls_alt[54] = 6'b000000;
	walls_alt[55] = 6'b000000;
	walls_alt[56] = 6'b111110;
	walls_alt[57] = 6'b000000;
	walls_alt[58] = 6'b000000;
	walls_alt[59] = 6'b000000;
	walls_alt[60] = 6'b111011;
	walls_alt[61] = 6'b000000;
	walls_alt[62] = 6'b000000;
	walls_alt[63] = 6'b000000;

	walls_maze[0] = 6'b011111;
	walls_maze[1] = 6'b000000;
	walls_maze[2] = 6'b101111;
	walls_maze[3] = 6'b000000;
	walls_maze[4] = 6'b110111;
	walls_maze[5] = 6'b000000;
	walls_maze[6] = 6'b111011;
	walls_maze[7] = 6'b000000;
	walls_maze[8] = 6'b111101;
	walls_maze[9] = 6'b000000;
	walls_maze[10] = 6'b111110;
	walls_maze[11] = 6'b000000;
	walls_maze[12] = 6'b011111;
	walls_maze[13] = 6'b000000;
	walls_maze[14] = 6'b101111;
	walls_maze[15] = 6'b000000;
	
	walls_maze[16] = 6'b111011;
	walls_maze[17] = 6'b000000;
	walls_maze[18] = 6'b110111;
	walls_maze[19] = 6'b000000;
	walls_maze[20] = 6'b101111;
	walls_maze[21] = 6'b000000;
	walls_maze[22] = 6'b011111;
	walls_maze[23] = 6'b000000;
	walls_maze[24] = 6'b111110;
	walls_maze[25] = 6'b000000;
	walls_maze[26] = 6'b111101;
	walls_maze[27] = 6'b000000;
	walls_maze[28] = 6'b111011;
	walls_maze[29] = 6'b000000;
	walls_maze[30] = 6'b110111;
	walls_maze[31] = 6'b000000;
	
	walls_maze[32] = 6'b110110;
	walls_maze[33] = 6'b100100;
	walls_maze[34] = 6'b101101;
	walls_maze[35] = 6'b100100;
	walls_maze[36] = 6'b110110;
	walls_maze[37] = 6'b100100;
	walls_maze[38] = 6'b101101;
	walls_maze[39] = 6'b100100;
	walls_maze[40] = 6'b110110;
	walls_maze[41] = 6'b100100;
	walls_maze[42] = 6'b101101;
	walls_maze[43] = 6'b100100;
	walls_maze[44] = 6'b110110;
	walls_maze[45] = 6'b100100;
	walls_maze[46] = 6'b101101;
	walls_maze[47] = 6'b000000;

	walls_maze[48] = 6'b101101;
	walls_maze[49] = 6'b100100;
	walls_maze[50] = 6'b110110;
	walls_maze[51] = 6'b100100;
	walls_maze[52] = 6'b101101;
	walls_maze[53] = 6'b100100;
	walls_maze[54] = 6'b110110;
	walls_maze[55] = 6'b100100;
	walls_maze[56] = 6'b101101;
	walls_maze[57] = 6'b100100;
	walls_maze[58] = 6'b110110;
	walls_maze[59] = 6'b100100;
	walls_maze[60] = 6'b101101;
	walls_maze[61] = 6'b100100;
	walls_maze[62] = 6'b110110;
	walls_maze[63] = 6'b000000;
	
	walls_maze[64] = 6'b110110;
	walls_maze[65] = 6'b010010;
	walls_maze[66] = 6'b001001;
	walls_maze[67] = 6'b100100;
	walls_maze[68] = 6'b010010;
	walls_maze[69] = 6'b001001;
	walls_maze[70] = 6'b100100;
	walls_maze[71] = 6'b010010;
	walls_maze[72] = 6'b001001;
	walls_maze[73] = 6'b100100;
	walls_maze[74] = 6'b010010;
	walls_maze[75] = 6'b001001;
	walls_maze[76] = 6'b100100;
	walls_maze[77] = 6'b010010;
	walls_maze[78] = 6'b001001;
	walls_maze[79] = 6'b000000;


	walls_maze[80] = 6'b011011;
	walls_maze[81] = 6'b010010;
	walls_maze[82] = 6'b100100;
	walls_maze[83] = 6'b001001;
	walls_maze[84] = 6'b010010;
	walls_maze[85] = 6'b100100;
	walls_maze[86] = 6'b001001;
	walls_maze[87] = 6'b010010;
	walls_maze[88] = 6'b100100;
	walls_maze[89] = 6'b001001;
	walls_maze[90] = 6'b010010;
	walls_maze[91] = 6'b100100;
	walls_maze[92] = 6'b001001;
	walls_maze[93] = 6'b010010;
	walls_maze[94] = 6'b100100;
	walls_maze[95] = 6'b000000;


	walls_maze[96]  = 6'b101111;
	walls_maze[97]  = 6'b100000;
	walls_maze[98]  = 6'b100000;
	walls_maze[99]  = 6'b100000;
	walls_maze[100] = 6'b100000;
	walls_maze[101] = 6'b111110;
	walls_maze[102] = 6'b100000;
	walls_maze[103] = 6'b100000;
	walls_maze[104] = 6'b100000;
	walls_maze[105] = 6'b100000;
	walls_maze[106] = 6'b101111;
	walls_maze[107] = 6'b100000;
	walls_maze[108] = 6'b100000;
	walls_maze[109] = 6'b100000;
	walls_maze[110] = 6'b111011;
	walls_maze[111] = 6'b000000;
	
	walls_maze[112] = 6'b100011;
	walls_maze[113] = 6'b110111;
	walls_maze[114] = 6'b000001;
	walls_maze[115] = 6'b001001;
	walls_maze[116] = 6'b011101;
	walls_maze[117] = 6'b001001;
	walls_maze[118] = 6'b000001;
	walls_maze[119] = 6'b110111;
	walls_maze[120] = 6'b000001;
	walls_maze[121] = 6'b001001;
	walls_maze[122] = 6'b011101;
	walls_maze[123] = 6'b001001;
	walls_maze[124] = 6'b000001;
	walls_maze[125] = 6'b110111;
	walls_maze[126] = 6'b000000;
	walls_maze[127] = 6'b000000;

end

endmodule
