import numpy as np
import matplotlib.pyplot as plt


def createGeo(filename):
  op = open(filename, 'w')  
    
  rng, top, bot =  domain()

  for it, i in enumerate(bot):
    st = "Point(" + str(it + 1) + ") = {"
    st = st + str(rng[it]) + ", " + str(i) + " , 0.0, 0.1};\n"

    op.write(st)

  op.write("\n")

  op.close()


def domain():
  '''
  Create the top and bottom line and write the geo file
  '''
  
  L      = 1.0
  H      = 0.22*L
  H_top  = 0.52*L + H
  npts   = 100
  
  rng    = np.linspace(0, 1, 100)
  bot    = np.zeros_like(rng)
  
  top    = H_top*np.ones_like(rng)
  
  
  for it, i in enumerate(rng):
      coef    = H/L
  
      x       = i/L
      bot[it] = coef*(1. - 10.0*x**3 + 15.0*x**4 - 6*x**5)
  #plt.plot(rng, bot)
  #plt.plot(rng, top)
  #plt.show()


  return rng, top, bot
  

if __name__=="__main__":
    filename = "smooth_body.geo"
    #Erase the file
    open(filename, 'w').close()
    createGeo(filename)

