d = {0: [1,4,5], 1: [2,6], 2: [3,7], 3: [4,8], 4: [9], \
      5: [7, 8], 6: [8,9], 7: [9]}
G = Graph(d); 

#G.plot().show()    # or G.show()

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

GIFka = bfs(G)
GIFka.show(delay=80)
