class PtsToGeo:

    def __init__(self):
        pass

    def convert(self, filename, outFile, pointNo):
        op=open(filename, 'r')
        wr = open(outFile,'a')
        charLen = "0.005"
        temp = op.readline()
        temp = op.readline()
        topLines = int(float(temp.split()[0]))
        botLines = int(float(temp.split()[1]))
        temp = op.readline()
        st=[]
        for i in op:
            try:
                i.split()[0]
                st.append(i.split())
            except IndexError:
                continue
        op.close()

        for i in range(topLines):
            stWr = "Point("+str(i+1+pointNo-1)+") = {" +st[topLines-i-1][0]+", "+ st[topLines-i-1][1] + ", 0.00, " +charLen+"};\n"
            wr.write(stWr)
        for i in range(botLines):
            stWr = "Point("+str(topLines+i+1+pointNo-1)+") = {" +st[i+topLines][0]+", "+ st[i+topLines][1] + ", 0.00, " +charLen+"};\n"
            wr.write(stWr)
        wr.close()

    def add(self, fileName, st, pointNo):
        op=open(fileName,'a')
        op.write("Point("+str(pointNo)+")="+st+'\n')
        op.close()

    def addLine(self, fileName, st, lineNo):
        op=open(fileName,'a')
        op.write("Line("+str(lineNo)+")="+st+'\n')
        op.close()


    def fitSpline(self, fileName, st, splineNo):
        op=open(fileName,'a')
        op.write("\n// Fit a spline on the points specified\n\n")
        op.write("Spline("+str(splineNo)+") = "+st)
        op.close()

    def addBox(self, fileName, starX, starY, lenX, lenY, poinNo, linNo, charLen):
        op=open(fileName,'a')
        op.write("\n\n// Add a box \n")
        point1 = "Point("+str(poinNo)+") = {" + str(starX)+" ,"+str(starY)+ ", 0.0, "+str(charLen)+"};"
        point2 = "Point("+str(poinNo+1)+") = {" + str(starX+lenX)+" ,"+str(starY)+ ", 0.0, "+str(charLen)+"};"
        point3 = "Point("+str(poinNo+2)+") = {" + str(starX+lenX)+" ,"+str(starY+lenY)+ ", 0.0, "+str(charLen)+"};"
        point4 = "Point("+str(poinNo+3)+") = {" + str(starX)+" ,"+str(starY+lenY)+ ", 0.0, "+str(charLen)+"};"
        op.write(point1+"\n"+point2+"\n"+point3+"\n"+point4)
        line1 = "Line("+str(linNo)+") = {"+str(poinNo)+" ,"+  str(poinNo+1)+" };"
        line2 = "Line("+str(linNo+1)+") = {"+str(poinNo+1)+" ,"+  str(poinNo+2)+" };"
        line3 = "Line("+str(linNo+2)+") = {"+str(poinNo+2)+" ,"+  str(poinNo+3)+" };"
        line4 = "Line("+str(linNo+3)+") = {"+str(poinNo+3)+" ,"+  str(poinNo)+" };"

        op.write("\n\n// Create lines for the points\n")
        op.write(line1+"\n"+line2+"\n"+line3+"\n"+line4)
        op.close()


    def addLineLoop(self, fileName, st, loopNo):
        op=open(fileName,'a')
        op.write("\n\n// Loop a line \n")
        op.write("Line Loop ("+str(loopNo)+") = "+st)
        op.close()

    def addPlaneSurface(self, fileName, st, loopNo):
        op=open(fileName,'a')
        op.write("\n\n// Create plane surface\n")
        op.write("Plane Surface ("+str(loopNo)+") = "+st+"\n\n")
        op.close()

    def addFieldAttract(self, fileName, nodeList, edgeList, fieldNo):
        op=open(fileName,'a')
        op.write("\n// Create Attractor Field reference\n")
        op.write("Field["+str(fieldNo)+"] = Attractor;\n")
        if nodeList is not None:
            op.write("Field["+str(fieldNo)+"].NodesList = "+str(nodeList)+";\n")
        if edgeList is not None:
            op.write("Field["+str(fieldNo)+"].EdgesList = "+str(edgeList)+";\n")
            op.write("Field["+str(fieldNo)+"].NNodesByEdge = 100;\n")

        op.close()

    def addFieldThreshold(self, fileName, IField, lcMin, lcMax, distMin, distMax, fieldNo):
        op=open(fileName,'a')
        op.write("\n// Create Threshold for Attractor Field reference\n")
        op.write("Field["+str(fieldNo)+"] = Threshold;\n")

        op.write("Field["+str(fieldNo)+"].IField = "+str(IField)+";\n")
        op.write("Field["+str(fieldNo)+"].LcMin = "+str(lcMin)+";\n")
        op.write("Field["+str(fieldNo)+"].LcMax = "+str(lcMax)+";\n")
        op.write("Field["+str(fieldNo)+"].DistMin = "+str(distMin)+";\n")
        op.write("Field["+str(fieldNo)+"].DistMax = "+str(distMax)+";\n")

        op.close()

    def addFieldMin(self, fileName, fieldsList, fieldNo):
        op=open(fileName,'a')
        op.write("\n// Create Backgound field as minimum of refined field\n")
        op.write("Field["+str(fieldNo)+"] = Min;\n")

        op.write("Field["+str(fieldNo)+"].FieldsList = "+str(fieldsList)+";\n")
        op.write("Background Field = "+str(fieldNo)+";\n")

        op.close()

    def rotate(self, fileName, axis, center, angle, entity):
        op=open(fileName,'a')
        op.write("\n// Rotate\n")
        op.write("Rotate{"+axis+", "+center+", "+str(angle)+"} "+entity+";\n")

        op.close()

    def addFieldBox(self, fileName, xMin, xMax, yMin, yMax, vIn, vOut, fieldNo):
        op=open(fileName,'a')
        op.write("\n\n// Create Box refinement defined by VIn inside box and VOut outside box\n")
        op.write("Field["+str(fieldNo)+"] = Box;\n")

        op.write("Field["+str(fieldNo)+"].VIn = "+str(vIn)+";\n")
        op.write("Field["+str(fieldNo)+"].VOut = "+str(vOut)+";\n")
        op.write("Field["+str(fieldNo)+"].XMin = "+str(xMin)+";\n")
        op.write("Field["+str(fieldNo)+"].XMax = "+str(xMax)+";\n")
        op.write("Field["+str(fieldNo)+"].YMin = "+str(yMin)+";\n")
        op.write("Field["+str(fieldNo)+"].YMax = "+str(yMax)+";\n")

        op.close()



