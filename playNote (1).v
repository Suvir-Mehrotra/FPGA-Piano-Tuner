
module playNote(
		input clk,
		input noteClk,
		input fileClk,
		input fileValid,
		output speaker
		);
	reg tempSpeaker = 0;
	always @(posedge clk) begin 
		if(fileValid) begin
			tempSpeaker<= fileClk;
		end
		else begin
			tempSpeaker <= noteClk;
		end
	
	end 
	assign speaker = tempSpeaker;
	
endmodule