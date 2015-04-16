filo = open("lab.txt", 'r')
listoflines = filo.readlines()

lab = [];

lab = lab + [list(line)[:-1] for line in listoflines];
print lab

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
					lab[y + dy[k]][x + dx[k]] = d + 1;
					stackNext.append((y + dy[k], x + dx[k]));
	d+=1;	
	if ((stop == True) or (lab[exit[1]][exit[0]] != '.')):
		break;
if ((lab[exit[1]][exit[0]] != '.') and (lab[exit[1]][exit[0]] != '#')):
	 print('YES');
else:
	print('NO');
