`timescale 1ns / 1ps

module displayAndProcess(
	input clock,
	input playBtn,
	input rightOctaveBtn,
	input leftOctaveBtn,
	input playFileBtn,
	input [7:0] note,
	output reg [7:0] segDisplay,
	output reg [2:0] currNum,
	output reg [2:0] octaveOutput,
	output reg currNoteOutput,
	output reg playOutput,
	output reg currFileOutput,
	output reg fileOutput,
	output reg rightOutput,
	output Speaker
	);
reg [2:0] currNote = 3'b000;
reg playValid = 0;
wire [2:0] octaveState;
wire [7:0] octaveSegs;

wire rightState,leftState,fileState;
wire currNoteClk;
wire currFileClk;
wire fileValid;
wire [2:0] pfOctaveState;
/*
debouncer rightDB( 
	.button_in(rightOctaveBtn),
	.clk(clk),
	.DB_out(rightState)
);

debouncer leftDB( 
	.button_in(leftOctaveBtn),
	.clk(clk),
	.DB_out(leftState)
);

debouncer fileDB(
	.button_in(playFileBtn),
	.clk(clk),
	.DB_out(fileState)
);
*/

octaveStuff os(
	.clk(clock),
	.leftBtn(leftOctaveBtn),
	.rightBtn(rightOctaveBtn),
	.octaveState(octaveState)
);
fileStuff pff(
	.clk(clock),
	.fileState(playFileBtn),
	.fileValid(fileValid),
	.noteAdjust(currFileClk),
	.pfOctaveState(pfOctaveState)

);
keyboardLogic kb(
	.clk(clock),
	.isValid(playValid),
	.note(currNote),	
	.inOctave(octaveState),
	.noteAdjust(currNoteClk)

);
playNote pn(
	.clk(clock),
	.noteClk(currNoteClk),
	.fileClk(currFileClk),
	.fileValid(fileValid),
	.speaker(Speaker)
);
segmentDisplay octaveNum(
	.clk(clock),
	.fileValid(fileValid),
	.digit(octaveState),
	.altDigit(pfOctaveState),
	.displaySeg(octaveSegs)
);
always @(posedge clock) begin

	if(note==8'b10000000) begin
		currNote<=3'b001;
	end
	else if(note==8'b01000000) begin
		currNote<= 3'b010;
	end
	else if(note==8'b00100000) begin
		currNote<=3'b011;
	end
	else if(note==8'b00010000) begin
		currNote<= 3'b100;
	end
	else if(note==8'b00001000) begin
		currNote<= 3'b101;
	end
	else if(note==8'b00000100) begin
		currNote<= 3'b110;
	end
	else if(note==8'b00000010) begin
		currNote<=3'b111;
	end
	else begin
		currNote<= 3'b000;
	end
	if(playBtn) begin
		playValid<= 1;
	end
	else begin
		playValid<=0;
	end
		currNum <= currNote;
		segDisplay <= octaveSegs;
		octaveOutput<=octaveState;
		currNoteOutput <= currNoteClk;
		currFileOutput <= currFileClk;
		fileOutput <= fileValid;
		playOutput <= playValid;
		rightOutput <= rightOctaveBtn;

end

endmodule