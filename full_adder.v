//FULL ADDER 4 BIT
module full_adder ( input wire a, b, cin, output wire sum, cout);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (cin & a);
endmodule
