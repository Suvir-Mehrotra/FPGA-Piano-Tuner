`timescale 1ns / 1ps
module segmentDisplay(input wire [2:0] digit, input [2:0] altDigit, input fileValid, input clk, output wire [7:0] displaySeg);

reg[7:0] sevenSegs;

always @(posedge clk) begin
if(fileValid) begin
	case(altDigit)
		4'h0: sevenSegs = 8'b11000000;
		 4'h1: sevenSegs = 8'b11111001;
		 4'h2: sevenSegs = 8'b10100100;
		 4'h3: sevenSegs = 8'b10110000;
		 4'h4: sevenSegs = 8'b10011001;
		 4'h5: sevenSegs = 8'b10010010;
		 4'h6: sevenSegs = 8'b10000010;
		 4'h7: sevenSegs = 8'b11111000;
		 default: begin
			$display("%b",altDigit);
			sevenSegs = 8'b11111111;
		 end
	endcase

end
else begin
	case(digit)
		4'h0: sevenSegs = 8'b11000000;
		 4'h1: sevenSegs = 8'b11111001;
		 4'h2: sevenSegs = 8'b10100100;
		 4'h3: sevenSegs = 8'b10110000;
		 4'h4: sevenSegs = 8'b10011001;
		 4'h5: sevenSegs = 8'b10010010;
		 4'h6: sevenSegs = 8'b10000010;
		 4'h7: sevenSegs = 8'b11111000;
		 default: sevenSegs = 8'b11111111;
	endcase
end
end
assign displaySeg = sevenSegs;
endmodule