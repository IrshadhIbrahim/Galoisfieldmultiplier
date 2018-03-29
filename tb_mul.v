`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:54:44 03/27/2018 
// Design Name: 
// Module Name:    tb_mul 
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
module tb_mul;
// Inputs
reg [3:0] a1,b1;
reg [2:0] m1;
reg [4:0] poly1;

// Outputs
wire [3:0] c;

gfmul2 ab(
.m(m1),
.p(poly1),
.a(a1),
.b(b1),
.mul(c)
);

initial begin


$monitor ("a=%h,\tb=%h,\tc=%h",a1,b1,c);

#10  m1=3'b011; poly1=5'b01011; a1 = 4'b0101; b1 = 4'b0111;
#10  m1=3'b011; poly1=5'b01011; a1 = 4'b0110; b1 = 4'b0011;
#10  m1=3'b011; poly1=5'b01011; a1 = 4'b0100; b1 = 4'b0010;
#10  m1=3'b011; poly1=5'b01011; a1 = 4'b0100; b1 = 4'b0101;
#10  m1=3'b100; poly1=5'b11001; a1 = 4'b1000; b1 = 4'b1001;
#10  m1=3'b100; poly1=5'b11001; a1 = 4'b1011; b1 = 4'b1111;
#10  m1=3'b100; poly1=5'b11001; a1 = 4'b0011; b1 = 4'b0100;
#10  m1=3'b100; poly1=5'b11001; a1 = 4'b1100; b1 = 4'b0101;
#10  m1=3'b011; poly1=5'b01101; a1 = 4'b0000; b1 = 4'b0000;

  $stop();  

end
endmodule