if __name__=="__main__":
    import sys
    import traceback
    try:
        run = PtsToGeo()

        """
        Start the file for writing
        """
        op=open(sys.argv[2], 'w')
        op.close()

        run.add(sys.argv[2], "{1.005, 0.00, 0.00, 0.010};", 1)
        #Input file, output file, point no. for first point
        run.convert(sys.argv[1], sys.argv[2], 2)
        #NACA airfoils have missing last point
        run.add(sys.argv[2], "{1.005, 0.00, 0.00, 0.010};", 134)

        #Fit a spline over points in gmsh format
        run.fitSpline(sys.argv[2], "{1:67,68};", 1)
        run.fitSpline(sys.argv[2], "{68:134,1};", 2)

        run.rotate(sys.argv[2], axis="{0,0,1}", center="{1,0,0}", angle="0.0", entity="{Line{1};Line{2};}")
        """
        Add a box with starting point and delta X, delta Y, 
        first point no. available for gmsh
        first line no. available
        characteristic length
        """
        run.addBox(sys.argv[2], -2,-1,4,2, 135, 3, 0.50)

        """
        Having created the required lines, close them
        Specification for box loop and number for gmsh
        """
        run.addLineLoop(sys.argv[2], "{3,4,5,6};", 1)
        """
        Spline should also be line loop
        """
        run.addLineLoop(sys.argv[2], "{1,2};", 2)
        """
        Create a plane surface
        """
        run.addPlaneSurface(sys.argv[2], "{1,2};", 1)

        run.add(sys.argv[2], "{2, 0.00, 0.00, 0.010};", 139)
        run.addLine(sys.argv[2], "{1,139};", 7)

        run.addFieldAttract(sys.argv[2], nodeList=None, edgeList="{7}", fieldNo=1)

        run.addFieldThreshold(sys.argv[2], IField=1, lcMin=0.01, lcMax=0.4, distMin=0.01, distMax=0.6, fieldNo=2)

        run.addFieldBox(sys.argv[2], xMin = -0.2, xMax = 2.0, yMin = -0.2, yMax = 0.2, vIn = 0.02, vOut = 0.3, fieldNo=3)

        run.addFieldMin(sys.argv[2], fieldsList="{3}", fieldNo=4)



    except IndexError:
        raise TypeError("Specify name of airfoil file and output file")
        print(traceback.print_exc())
