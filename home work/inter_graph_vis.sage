import random

@interact  
def interaction(seed = input_box(default=170, label="Seed", type=int), vNum = slider([5..50], default=9, label="Vertex Number",), dens = slider(0, 0.5, 0.05, default=0.2, label="Edges density")):
	random.seed(int(seed))
	d={}
	vList = [i for i in xrange(vNum)]
	s = set(vList)
	for v in vList:
		s = s #- set([v])
		incid_list = []
		for j in xrange(int(len(s)*dens)):
		    p = random.random()
		    if (p > dens):
		        el = random.choice(vList)
		        incid_list += [el]
		d[v] = incid_list
	print d
        G = Graph(d); 
        G.plot().show()
        bfs(G);
        GIFka = bfs(G)
        GIFka.show(delay=50)
        
        
def bfs(G):
	first = 0
	Nums = set([i for i in G.vertex_iterator()])
	RGBdict = {'#00FFFF' : [first], '#FF0000': [i for i in Nums], '#00FF00':[]}   
	glist = []
	g = G.plot(save_pos=True, layout='circular', vertex_colors=RGBdict)
	glist += [g]
	stack = [first]
	visited = []
	while len(stack) != 0:
		current = stack.pop(0)
		if current not in visited:
			RGBdict['#00FF00'].append(current)
			RGBdict['#FF0000'].remove(current)
			visited.append(current)
			connected = G.edges_incident(current)
			for i in connected:
				if i[1] not in visited:
					stack.append(i[1])
				if i[0] not in visited:
					stack.append(i[0])
			glist += [G.plot(save_pos=True, layout='circular', vertex_colors=RGBdict)]
	a = animate(glist)
	return a
