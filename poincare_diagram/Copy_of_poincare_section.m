tFinal = 0000;
dt = 0.001;
numberOfPoints = tFinal/dt;
time = 0:dt:tFinal;

a = 10;
b = 40;
c = 2.5;
h = 4;
k = 1;

x = zeros(1,numberOfPoints);
x(1) = 1;
y = zeros(1,numberOfPoints);
y(1) = 3;
z = zeros(1,numberOfPoints);
z(1) = 2;

for i = 1:(numberOfPoints)
    x(i+1) = x(i)+((y(i) - x(i))*a)*dt;	
    y(i+1) = y(i)+(b*x(i) - k*x(i)*z(i))*dt;
    z(i+1) = z(i)+(-c*z(i)+h*x(i)^2)*dt;
end
x_diag = [];
y_diag = [];
for i = 1:numberOfPoints
    if z(i)<60+dt && z(i)>60-dt
      x_diag = [x_diag x(i)];
      y_diag = [y_diag y(i)];
    end
end
