from functools import reduce
import matplotlib.pyplot as plt

x_coord = [1.0, 5.0, 8.0, 10.0, 15.0]
y_coord = [1.0, -2.0, 6.0, 3.0, 2.0]

def lagrange_basis(x, idx, x_at):
    res_1=reduce(lambda x, y: x*y,[(x_at - j)/(x[idx] - j) for i,j in enumerate(x) if idx != i])  
    return res_1

def lagrange(x, y, x_at):
    res=sum([j*lagrange_basis(x, i, x_at) for i,j in enumerate(y)])
    return res
	
grid_x = [i for i in range(17)]
y_eval = [lagrange(x_coord, y_coord, i) for i in grid_x]

plt.plot(grid_x,y_eval)
plt.savefig('graficus_maximus.png')
plt.close()
print(grid_x)
print(y_eval)
