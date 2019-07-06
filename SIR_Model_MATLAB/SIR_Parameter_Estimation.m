%MODEL PARAMETERS - INTIAL GUESS
x0 = [0, 0];

%Nelder–Mead method for Optimisation
options = optimset('Display','iter','PlotFcns',@optimplotfval);
[x,fval,exitflag,output] = fminsearch(@myfun, x0, options);


%FUNCTION FOR NON LINEAR LEAST SQUARE FIT
function F = myfun(x, xdata)
ydata = [2000.0, 6000.0, 8000.0, 8000.0, 8000.0, 10000.0, 8000.0, 10000.0, 12000.0, 32000.0, 36000.0, 68000.0, 154000.0, 240000, 212000.0, 146000.0, 96000.0, 94000.0, 62000.0, 38000.0, 30000.0, 26000.0, 24000.0, 12000.0, 14000.0, 14000.0, 16000.0, 10000.0, 10000.0, 10000.0];
xdata = 0:7:203;
y0 = [40000000,2000];
f = @(t, y) [-x(1)*y(1)*y(2); x(1)*y(1)*y(2) - x(2)*y(2)];
sol = ode45(f,[0 210],y0);     % Runge-Kutta 4th/5th order ODE solver
f2 = deval(sol,xdata,2);
F = sum((f2 - ydata).^2);
end


