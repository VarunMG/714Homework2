function val = visualizeWave(tIters,xVals,yVals,u)
[X,Y] = meshgrid(xVals,yVals);
maxZ = max(max(abs(u(:,:))));
for i=1:tIters
    s = surf(X,Y,u(:,:,i));
    zlim([-maxZ,maxZ])
    s.EdgeColor = 'none';
    pause(0.001)
end
end