import warnings
warnings.filterwarnings("ignore", category=DeprecationWarning)
S2 = Manifold(2, 'S^2', latex_name=r'\mathbb{S}^2', start_index=1)
spher.<th,ph> = S2.chart(r'th:[0,pi]:\theta ph:[0,2*pi]:periodic:\phi')
E3.<X,Y,Z> = EuclideanSpace()
cartesian = E3.cartesian_coordinates()
Phi = S2.diff_map(E3, (sin(th)*cos(ph), 
                       sin(th)*sin(ph),
                       cos(th)), 
                  name='Phi', latex_name=r'\Phi')

stereoN.<x,y> = S2.chart()
spher_to_stereoN = spher.transition_map(stereoN,(sin(th)*cos(ph)/(1-cos(th)),sin(th)*sin(ph)/(1-cos(th))))
N = S2((0, 0), chart=spher, name='N')
sph_plot = spher.plot(chart=cartesian, mapping=Phi, number_values=11,color='grey', label_axes=False)
S = S2((0, 0), chart=stereoN, name='S')
R.<t> = RealLine() 
var('gg')
ind=[1,2,3,4,5,6,7,8,9,10]
c=[0,1,2,3,4,5,6,7,8,9]
c_plot=[0,1,2,3,4,5,6,7,8,9]
for j in ind:
    c[j-1] = S2.curve({spher: [2*atan(exp(-t/10)), t]}, (t, -oo, +oo), name='c')
    c[j-1].plot(chart=stereoN, aspect_ratio=1, prange=(-20, 8), plot_points=200,color='blue', thickness=2)
    c_plot[j-1] = c[j-1].plot(chart=cartesian, mapping=Phi, max_range=j, plot_points=200,thickness=3) + sph_plot
a = animate(c_plot,figsize=10)
a.show(delay=300, iterations=0)
