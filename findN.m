function N = findN(guess)
N = guess;
f = @(x) exp(-400.*(x-0.5).^2);
xFine = linspace(0,1,10000);
tol = 0.01;
err = 1;
fVals = f(xFine);
while err > tol
    xCoarse = linspace(0,1,N+1);
    fCoarse = f(xCoarse);
    C2F = interp1(xCoarse,fCoarse,xFine,'linear');
    err = max(abs(C2F-fVals));
    N = N+1;
end
