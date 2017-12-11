lx = 2*Pi;
ly = 2   ;
lz = Pi;

nx = 20;
ny = 10;
nz = 10;

pnx = 1.0;
pnz = 1.0;

Point(1) = {0 , 0 , 0};
Point(2) = {lx, 0 , 0};
Point(3) = {lx,ly,  0};
Point(4) = {0 ,ly,  0};

Line(1)  = {1, 2};
Line(2)  = {2, 3};
Line(3)  = {3, 4};
Line(4)  = {4, 1};

Transfinite Line {1,  3} = nx Using Progression pnx;
Transfinite Line {2,  4} = ny Using Progression pnz;

Line Loop(5) = {1, 2, 3, 4};
Plane Surface(6) = {5};

Transfinite Surface {6};

Physical Line("Wall") = {3, 1};
Physical Line("Periodic_Lo_x") = {4};
Physical Line("Periodic_Hi_x") = {2};
Physical Surface("Fluid") = {6};
