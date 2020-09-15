`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   05:42:18 12/04/2018
// Design Name:   displayAndProcess
// Module Name:   /home/ise/M152/lab4/displayTest.v
// Project Name:  lab4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: displayAndProcess
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module displayTest;

	// Inputs
	reg clk;
	reg rightOctaveBtn;
	reg leftOctaveBtn;
	reg [7:0] note;
	reg playBtn;
	reg playFileBtn;
	// Outputs
	wire [7:0] segDisplay;
	wire [3:0] anodeNum;
	wire Speaker;
	wire [2:0] octaveOutput;
	wire currNoteClk;
	wire currFileClk;
	wire fileOutput;
	wire playOutput;
	wire rightOutput;

	// Instantiate the Unit Under Test (UUT)
	displayAndProcess uut (
		.clk(clk), 
		.playBtn(playBtn),
		.rightOctaveBtn(rightOctaveBtn), 
		.leftOctaveBtn(leftOctaveBtn),
		.playFileBtn(playFileBtn),
		.note(note), 
		.segDisplay(segDisplay), 
		.anodeNum(anodeNum),
		.octaveOutput(octaveOutput),
		.currNoteOutput(currNoteClk),
		.currFileOutput(currFileClk),
		.fileOutput(fileOutput),
		.playOutput(playOutput),
		.rightOutput(rightOutput),

		.Speaker(Speaker)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rightOctaveBtn = 0;
		leftOctaveBtn = 0;
		note = 8'b10000000;
		playBtn = 0;
		playFileBtn=0;
		// Wait 100 ns for global reset to finish
		#100;
      rightOctaveBtn=1;
		#40000;
		rightOctaveBtn=0;
		#100;
		playFileBtn = 1;
		#40000;
		playFileBtn = 0;
		
		  
		// Add stimulus here

	end
	always begin
	 #10 clk = ~clk;
	 
	end
	

endmodule

