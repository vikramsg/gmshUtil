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
Point(3) = {lx, 0, lz};
Point(4) = {0 , 0, lz};

Line(1)  = {1, 2};
Line(2)  = {2, 3};
Line(3)  = {3, 4};
Line(4)  = {4, 1};

Transfinite Line {1,  3} = nx Using Progression pnx;
Transfinite Line {2,  4} = nz Using Progression pnz;

Line Loop(5) = {1, 2, 3, 4};
Plane Surface(6) = {5};

Transfinite Surface {6};

Extrude {0, ly, 0}
{
    Surface{6};
    Layers{ny - 1};
    Recombine;
}

Physical Surface("Wall") = {6, 28};
Physical Surface("Per_Hi_X") = {19};
Physical Surface("Per_Lo_X") = {27};
Physical Surface("Per_Hi_Z") = {23};
Physical Surface("Per_Lo_Z") = {15};
Physical Volume("Fluid") = {1};
