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

module displayTestDan;

	// Inputs
	reg clk;
	reg rightOctaveBtn;
	reg leftOctaveBtn;
	reg [7:0] note;
	reg playBtn;
	reg playFileBtn;
	// Outputs
	wire [7:0] segDisplay;
	wire [2:0] anodeNum;
	wire Speaker;
	wire [2:0] octaveOutput;
	wire currNoteClk;
	wire currFileClk;
	wire fileOutput;
	wire playOutput;
	wire rightOutput;

	// Instantiate the Unit Under Test (UUT)
	displayAndProcess uut (
		.clock(clk), 
		.playBtn(playBtn),
		.rightOctaveBtn(rightOctaveBtn), 
		.leftOctaveBtn(leftOctaveBtn),
		.playFileBtn(playFileBtn),
		.note(note), 
		.segDisplay(segDisplay), 
		.currNum(anodeNum),
		.octaveOutput(octaveOutput),
		.currNoteOutput(currNoteClk),
		.currFileOutput(currFileClk),
		.fileOutput(fileOutput),
		.playOutput(playOutput),
		.rightOutput(rightOutput),

		.Speaker(Speaker)
	);
	
	always begin
	 #5 clk = ~clk;
	 
	end
	

	initial begin
		// Initialize Inputs
		clk = 0;
		rightOctaveBtn = 0;
		leftOctaveBtn = 0;
		note = 8'b01000000;
		playBtn = 1;
		playFileBtn=0;
		// Wait 100 ns for global reset to finish
		#100;
		#1000;
        rightOctaveBtn=1;
		#1000;
		rightOctaveBtn=0;
		leftOctaveBtn = 1;
		#10;
		leftOctaveBtn = 0;
		#1000;
		leftOctaveBtn = 1;
		#1100;
		note = 8'b00000100;
		#1000;
		playBtn=0;
		#1000;
		playBtn=1;
		#1000;
		playBtn = 0;
		#100;
		playFileBtn = 1;
		#10;
		playFileBtn=0;
		#3000;
		playBtn = 1;
		#1100;
		$stop;
		  
		// Add stimulus here

	end


endmodule

