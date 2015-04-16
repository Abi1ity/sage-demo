import random

def labyrinth_gen(N=15, M=15, seed=None):
    random.seed(seed)
    D = (-2,0), (0,2), (2,0), (0,-2)
    Map = {(i,j):2-(i%2|j%2) for i in xrange(N) for j in xrange(N)}
    Todo = [(N//2&-2,M//2&-2)]
    for x,y in Todo:
        Map[x,y]=0

    while Todo:
        x,y = Todo.pop(random.randrange(len(Todo)))
        Check = [(dx,dy) for dx,dy in D if 0<=x+dx<N and 0<=y+dy<N and Map[x+dx,y+dy]]
        if Check:
            dx,dy = random.choice(Check)
            Todo.extend([(x,y),(x+dx,y+dy)])
            Map[x+dx,y+dy]=Map[x+dx//2,y+dy//2]=0
    return Map
