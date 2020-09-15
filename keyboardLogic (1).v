//Soeaker Code 
//Goal: Divide the clock into signals for each note 
//How should I do thix? 
// 7 octaves 7 notes 
// Octave 8 bit Note 8 bit register 

// Define ports 
// Inputs: note - octave 
// Output: Adjusted Note frequency 

module keyboardLogic(
	input clk,
	input isValid,
	input [2:0] note, 
	input [2:0]inOctave,
	output noteAdjust

	);
	
	
 reg noteAdjustTemp = 0;

 reg proccessedAlready = 0;
// Base frequencies Factors
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

reg [31:0] clkCnt = 0;	

always @(posedge(clk)) begin

 if(isValid) begin
	
	if ( note == 3'b001 ) begin 
		if(inOctave==3'b001) begin
			if (clkCnt == noteAO1) begin
					clkCnt <= 32'b0;
					noteAdjustTemp <=~noteAdjustTemp;
			end
			else begin
					clkCnt <= clkCnt + 1;
					noteAdjustTemp <= noteAdjustTemp;
			end 
		end
		else if(inOctave == 3'b010) begin
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

	else if ( note == 3'b010 ) begin 
		if(inOctave==3'b001) begin
			if (clkCnt == noteBO1) begin
					clkCnt <= 32'b0;
					noteAdjustTemp <=~noteAdjustTemp;
			end
			else begin
					clkCnt <= clkCnt + 1;
					noteAdjustTemp <= noteAdjustTemp;
			end 
		end
		else if(inOctave == 3'b010) begin
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
	else if ( note == 3'b011 ) begin 
		if(inOctave==3'b001) begin
			if (clkCnt == noteCO1) begin
					clkCnt <= 32'b0;
					noteAdjustTemp <=~noteAdjustTemp;
			end
			else begin
					clkCnt <= clkCnt + 1;
					noteAdjustTemp <= noteAdjustTemp;
			end 
		end
		else if(inOctave == 3'b010) begin
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
	else if ( note == 3'b100 ) begin 
		if(inOctave==3'b001) begin
			if (clkCnt == noteDO1) begin
					clkCnt <= 32'b0;
					noteAdjustTemp <=~noteAdjustTemp;
			end
			else begin
					clkCnt <= clkCnt + 1;
					noteAdjustTemp <= noteAdjustTemp;
			end 
		end
		else if(inOctave == 3'b010) begin
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
	else if ( note == 3'b101 ) begin 
		if(inOctave==3'b001) begin
			if (clkCnt == noteEO1) begin
					clkCnt <= 32'b0;
					noteAdjustTemp <=~noteAdjustTemp;
			end
			else begin
					clkCnt <= clkCnt + 1;
					noteAdjustTemp <= noteAdjustTemp;
			end 
		end
		else if(inOctave == 3'b010) begin
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
	else if ( note == 3'b110 ) begin 
		if(inOctave==3'b001) begin
			if (clkCnt == noteFO1) begin
					clkCnt <= 32'b0;
					noteAdjustTemp <=~noteAdjustTemp;
			end
			else begin
					clkCnt <= clkCnt + 1;
					noteAdjustTemp <= noteAdjustTemp;
			end 
		end
		else if(inOctave == 3'b010) begin
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
	else if( note == 3'b111 )begin 
		if(inOctave==3'b001) begin
			if (clkCnt == noteGO1) begin
					clkCnt <= 32'b0;
					noteAdjustTemp <=~noteAdjustTemp;
			end
			else begin
					clkCnt <= clkCnt + 1;
					noteAdjustTemp <= noteAdjustTemp;
			end 
		end
		else if(inOctave == 3'b010) begin
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
	else begin
		noteAdjustTemp<=0;
	end
end 



assign noteAdjust = noteAdjustTemp;


endmodule 