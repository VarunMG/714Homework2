function [tIters,xVals,yVals,u] = waveSolver(N)
h = 1/N;
dt = 0.20*h;
%dt = 0.001;
T = 1;
tVals = 0:dt:T;
[~,tIters] = size(tVals);
xVals = 0:h:1;
yVals = 0:h:1;
f = @(x) exp(-400*(x-0.5).^2);
u0 = @(x,y) 0;
v0 = @(x,y) f(x).*f(y);
u = zeros(N+1,N+1,tIters);
[X,Y] = meshgrid(xVals,yVals);
u(:,:,1) = u0(X,Y); %initial wave shape
u(2:(end-1),2:(end-1),2) = u(2:(end-1),2:(end-1),1) + ...
    dt*v0(X(2:(end-1),2:(end-1)),Y(2:(end-1),2:(end-1))); %uses initial velocity to find second time step
e = ones(N-1,1);
Dirichlet1DLap = spdiags([e,-2*e,e], -1:1, N-1,N-1);
Id = speye(N-1);
A = kron(Id,Dirichlet1DLap) + kron(Dirichlet1DLap,Id);
r = (dt*dt)/(h*h);
B = r*A+2*speye((N-1)*(N-1));
for i=3:tIters
    uPrev = reshape(u(2:(end-1),2:(end-1),i-1).',(N-1)*(N-1),1);
    uPrevPrev = reshape(u(2:(end-1),2:(end-1),i-2).',(N-1)*(N-1),1);
    uNew = B*uPrev - uPrevPrev;
    u(2:(end-1),2:(end-1),i) = reshape(uNew,N-1,N-1).';
end
end