module adder_subtractor(
	input wire cin,
	input wire [7:0] a, b,
	output wire [7:0] sum);
	wire cout;
	wire [7:0] temp;
	wire [7:0] int_ip;
	
	xor2 x0(b[0], cin, int_ip[0]);
	xor2 x1(b[1], cin, int_ip[1]);
	xor2 x2(b[2], cin, int_ip[2]);
	xor2 x3(b[3], cin, int_ip[3]);
	xor2 x4(b[4], cin, int_ip[4]);
	xor2 x5(b[5], cin, int_ip[5]);
	xor2 x6(b[6], cin, int_ip[6]);
	xor2 x7(b[7], cin, int_ip[7]);
	
	full_adder fa1(a[0], int_ip[0], cin,     sum[0], temp[0]);
	full_adder fa2(a[1], int_ip[1], temp[0], sum[1], temp[1]);
	full_adder fa3(a[2], int_ip[2], temp[1], sum[2], temp[2]);
	full_adder fa4(a[3], int_ip[3], temp[2], sum[3], temp[3]);
	full_adder fa5(a[4], int_ip[4], temp[3], sum[4], temp[4]);
	full_adder fa6(a[5], int_ip[5], temp[4], sum[5], temp[5]);
	full_adder fa7(a[6], int_ip[6], temp[5], sum[6], temp[6]);
	full_adder fa8(a[7], int_ip[7], temp[6], sum[7], cout);
endmodule
	