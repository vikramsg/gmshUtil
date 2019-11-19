l1 = 1.0;

Point(1) = {0   , 0      , 0};
Point(2) = {0.5 , 0.866025 , 0};
Point(3) = {1.5 , 0.866025 ,  0};
Point(4) = {1   , 0      ,  0};

Line(1)  = {1, 2};
Line(2)  = {2, 3};
Line(3)  = {3, 4};
Line(4)  = {4, 1};

Line Loop(5) = {-1, -2, -3, -4};
Plane Surface(6) = {5};

Transfinite Line {1,  3} = 2;
Transfinite Line {2,  4} = 2;

Physical Line("Periodic_Lo_x") = {4};
Physical Line("Periodic_Hi_x") = {2};
Physical Line("Periodic_Lo_y") = {3};
Physical Line("Periodic_Hi_y") = {1};
Physical Surface("Fluid") = {6};

