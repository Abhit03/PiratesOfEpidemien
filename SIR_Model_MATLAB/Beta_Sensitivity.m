ydata = [2000.0, 6000.0, 8000.0, 8000.0, 8000.0, 10000.0, 8000.0, 10000.0, 12000.0, 32000.0, 36000.0, 68000.0, 154000.0, 240000, 212000.0, 146000.0, 96000.0, 94000.0, 62000.0, 38000.0, 30000.0, 26000.0, 24000.0, 12000.0, 14000.0, 14000.0, 16000.0, 10000.0, 10000.0, 10000.0];
xdata = 0:7:203;

x = [1.8155e-08, 0.6259]
f = @(t, y) [-x(1)*y(1)*y(2); x(1)*y(1)*y(2) - x(2)*y(2)];
y0 = [40000000,2000];
sol = ode45(f,[0 210],y0); 
f0 = deval(sol,xdata,2);

x = [1.7655e-08, 0.6259]
f = @(t, y) [-x(1)*y(1)*y(2); x(1)*y(1)*y(2) - x(2)*y(2)];
y0 = [40000000,2000];
sol = ode45(f,[0 210],y0); 
f1 = deval(sol,xdata,2);

x = [1.7155e-08, 0.6259]
f = @(t, y) [-x(1)*y(1)*y(2); x(1)*y(1)*y(2) - x(2)*y(2)];
y0 = [40000000,2000];
sol = ode45(f,[0 210],y0); 
f2 = deval(sol,xdata,2);

x = [1.6655e-08, 0.6259]
f = @(t, y) [-x(1)*y(1)*y(2); x(1)*y(1)*y(2) - x(2)*y(2)];
y0 = [40000000,2000];
sol = ode45(f,[0 210],y0); 
f3 = deval(sol,xdata,2);

figure
plot(xdata, ydata, '-o', 'LineWidth', 2)
hold on
plot(xdata, f0)
plot(xdata, f1)
plot(xdata, f2, 'LineWidth', 2)
plot(xdata, f3)
legend('Data', 'beta = 1.81e-04', 'beta = 1.76e-06', 'beta = 1.71e-08(Best Fit)', 'beta = 1.66e-10')
title('Sensitivity to beta Value')
xlabel('Time in Days')
ylabel('Number of Infected')