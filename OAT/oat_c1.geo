// near field size
nfSize = 0.3  ;
// far-field size
ffSize = 4.00;

nr  = 9;
sr  = 1.3;

srw = 1.05;

nu1 = 25;
su1 = 1.;

nu2 = 25;
su2 = 1.;

nu3  = 45;
su31 = 4.5;
su32 = 1.5;

nu4 = 24;
su4 = 1.;

nu5 = 25;
su5 = 1.;

nu6  = 25;
su61 = 1.08;
su62 = 1.06;
su63 = 1.08;
su64 = 0.95;

Include "oat15a_foil.geo";

//////////////////////////////////////////////////////////////////
///Inner Airfoi mesh
//////////////////////////////////////////////////////////////////



Spline(1)   = {1:39, 40};

p101 = newp;
Point(p101 + 1) = { 0.61, 0.16, 0, 1.0};
Point(p101 + 2) = { 1.02, 0.08, 0, 1.0};
Point(p101 + 3) = { 0.8 , 0.14, 0, 1.0};

l101 = newl;
Line(l101 + 1)    = {1, p101 + 2};
BSpline(l101 + 2) = {p101 + 2, p101 + 3, p101 + 1};
Line(l101 + 3)    = {p101 + 1, 40}; 

Line Loop(6)      = {-1, 5, 4, 3};
Plane Surface(7)  = {6};

Transfinite Line {l101 + 1, -(l101 + 3)} = nr  Using Progression sr; 
Transfinite Line {       1, l101 + 2}    = nu1 Using Progression su1; 

Transfinite Surface {7};

p102 = newp;
Point(p102 + 1) = {0.3, 0.19, 0, 1.0};
Point(p102 + 2) = {0.1, 0.15, 0, 1.0};

l102 = newl;
BSpline(l102 + 1) = {40:90, 91};

BSpline(l102 + 2) = {p101 + 1, p102 + 1, p102 + 2}; 
Line(l102 + 3)    = {p102 + 2, 91};

Line Loop(12) = {-9, 11, 10, -5};
Plane Surface(13) = {12};

Transfinite Line {l102 + 1, l102 + 2}   = nu2 Using Progression su2; 
Transfinite Line {         -(l102 + 3)} = nr  Using Progression sr ; 

Transfinite Surface {13};

p103 = newp;
Point(p103 + 1) = {-0.1 ,  0.1 , 0, 1.0};
Point(p103 + 2) = {-0.1 , -0.12, 0, 1.0};
Point(p103 + 3) = { 0.14, -0.11, 0, 1.0};

l103 = newl;
BSpline(l103 + 1) = {91:210, 211};

BSpline(l103 + 2) = {p102 + 2, p103 + 1, p103 + 2, p103 + 3}; 
Line(l103 + 3)    = {p103 + 3, 211};

Line Loop(18)     = {-15, 17, 16, -11};
Plane Surface(19) = {18};

Transfinite Line {l103 + 1          }   = nu3 Using Bump su31; 
Transfinite Line {          l103 + 2}   = nu3 Using Bump su32; 
Transfinite Line {         -(l103 + 3)} = nr  Using Progression sr ; 

Transfinite Surface {19};

p104 = newp;
Point(p104 + 1) = { 0.36, -0.10, 0, 1.0};
Point(p104 + 2) = { 0.59, -0.09, 0, 1.0};

l104 = newl;
BSpline(l104 + 1) = {211:257, 258};
BSpline(l104 + 2) = {p103 + 3, p104 + 1, p104 + 2};

Line(l104 + 3)    = {p104 + 2, 258};

Line Loop(24)     = {-17, -21, 23, 22};
Plane Surface(25) = {24};

Transfinite Line {l104 + 1, l104 + 2}   = nu4 Using Progression su4; 
Transfinite Line {         -(l104 + 3)} = nr  Using Progression sr ; 

Transfinite Surface {25};

p105 = newp;
Point(p105 + 1) = { 0.8  , -0.085, 0, 1.0};
Point(p105 + 2) = { 1.005, -0.075, 0, 1.0};

l105 = newl;
BSpline(l105 + 1) = {258:299, 300};
BSpline(l105 + 2) = {p104 + 2, p105 + 1, p105 + 2};

