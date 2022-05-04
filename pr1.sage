var('A')
y(x) = x^3-3*x^2
D=diff(y(x),x)
U=solve(D==0,x)
A=len(U)
v = [(U[0].rhs(), y(U[0].rhs()))]
u = [(U[0].rhs(), y(U[0].rhs()))]
for i in range(A-1):
    v.extend( [(U[i+1].rhs(),y(U[i+1].rhs()))] )
    u.extend( [(U[i+1].rhs(),0)] )
show(plot(y(x),(x,-1,3),legend_label='function $x^3-x^2$')+points(v,color='red',pointsize=30,legend_label='stationary points')+line([u[1],v[1]],color='grey',linestyle=':'))
