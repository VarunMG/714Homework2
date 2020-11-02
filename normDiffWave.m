function normVal = normDiffWave(xCoarse,yCoarse,xFine,yFine,uCoarse,uFine)
[XCoarse,YCoarse] = meshgrid(xCoarse,yCoarse);
[XFine,YFine] = meshgrid(xFine,yFine);
fineLast = uFine(:,:,end);
coarseLast = uCoarse(:,:,end);
interped = interp2(XCoarse,YCoarse,coarseLast,XFine,YFine);
normVal = max(max(abs(interped-fineLast)));
end




