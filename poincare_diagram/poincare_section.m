tFinal = 100000;
dt = 0.001;
numberOfPoints = tFinal/dt;
time = 0:dt:tFinal;

a = .9;
b = .2;
c = 1.5;
d = .2;
k = .17;

x = zeros(1,numberOfPoints);
x(1) = 1;
y = zeros(1,numberOfPoints);
y(1) = 3;
z = zeros(1,numberOfPoints);
z(1) = 2;

for i = 1:(numberOfPoints)
    x(i+1) = x(i)+(z(i) + (y(i) - a)*x(i))*dt;	
    y(i+1) = y(i)+(1 - b*y(i) - x(i)^2)*dt;
    z(i+1) = z(i)+(-x(i) - c*z(i))*dt;
end
x_diag = [];
z_diag = [];
for i = 1:numberOfPoints
    if y(i) > 0.4-2*dt && y(i)< 0.4+2*dt
      x_diag = [x_diag x(i)];
      z_diag = [z_diag z(i)];
    end
end
