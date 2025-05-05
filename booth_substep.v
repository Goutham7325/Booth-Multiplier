module booth_substep(
	input wire signed [7:0] acc,
	input wire signed [7:0] Q,
	input wire signed q0,
	input wire signed [7:0] multiplicand,
	output reg signed [7:0] next_acc,
	output reg signed [7:0] next_Q,
	output reg q0_next);
	
	wire [7:0] addsub_temp;
	adder_subtractor addsub(Q[0],acc,multiplicand, addsub_temp);
	always@(*) begin
		if(Q[0] ==q0) begin
			q0_next = Q[0];
			next_Q = Q>>1;
			next_Q[7] = acc[0];
			next_acc = acc>>1;
			if(acc[7] == 1) begin
				next_acc[7] = 1;
			end
		end
		else begin
			q0_next = Q[0];
			next_Q = Q>>1;
			next_Q[7] = addsub_temp[0];
			next_acc = addsub_temp>>1;
			if(addsub_temp[7] == 1) begin
				next_acc[7] = 1;
			end
		end
	end
	endmodule
	