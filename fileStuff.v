`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:13:03 12/04/2018 
// Design Name: 
// Module Name:    fileStuff 
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
module fileStuff(
		input clk,
		input fileState,
		output fileValid,
		output noteAdjust,
		output [2:0] pfOctaveState
	
    );
reg [31:0] clkCnt = 0;	
/*
localparam noteAO1 = 909090; //001
localparam noteBO1 = 809716; //010
localparam noteCO1 = 763358;  //011
localparam noteDO1 = 680272; //100
localparam noteEO1 = 606060;  //101
localparam noteFO1 = 571428;  //110
localparam noteGO1 = 510204; //111
localparam noteAO2 = 454545; //001
localparam noteBO2 = 404858; //010
localparam noteCO2 = 381679;  //011
localparam noteDO2 = 340136; //100
localparam noteEO2 = 303030;  //101
localparam noteFO2 = 285714;  //110
localparam noteGO2 = 255102; //111
localparam noteAO3 = 227272; //001
localparam noteBO3 = 202429; //010
localparam noteCO3 = 190885;  //011
localparam noteDO3 = 170068; //100
localparam noteEO3 = 151515;  //101
localparam noteFO3 = 142857;  //110
localparam noteGO3 = 127551; //111
*/
localparam noteAO1 = 21; //001
localparam noteBO1 = 20; //010
localparam noteCO1 = 19;  //011
localparam noteDO1 = 18; //100
localparam noteEO1 = 17;  //101
localparam noteFO1 = 16;  //110
localparam noteGO1 = 15; //111
localparam noteAO2 = 14; //001
localparam noteBO2 = 13; //010
localparam noteCO2 = 12;  //011
localparam noteDO2 = 11; //100
localparam noteEO2 = 10;  //101
localparam noteFO2 = 9;  //110
localparam noteGO2 = 8; //111
localparam noteAO3 = 7; //001
localparam noteBO3 = 6; //010
localparam noteCO3 = 5;  //011
localparam noteDO3 = 4; //100
localparam noteEO3 = 3;  //101
localparam noteFO3 = 2;  //110
localparam noteGO3 = 1; //111
reg noteAdjustTemp = 0;
reg [7:0]fd[0:1023];

reg [7:0]fileCurrNote=0;
reg [7:0]fileCurrOctave=0;
reg [7:0]fileCurrTime=0;
reg [132:0] fileTimeBuffer=0;
reg [7:0]fileIndexInput;
reg [7:0]fileIndexToPlay;
reg [1023:0] i;
reg fileDone=1;
reg [2:0]tempOctaveState=3'b001;
   initial // Read the memory contents in the file
           // dual_port_rom_init.txt. 
   begin
      $readmemb("./music.code", fd,0,7);
		$display("%b",fd[0]);
   end
always @(posedge clk) begin
if(fileState) begin
		
		i<=1;
		fileDone<=0;
		
end
		
else if(fileDone==0) begin
// first line represents how long the file 
				$display("%b",i);
				$display("%b",fileTimeBuffer);
				if(fd[i+1]==3'b001) begin
					tempOctaveState=3'b001;
				end
				else if(fd[i+1]==3'b010) begin
					tempOctaveState=3'b010;
				end
				else begin
					tempOctaveState=3'b011;
				end
			 begin//NEED TO CHANGE FILETIMEBUFFER TO REPRESENT SECONDS i think i solved this
					if(fileTimeBuffer==fd[i+2]*100) begin
						fileTimeBuffer<=0;
						if(i+3>=fd[0]) begin
							fileDone<=1;
						end
						else begin
							fileDone<=0;
							i<=i+3;
						end
					end
					else begin
						fileTimeBuffer<= fileTimeBuffer+1;
						fileIndexToPlay<=fileIndexToPlay;
						
					end
					if (fd[i]== 3'b001 ) begin 
						if(fd[i+1]==3'b001) begin
							
							if (clkCnt == noteAO1) begin
									clkCnt <= 32'b0;
									noteAdjustTemp <=~noteAdjustTemp;
							end
							else begin
									clkCnt <= clkCnt + 1;
									noteAdjustTemp <= noteAdjustTemp;
							end 
						end
						else if(fd[i+1]== 3'b010) begin
							if (clkCnt == noteAO2) begin
									clkCnt <= 32'b0;
									noteAdjustTemp <=~noteAdjustTemp;
							end
							else begin
									clkCnt <= clkCnt + 1;
									noteAdjustTemp <= noteAdjustTemp;
							end 
						end
						else begin
							if (clkCnt == noteAO3) begin
									clkCnt <= 32'b0;
									noteAdjustTemp <=~noteAdjustTemp;
							end
							else begin
									clkCnt <= clkCnt + 1;
									noteAdjustTemp <= noteAdjustTemp;
							end 
						end
					end 
					else if (fd[i]== 3'b010 ) begin 
						if(fd[i+1]==3'b001) begin
							if (clkCnt == noteBO1) begin
									clkCnt <= 32'b0;
									noteAdjustTemp <=~noteAdjustTemp;
							end
							else begin
									clkCnt <= clkCnt + 1;
									noteAdjustTemp <= noteAdjustTemp;
							end 
						end
						else if(fd[i+1]== 3'b010) begin
							if (clkCnt == noteBO2) begin
									clkCnt <= 32'b0;
									noteAdjustTemp <=~noteAdjustTemp;
							end
							else begin
									clkCnt <= clkCnt + 1;
									noteAdjustTemp <= noteAdjustTemp;
							end 
						end
						else begin
							if (clkCnt == noteBO3) begin
									clkCnt <= 32'b0;
									noteAdjustTemp <=~noteAdjustTemp;
							end
							else begin
									clkCnt <= clkCnt + 1;
									noteAdjustTemp <= noteAdjustTemp;
							end 
						end
					end 
					else if (fd[i]== 3'b011 ) begin 
						if(fd[i+1]==3'b001) begin
							if (clkCnt == noteCO1) begin
									clkCnt <= 32'b0;
									noteAdjustTemp <=~noteAdjustTemp;
							end
							else begin
									clkCnt <= clkCnt + 1;
									noteAdjustTemp <= noteAdjustTemp;
							end 
						end
						else if(fd[i+1]== 3'b010) begin
							if (clkCnt == noteCO2) begin
									clkCnt <= 32'b0;
									noteAdjustTemp <=~noteAdjustTemp;
							end
							else begin
									clkCnt <= clkCnt + 1;
									noteAdjustTemp <= noteAdjustTemp;
							end 
						end
						else begin
							if (clkCnt == noteCO3) begin
									clkCnt <= 32'b0;
									noteAdjustTemp <=~noteAdjustTemp;
							end
							else begin
									clkCnt <= clkCnt + 1;
									noteAdjustTemp <= noteAdjustTemp;
							end 
						end
					end 
					else if (fd[i]== 3'b100 ) begin 
						if(fd[i+1]==3'b001) begin
							if (clkCnt == noteDO1) begin
									clkCnt <= 32'b0;
									noteAdjustTemp <=~noteAdjustTemp;
							end
							else begin
									clkCnt <= clkCnt + 1;
									noteAdjustTemp <= noteAdjustTemp;
							end 
						end
						else if(fd[i+1]== 3'b010) begin
							if (clkCnt == noteDO2) begin
									clkCnt <= 32'b0;
									noteAdjustTemp <=~noteAdjustTemp;
							end
							else begin
									clkCnt <= clkCnt + 1;
									noteAdjustTemp <= noteAdjustTemp;
							end 
						end
						else begin
							if (clkCnt == noteDO3) begin
									clkCnt <= 32'b0;
									noteAdjustTemp <=~noteAdjustTemp;
							end
							else begin
									clkCnt <= clkCnt + 1;
									noteAdjustTemp <= noteAdjustTemp;
							end 
						end
					end 
					else if (fd[i]) begin 
						if(fd[i+1]==3'b001) begin
							if (clkCnt == noteEO1) begin
									clkCnt <= 32'b0;
									noteAdjustTemp <=~noteAdjustTemp;
							end
							else begin
									clkCnt <= clkCnt + 1;
									noteAdjustTemp <= noteAdjustTemp;
							end 
						end
						else if(fd[i+1]== 3'b010) begin
							if (clkCnt == noteEO2) begin
									clkCnt <= 32'b0;
									noteAdjustTemp <=~noteAdjustTemp;
							end
							else begin
									clkCnt <= clkCnt + 1;
									noteAdjustTemp <= noteAdjustTemp;
							end 
						end
						else begin
							if (clkCnt == noteEO3) begin
									clkCnt <= 32'b0;
									noteAdjustTemp <=~noteAdjustTemp;
							end
							else begin
									clkCnt <= clkCnt + 1;
									noteAdjustTemp <= noteAdjustTemp;
							end 
						end
					end 
					else if (fd[i]== 3'b110 ) begin 
						if(fd[i+1]==3'b001) begin
							if (clkCnt == noteFO1) begin
									clkCnt <= 32'b0;
									noteAdjustTemp <=~noteAdjustTemp;
							end
							else begin
									clkCnt <= clkCnt + 1;
									noteAdjustTemp <= noteAdjustTemp;
							end 
						end
						else if(fd[i+1]== 3'b010) begin
							if (clkCnt == noteFO2) begin
									clkCnt <= 32'b0;
									noteAdjustTemp <=~noteAdjustTemp;
							end
							else begin
									clkCnt <= clkCnt + 1;
									noteAdjustTemp <= noteAdjustTemp;
							end 
						end
						else begin
							if (clkCnt == noteFO3) begin
									clkCnt <= 32'b0;
									noteAdjustTemp <=~noteAdjustTemp;
							end
							else begin
									clkCnt <= clkCnt + 1;
									noteAdjustTemp <= noteAdjustTemp;
							end 
						end
					end 
					else if (fd[i]== 3'b111 ) begin 
						if(fd[i+1]==3'b001) begin
							if (clkCnt == noteGO1) begin
									clkCnt <= 32'b0;
									noteAdjustTemp <=~noteAdjustTemp;
							end
							else begin
									clkCnt <= clkCnt + 1;
									noteAdjustTemp <= noteAdjustTemp;
							end 
						end
						else if(fd[i+1]== 3'b010) begin
							if (clkCnt == noteGO2) begin
									clkCnt <= 32'b0;
									noteAdjustTemp <=~noteAdjustTemp;
							end
							else begin
									clkCnt <= clkCnt + 1;
									noteAdjustTemp <= noteAdjustTemp;
							end 
						end
						else begin
							if (clkCnt == noteGO3) begin
									clkCnt <= 32'b0;
									noteAdjustTemp <=~noteAdjustTemp;
							end
							else begin
									clkCnt <= clkCnt + 1;
									noteAdjustTemp <= noteAdjustTemp;
							end 
						end
					end 
					else begin 
						noteAdjustTemp<=0;
					end 
				end
			
		$display("%b",fd[i]);
		$display("%b",fd[i+1]);
		$display("%b",fd[i+2]);
		
end

		

else begin
	noteAdjustTemp<=0;
end
end
assign fileValid = ~fileDone;
assign noteAdjust = noteAdjustTemp; 
assign pfOctaveState = tempOctaveState;
endmodule
