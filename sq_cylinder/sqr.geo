
/////////////////////////////////////////////////////////////////////////////////////////
/////Define inner square/////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Point(1) = {-0.5, -0.5, 0, 1};
Point(2) = { 0.5, -0.5, 0, 1};
Point(3) = { 0.5,  0.5, 0, 1};
Point(4) = {-0.5,  0.5, 0, 1};

Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};


/////////////////////////////////////////////////////////////////////////////////////////
/////Define outer square/////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
p102 = newp;
Point(p102 + 1) = {-1, -1, 0, 1};
Point(p102 + 2) = { 1, -1, 0, 1};
Point(p102 + 3) = { 1,  1, 0, 1};
Point(p102 + 4) = {-1,  1, 0, 1};

l102 = newl;
Line(l102 + 1) = {p102 + 1, p102 + 2};
Line(l102 + 2) = {p102 + 2, p102 + 3};
Line(l102 + 3) = {p102 + 3, p102 + 4};
Line(l102 + 4) = {p102 + 4, p102 + 1};

Line(l102 + 5) = {1, p102 + 1};
Line(l102 + 6) = {2, p102 + 2};
Line(l102 + 7) = {3, p102 + 3};
Line(l102 + 8) = {4, p102 + 4};

/////////////////////////////////////////////////////////////////////////////////////////
/////Define surfaces/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////

sp1 = 1.0;
np1 = 20;

sr1 = 1.0;
nr1 = 15;

Transfinite Line {1, 2, 3, 4}                               = np1 Using Bump sp1; 
Transfinite Line {l102 + 1, l102 + 2, l102 + 3, l102 + 4}   = np1 Using Bump sp1; 

Transfinite Line {l102 + 5, l102 + 6, l102 + 7, l102 + 8}   = nr1 Using Bump sr1; 

Line Loop(1001) = {-2, -12, 7, 11};
Plane Surface(2001) = {1001};

Transfinite Surface {2001};

Line Loop(1002) = {-3, -13, 8, 12};
Plane Surface(2002) = {1002};

Transfinite Surface {2002};

Line Loop(1003) = {-4, -10, 9, 13};
Plane Surface(2003) = {1003};

Transfinite Surface {2003};

Line Loop(1004) = {10, 6, -11, -1};
Plane Surface(2004) = {1004};

Transfinite Surface {2004};


/////////////////////////////////////////////////////////////////////////////////////////
/////Define wake/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////

p201 = newp;
Point(p201 + 1) = {10, -1, 0, 1};
Point(p201 + 2) = {10,  1, 0, 1};

l201 = newl;

Line(l201 + 1) = {p102 + 2, p201 + 1};
Line(l201 + 2) = {p201 + 1, p201 + 2};
Line(l201 + 3) = {p201 + 2, p102 + 3};

np2 =100;
sp2 = 1.0;

Transfinite Line {l201 + 2}             = np1 Using Bump sp1; 
Transfinite Line {l201 + 1, l201 + 3}   = np2 Using Bump sp2; 

Line Loop(1005) = {2006, 2007, 2008, -7};
Plane Surface(2005) = {1005};

Transfinite Surface {2005};


/////////////////////////////////////////////////////////////////////////////////////////
/////Inner refined///////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////

nfsize = 0.7;

p301 = newp;
Point(p301 + 1) = {-5,  -10, 0, nfsize};
Point(p301 + 2) = { 15, -10, 0, nfsize};
Point(p301 + 3) = { 15,  10, 0, nfsize};
Point(p301 + 4) = {-5,   10, 0, nfsize};

l301 = newl;
Line(l301 + 1) = {p301 + 1, p301 + 2};
Line(l301 + 2) = {p301 + 2, p301 + 3};
Line(l301 + 3) = {p301 + 3, p301 + 4};
Line(l301 + 4) = {p301 + 4, p301 + 1};


Line Loop(1006) = {2010, 2011, 2012, 2013};
Line Loop(1007) = {8, 9, 6, 2006, 2007, 2008};

Plane Surface(2006) = {1006, 1007};


/////////////////////////////////////////////////////////////////////////////////////////
/////Outer boundary//////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////

ffsize =  4;

p401 = newp;
Point(p401 + 1) = {-20, -25, 0, ffsize};
Point(p401 + 2) = { 50, -25, 0, ffsize};
Point(p401 + 3) = { 50,  25, 0, ffsize};
Point(p401 + 4) = {-20,  25, 0, ffsize};

l401 = newl;
Line(l401 + 1) = {p401 + 1, p401 + 2};
Line(l401 + 2) = {p401 + 2, p401 + 3};
Line(l401 + 3) = {p401 + 3, p401 + 4};
Line(l401 + 4) = {p401 + 4, p401 + 1};


Line Loop(1008) = {-2015, -2016, -2017, -2018};
Plane Surface(2008) = {1006, 1008};

/////////////////////////////////////////////////////////////////////////////////////////


Physical Line(3001) = {3, 4, 2, 1};
Physical Line(3002) = {2018, 2017, 2016, 2015};

Physical Surface(4001) = {2005, 2001, 2002, 2003, 2004, 2006, 2008};