Line(l105 + 3)    = {p105 + 2, 300};

Line Loop(30)     = {28, 29, -27, -23};
Plane Surface(31) = {30};

Transfinite Line {l105 + 1, l105 + 2}   = nu5 Using Progression su5; 
Transfinite Line {         -(l105 + 3)} = nr  Using Progression sr ; 

Transfinite Surface {31};

p106 = newp;
Point(p106 + 1) = {1.3,  0.1,  0, 1.0};
Point(p106 + 2) = {2,    0.2,  0, 1.0};
Point(p106 + 3) = {1.3, -0.1,  0, 1.0};
Point(p106 + 4) = {2,   -0.2,  0, 1.0};
Point(p106 + 5) = {2,    0.03, 0, 1.0};
Point(p106 + 6) = {2,   -0.03, 0, 1.0};

BSpline(32) = {p101 + 2, p106 + 1, p106 + 2};
BSpline(33) = {p105 + 2, p106 + 3, p106 + 4};

l106 = newl;
Line(l106 + 1)    = {1, 300};
Line(l106 + 2)    = {p106 + 2, p106 + 5};
Line(l106 + 3)    = {p106 + 5, p106 + 6};
Line(l106 + 4)    = {p106 + 6, p106 + 4};
Line(l106 + 5)    = {p106 + 5, 1       };
Line(l106 + 6)    = {p106 + 6, 300     };


Transfinite Line {32, 33            }  = nu6 Using Progression su61; 
Transfinite Line {l106 + 5, l106 + 6}  = nu6 Using Progression su64; 
Transfinite Line {l106 + 1, l106 + 3}  = 4   Using Progression 1.; 
Transfinite Line {l106 + 2          }  = nr  Using Progression srw; 
Transfinite Line {l106 + 4          }  = nr  Using Progression srw; 

Line Loop(41) = {-39, -3, -32, -36};
Plane Surface(42) = {41};

Line Loop(43) = {35, -40, -37, 39};
Plane Surface(44) = {43};

Line Loop(45) = {-38, 33, -29, 40};
Plane Surface(46) = {45};

Transfinite Surface {42};
Transfinite Surface {44};
Transfinite Surface {46};


//////////////////////////////////////////////////////////////////
///Near field region
//////////////////////////////////////////////////////////////////

ffSize = 4.00   ;  // near-field mesh size

p201 = newp;  
Point(p201 + 1) = {0, 10, 0,  ffSize};
Point(p201 + 2) = {0, -10, 0, ffSize};
Point(p201 + 3) = {0, -0, -0, ffSize};

Point(p201 + 4) = {20, 10, 0, ffSize};
Point(p201 + 5) = {20, -10, 0,ffSize};

l201 = newl;
Circle(l201 + 1) = {p201 + 1, p201 + 3, p201 + 2 };
Line(l201 + 2)   = {p201 + 1, p201 + 4};
Line(l201 + 3)   = {p201 + 4, p201 + 5};
Line(l201 + 4)   = {p201 + 5, p201 + 2};

nfSize = 0.12   ;  // near-field mesh size

p202 = newp;  
Point(p202 + 1) = {-1.4, -0.9 , 0, nfSize};
Point(p202 + 2) = {-1.4,  0.9 , 0, nfSize};
Point(p202 + 3) = { 3.8, -0.9 , 0, nfSize};
Point(p202 + 4) = { 3.8,  0.9 , 0, nfSize};

l202 = newl;
Line(l202 + 1)   = {p202 + 1, p202 + 2};
Line(l202 + 2)   = {p202 + 2, p202 + 4};
Line(l202 + 3)   = {p202 + 4, p202 + 3};
Line(l202 + 4)   = {p202 + 3, p202 + 1};

Line Loop(57) = {-54, -55, -56, -53};
Line Loop(58) = {4, 10, 16, 22, 28, 33, -38, -37, -36, -32};
Plane Surface(59) = {57, 58};

Line Loop(60) = {49, 50, 51, -48};
Plane Surface(61) = {57, 60};

Physical Line("wall")     = {9, 15, 21, 27, 1, 35};
Physical Line("char")     = {48, 49, 50, 51};
Physical Surface("fluid") = {61, 42, 44, 46, 7, 13, 19, 25, 31, 59};
