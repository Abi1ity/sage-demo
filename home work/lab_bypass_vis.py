

#filename = "lab.txt"
def from_file(filename):
    filo = open(filename, 'r')
    listoflines = filo.readlines()
    lab = [];
    lab = lab + [list(line)[:-1] for line in listoflines];

def generateFromText(s):
    lab = []
    temp = []
    for c in s:
        if c == '\n':
            lab.append(temp)
            temp = []
        elif c == '.':
            temp.append(0)
        elif c == '#':
            temp.append(1)
        else:
            return None
    return lab



def draw(lab):
    g = Graphics()
    for i in xrange(len(lab)):
        for j in xrange(len(lab[0])):
            if lab[i][j] == 1:
                g += polygon([[j,i], [j+1,i], [j+1, i+1],[j, i+1]], rgbcolor = (0,0,0))
            else:
                g += polygon([[j,i], [j+1,i], [j+1, i+1],[j, i+1]], rgbcolor = (1,1,0))
    
    g.axes(False)
    return g

def modify_graphics(g, i, j):
    g += polygon([[j,i], [j+1,i], [j+1, i+1],[j, i+1]], rgbcolor = (1,1,1))
    

lab = generateFromText(
"""...........
.#.###.###.
.#...#...#.
.#.#####.#.
.#.....#.#.
##.###.###.
.....#.#.#.
.#.###.#.##
.#...#.#...
##.#.###.##
...#.......
""")
print lab
g = draw(lab)
g.show()
bypass_vis(lab, g)
a = animate(glist)
a.show(delay=20)


def bypass_vis(lab, g)
    Hsize = len(lab[0]);
    Vsize = len(lab);
    start = (0,0);
    exit = (Hsize-1, Vsize-1);
    dx = (1, 0, -1, 0);
    dy = (0, 1, 0, -1);
    d = 0;
    stackNext = [start];
    lab[start[1]][start[0]] = 0;
    stop = False;
    glist = [];
    while True:
	    stop = True;
	    stackPrev = stackNext[:];
	    stackNext = []; 
	    while(stackPrev):
		    p = stackPrev.pop();
		    y = p[0];
		    x = p[1];
      		for k in xrange(4):
			    if (0 <= y + dy[k] < Vsize) and (0 <= x + dx[k] < Hsize):
				    if (lab[y + dy[k]][x + dx[k]] == '.' ):
					    stop = False;
                        g += polygon([[j,i], [j+1,i], [j+1, i+1],[j, i+1]], rgbcolor = (0,0,0))
                        glist += g
					    lab[y + dy[k]][x + dx[k]] = d + 1;
					    stackNext.append((y + dy[k], x + dx[k]));
	    d+=1;	
	    if ((stop == True) or (lab[exit[1]][exit[0]] != '.')):
		    break;
    if ((lab[exit[1]][exit[0]] != '.') and (lab[exit[1]][exit[0]] != '#')):
	     print('YES');
    else:
	    print('NO');



