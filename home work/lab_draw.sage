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



