`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:23:13 03/27/2018 
// Design Name: 
// Module Name:    gfmul2 
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
//FINAL
module gfmul2(a,b,p,mul,m);
	 input [3:0]a,b;
	 input[2:0]m;
	 input[4:0]p;
	 output [3:0]mul;
	 reg [6:0]op;
	reg[6:0] y0,y1,y2,y3,y,op1,op2,op3;
	reg[6:0] p1;
	
always@(a,b)
begin
	
	if(m==3'd3)
begin
	y0=a[0]*b;
	y1=a[1]*b;
	y2=a[2]*b;
	y1=y1<<1'b1;
	y2=y2<<2'b10;
	y=(y0^y1)^y2;
	op=y;
	if(y[4]==1'b1)
	begin
	p1=p;
	p1=p1<<1'b1;
	op1=y^p1;
	op=op1;
	end
	if(y[3]==1'b1)
	begin
	op2=op[3:0]^p[3:0];
	op=op2;
	end
end
if(m==3'd4)
begin
	y0=a[0]*b;
	y1=a[1]*b;
	y2=a[2]*b;
	y3=a[3]*b;
	y1=y1<<1'b1;
	y2=y2<<2'b10;
	y3=y3<<2'b11;
	y=(y0^y1)^(y2^y3);
	op=y;
	if(y[6]==1'b1)
	begin
	p1=p;
	p1=p1<<2'b10;
	op1=y^p1;
	op=op1;
	end
	if(op[5]==1'b1)
	begin
	p1=p;
	p1=p1<<1'b1;
	op2=op^p1;
	op=op2;
	end
	if(op[4]==1'b1)
	begin
	p1=p;
	op3=op^p1;
	op=op3;
	end
end
end
assign mul=op[3:0];  
endmodule

