sz1 = 0.05 ;
sz2 = 0.029;

Point(1) = {0  ,  0,  0, sz1};
Point(2) = {0.6,  0,  0, sz2};
Point(3) = {0.6,0.2,  0, sz2};
Point(4) = {3  ,0.2,  0, sz2};
Point(5) = {3  ,  1,  0, sz2};
Point(6) = {0.6,  1,  0, sz2};
Point(7) = {0  ,  1,  0, sz1};

Line(1)  = {1, 2};
Line(2)  = {2, 3};
Line(3)  = {3, 4};
Line(4)  = {4, 5};
Line(5)  = {5, 6};
Line(6)  = {6, 7};
Line(7)  = {7, 1};
Line(8)  = {3, 6};

Line Loop(9) = {3, 4, 5, -8};
Plane Surface(10) = {9};
Line Loop(11) = {8, 6, 7, 1, 2};
Plane Surface(12) = {11};
