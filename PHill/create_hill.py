import numpy as np
import matplotlib.pyplot as plt

def create_bound(npts, h):
    x_bnd      = np.linspace(0, 252, npts)
    y_bnd      = np.zeros_like(x_bnd)

    for i, x_it in enumerate(x_bnd):
        if (x_it <= 9):
            temp = np.dtype(np.float64) 
            temp = 28 + 6.775070969851E-03*x_it*x_it - 2.124527775800E-03*x_it*x_it*x_it

            y_bnd[i] = np.minimum(28.0, temp)
        
        elif ((x_it > 9) and (x_it <= 14)):
            temp = np.dtype(np.float64) 
            temp = 2.507355893131E+01 + 9.754803562315E-01*x_it - 1.016116352781E-01*x_it**2 + 1.889794677828E-03*x_it**3

            y_bnd[i] = temp

        elif ((x_it > 14) and (x_it <= 20)):
            temp = np.dtype(np.float64) 
            temp = 2.579601052357E+01 + 8.206693007457E-01*x_it - 9.055370274339E-02*x_it**2 + 1.626510569859E-03*x_it**3
            
            y_bnd[i] = temp
        
        elif ((x_it > 20) and (x_it <= 30)):
            temp = np.dtype(np.float64) 
            temp = 4.046435022819E+01 - 1.379581654948E+00*x_it + 1.945884504128E-02*x_it**2 - 2.070318932190E-04*x_it**3 
            
            y_bnd[i] = temp

        elif ((x_it > 30) and (x_it <= 40)):
            temp = np.dtype(np.float64) 
            temp = 1.792461334664E+01 + 8.743920332081E-01*x_it - 5.567361123058E-02*x_it**2 + 6.277731764683E-04*x_it**3 
            
            y_bnd[i] = temp

        elif ((x_it > 40) and (x_it <= 54)):
            temp = np.dtype(np.float64) 
            temp = 5.639011190988E+01 - 2.010520359035E+00*x_it + 1.644919857549E-02*x_it**2 + 2.674976141766E-05*x_it**3 
            
            y_bnd[i] = np.maximum(0, temp) 

    for i, x_it in enumerate(x_bnd[npts/2:]):
        y_bnd[npts - 1 - i] = y_bnd[i]

    plt.plot(x_bnd, y_bnd)
#    plt.show()

    return (x_bnd, y_bnd)

def write_geo(x_bnd, y_bnd, h, geo_file):

    op = open(geo_file, 'w')
    for it, x_it in enumerate(x_bnd):
        st = "Point(" + str(it)+")={" + str(x_it/h) + ", " + str(y_bnd[it]/h) + ", 0.00 }; \n"
        op.write(st)

    npts = np.shape(x_bnd)[0]

    st = "\n\n"
    op.write(st)

    st = "Point(" + str(npts)+")={" + str(0.0) + ", " + str(85.008/h) + ", 0.00 }; \n"
    op.write(st)

    st = "Point(" + str(npts + 1)+")={" + str(np.max(x_bnd)/h) + ", " + str(85.008/h) + ", 0.00 }; \n"
    op.write(st)



    op.close()

if __name__=="__main__":
    npts = 200; h = 28.0
    assert(np.remainder(npts, 2) == 0)

    x_bnd, y_bnd = create_bound(npts, h)

    geo_file     = "phill.geo"

    write_geo(x_bnd, y_bnd, h, geo_file)
