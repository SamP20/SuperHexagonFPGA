// Provides output to drive a VGA display
// For best results set screen resolution to 640x480
module vga_driver(
	input wire dclk,
	input wire clr,
	output wire hsync,
	output wire vsync,
	output reg [3:0]red_o,
	output reg [3:0]green_o,
	output reg [3:0]blue_o,
	
	output wire clk,
	output reg [9:0]x,
	output reg [9:0]y,
	input wire [3:0]red,
	input wire [3:0]green,
	input wire [3:0]blue,
	
	output wire pre_frame,
	output wire post_frame
);

parameter pix_dly = 2;
parameter hpixels = 800;// horizontal pixels per line
parameter vlines = 521; // vertical lines per frame
parameter hpulse = 96; 	// hsync pulse length
parameter vpulse = 2; 	// vsync pulse length
parameter hbp = 144; 	// end of horizontal back porch
parameter hfp = 784; 	// beginning of horizontal front porch
parameter vbp = 31; 		// end of vertical back porch
parameter vfp = 511; 	// beginning of vertical front porch
// active horizontal video is therefore: 784 - 144 = 640
// active vertical video is therefore: 511 - 31 = 480

// registers for storing the horizontal & vertical counters
reg [9:0] hc;
reg [9:0] vc;
wire in_frame;

assign clk = dclk;

always @(posedge dclk or posedge clr)
begin
	if(clr == 1)
	begin
		hc <= 0;
		vc <= 0;
	end
	else
	begin
		if(hc < hpixels -1)
			hc <= hc + 1;
		else
		begin
			hc <= 0;
			if(vc < vlines - 1)
				vc <= vc + 1;
			else
				vc <= 0;
		end
	end
end

assign hsync = (hc < hpulse) ? 0:1;
assign vsync = (vc < vpulse) ? 0:1;

assign pre_frame = (hc==10'd0 && vc==10'd0);
assign post_frame = (hc==10'd0 && vc==10'd515);

assign in_frame = (vc >= vbp && vc < vfp) && (hc >= hbp && hc < (hbp+640));

always @(posedge dclk)
begin
	if(vc >= vbp && vc < vfp)
		y <= vc - vbp;
	else
		y <= 0;
	if(hc >= hbp - pix_dly && hc < (hbp+640-pix_dly))
		x <= hc+pix_dly-hbp;
	else
		x <= 0;
end

always @(posedge dclk)
begin
	if(in_frame) begin
	red_o <= red;
	green_o <= green;
	blue_o <= blue;
	end
	else
	begin
		red_o <= 4'b0;
		green_o <= 4'b0;
		blue_o <= 4'b0;
	end
end

endmodule
