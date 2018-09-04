nfSize = .035 ;  // near-field mesh size
ffSize = .6 ;  // near-field mesh size

//Extrusion
lz = 0.031;
nz = 9;

// Transfinite points
c1_t1 = 30;
c1_r1 = 20;
c1_t2 = 35;

c1_t3 =  4;

s1_t1  = 5;
s1_r1  = 3;

lc_r1  =  9;
lc_t1  =106;

rc_r1  =  9;
rc_t1  =106;


// Circle & surrounding structured-quad region
Point(1 )   = {0,   0, 0};
Point(2 )   = {0,  .077, 0};
Point(3 )   = {0, -.077, 0};

Point(4 )   = {0,   -0.00075 ,  0};
Point(5 )   = {0,  .0755 ,      0};

Point(6 )   = {0.002232,  0.07547,      0};

Point(7 )   = {0.004,  0.0799,    0};
Point(8 )   = {0.002,  0.08,      0};
Point(9 )   = {0.0  ,  0.08,      0};

Point(10)   = {0.0013, 0.077,      0};

Point(11)   = {0.0  , -0.08,      0};

Point(31)   = {-0.001, 0.0769,    0};
Point(32)   = { 0.00 ,-0.0769,    0};

Circle(1)   = {2, 1, 3};
Circle(2)   = {6, 4, 5};
Circle(3)   = {3, 4, 6};

Line(4 )    = {2, 5};

Line(5 )    = {6, 7};
Line(6 )    = {7, 8};
Line(7 )    = {8, 9};
Line(8 )    = {9, 2};

Line(9 )    = {2,  10};
Line(10)    = {10,  6};
Line(11)    = {10,  8};

Circle(12)  = {11, 1, 7};
Circle(13)  = {9 , 1,11};

Circle(31)  = {31, 1,32};
Line  (32)  = {2 ,   31};

Line  (14)  = {3,  11};

Line Loop(101) = {5, 6, -11, 10};
Plane Surface(201) = {101};

Line Loop(102) = {9, 11, 7, 8};
Plane Surface(202) = {102};

Line Loop(103) = {-2, 4, -9, -10};
Plane Surface(203) = {103};

Line Loop(104) = {-3, -5, 12, 14};
Plane Surface(204) = {104};

Line Loop(105) = {-1, -14, 13, -8};
Plane Surface(205) = {105};

Transfinite Line {3, 12}  = rc_t1 Using Progression 1;
Transfinite Line {5, 14}  = rc_r1 Using Progression 1;

Transfinite Surface {204};

Transfinite Line {1, 13}  = lc_t1 Using Progression 1;
Transfinite Line {8    }  = lc_r1 Using Progression 1;

Transfinite Surface {205};


Transfinite Line {4, 10}  = s1_t1 Using Progression 1;
Transfinite Line {2, 9 }  = s1_r1 Using Progression 1;

Transfinite Surface {203};

Transfinite Line {11   }  = rc_r1 Using Progression 1;
Transfinite Line {6    }  = s1_t1 Using Progression 1;

Transfinite Surface {201};

Transfinite Line {7    }  = s1_r1 Using Progression 1;

Transfinite Surface {202};

// Inner circle 
Point(12)   = {     0 ,  .0535  , 0};
Point(13)   = {     0 ,  .0645  , 0};
Point(41)   = {-0.0011,  .075445, 0};

Circle(15)  = {41 ,13, 12};
Circle(41)  = { 5 ,13, 41};

Line  (16)  = {12,     32};
Line  (42)  = { 31,    41};

Transfinite Line {15   }  = c1_t1 Using Progression 1;
Transfinite Line {16   }  = c1_r1 Using Progression 1;
Transfinite Line {31   }  = c1_t2 Using Progression 1;

Transfinite Line {32,  41 }  = c1_t3 Using Progression 1;
Transfinite Line {42      }  = s1_t1 Using Progression 1;

Line Loop(106) = {-4, -41, 42, 32};
Plane Surface(206) = {106};

Line Loop(110) = {-16, 31, -42, -15};
Plane Surface(210) = {110};

// near box
Point(14)   = { 0.25, -0.25, 0, nfSize};
Point(15)   = { 0.25,  0.25, 0, nfSize};
Point(16)   = {-0.25,  0.25, 0, nfSize};
Point(17)   = {-0.25, -0.25, 0, nfSize};

Line(17) = {14, 15};
Line(18) = {15, 16};
Line(19) = {16, 17};
Line(20) = {17, 14};

Line Loop(107) = {20, 17, 18, 19};
Line Loop(108) = {12, 6, 7, 13};

Plane Surface(207) = {107, 108};

Point(18)   = { 2, -2, 0, ffSize};
Point(19)   = { 2,  2, 0, ffSize};
Point(20)   = {-2,  2, 0, ffSize};
Point(21)   = {-2, -2, 0, ffSize};

Line(21) = {18, 19};
Line(22) = {19, 20};
Line(23) = {20, 21};
Line(24) = {21, 18};

Line Loop(109) = {24, 21, 22, 23};

Plane Surface(208) = {109, 107};

Extrude {0,0, lz}
{
    Surface{210, 208, 207, 206, 202, 201, 203, 204, 205};
    Layers{nz};
    Recombine;
}



Physical Surface("wall") = {413, 435};
Physical Surface("slip") = {231, 223};
Physical Surface("inlet") = {219};
Physical Surface("freestream") = {257, 253, 249, 245};
Physical Volume("fluid") = {8, 2, 3, 9, 4, 7, 5, 6, 1};

Physical Surface("lo_z") = {210, 208, 207, 206, 202, 201, 203, 204, 205};
Physical Surface("hi_z") = {274, 316, 232, 404, 382, 338, 448, 360, 426};
