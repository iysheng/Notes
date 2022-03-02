#!/usr/bin/python
import numpy as np
import matplotlib
import matplotlib.pyplot as plt
from matplotlib import cm
from mpl_toolkits.mplot3d import Axes3D
from pylab import *
from matplotlib.ticker import LinearLocator, FormatStrFormatter

mpl.rcParams['font.sans-serif'] = ['Source Han Sans CN']
mpl.rcParams.update({"font.size":15})
fig = plt.figure(figsize=(5,5))
fig1 = plt.figure(figsize=(5,5))
ax = fig.add_subplot(111, projection='3d')

x3=[0,10,10,20,30,40,50,60,70,80,90,100,100,100,100,100,100,100,100,100,100,100,100,100]
y3=[35,36.9,40,45,46,47,48,49,50,51,52,53,54,55,56,67,58,59,60,61,62,63,64,65]
z3=[32.3,38.95,46.59,52.9,54,56.93,58.92,59.93,60.96,61.98,64.7,65.13,66.19,66.19,66.19,67.27,67.27,67.27,67.27,67.27,67.27,68.35,68.35,69.44]

print(len(x3), len(y3), len(z3))
ax.set_title("高温测试")
ax.plot(x3,y3,z3, c='red',marker='x',label="高温测试曲线")
ax.set_xlabel('x: 亮度等级')
ax.set_ylabel('y: 环境温度(摄氏度)')
ax.set_zlabel('z: 驱动板温度(摄氏度)')

new_x3=[x3[0], x3[23]]
new_y3=[y3[0], y3[23]]
new_z3=[z3[0], z3[23]]

for x, y, z in zip(new_x3, new_y3, new_z3):
    text = str(x) + ', ' + str(y) + ', ' + str(z)
    ax.text(x, y, z, text, zdir=(1, 1, 1), fontsize=15)

#ax_cold = fig.add_subplot(212, projection='3d')
#ax_cold.plot(x3,y3,z3,label='温度曲线')
#ax.plot_surface(x3,y3,z3,label='温度曲线', cmap=cm.coolwarm, linewidth=0, antialiased=False)
ax_cold = fig1.add_subplot(111)
ax_cold.set_xlabel('x: 亮度等级')
ax_cold.set_ylabel('y: 驱动板温度(摄氏度)')
xn3=[30,40,50,60,70,80,90,100]
yn3=[2.63,5.16,13.34,19.27,26.49,30.59,35.1,38.14]
ax_cold.set_title("-30 度低温测试")
ax_cold.plot(xn3, yn3, markerfacecolor='blue',marker='o',label="低温测试")
for a, b in zip(xn3, yn3):
    plt.text(a, b, (a,b),ha='center', va='bottom', fontsize=15)
plt.legend()
#ax_cold.plot_wireframe(xn3, yn3, zn3, rstride=10, cstride=10)
plt.show()
