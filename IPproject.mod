#paramaters
param c;
param w;
param N;
param B;
param reduceamount;
#variables 
var x1 binary; #x_1=provide face masks
var x2 binary; #Distance class rooms
var x3 binary; #educate staff on spread
var x4 integer >=0, <=4; #relocate workspaces
var x5 integer >=0, <=c+5; #shields/barriers
var x6 binary; #more busses
var x7 binary; #openable windows
var x8 integer >=0, <=c+10; #fans
var x8a binary;
var x9 binary; #directions in hallways
var x10 binary; #encourage outdoor
var x11 binary; #refirbish outdoor
var x12 binary; #provide students with technology
var x13 integer >=0, <=10; #no touch water stations

maximize value:
 .6*(3*x1
 	+2*x2
 	+x3
 	+.25*x4
 	+1/(c+5)*x5+
 	3*x6+
 	5*x7
 	+5/(c+10)*x8
 	+2*x9
 	+7*x10
 	+8*x11
 	+10*x12
 	+.4*x13)
	
	+.5*(1*x3
	+5*x7
	+5/(c+10) *x8
	+2*x9
	+6*x10
	+8*x11
	+8*x12
	+.4*x13 ) ;
subject to iffans:
	x8a<=x8;
subject to outdoorreferbrishing:
	x11 <= x10;

subject to exposurereduction:
	7*x1
	+8*x2
	+2*x3
	+.75*x4
	+2/(c+5)*x5
	+8*x6
	+6*x7
	+7/(c+10) *x8
	+6*x9
	+6*x10
	+6*x11
	+.2*x13>=reduceamount;

subject to budget:
	15/50*N/4*160*x1+150*x5+900*N*x6+850*w*x7+30*x8+50*x9+2000*x11+150*N*x12+900*x13<=B;
subject to time:
		x1+x2+2*x3+x4+1/3 *x5+2*x6+(35+w/15)* x7+2*x8a+x9+14*x11+2*x12+2*x13<=118;