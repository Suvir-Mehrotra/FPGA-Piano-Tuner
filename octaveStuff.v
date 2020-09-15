`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:38:21 12/03/2018 
// Design Name: 
// Module Name:    octaveStuff 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module octaveStuff(
	input leftBtn,
	input rightBtn,
	input clk,
	output [2:0] octaveState
    );
reg[2:0] temp=3'b001;
always @(posedge clk) begin
	if(rightBtn) begin
		
		if(temp+1<3'b001||temp+1>3'b010) begin
			temp<=3'b011;

		end
		else begin
			temp<=temp+1;

		end
	end

	else if(leftBtn) begin
		
		if(temp-1<3'b001||temp-1>3'b010) begin
			temp<=3'b001;
		end
			
		else begin
			temp<=temp-1;
		end
	end
	else begin
			temp<= temp;
	end
end
assign  octaveState = temp;
endmodule
