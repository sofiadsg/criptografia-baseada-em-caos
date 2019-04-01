%% Creation of time and state vectors and declaration of constants and initial conditions
tFinal = 20;
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
y(1) = 2;
z = zeros(1,numberOfPoints);
z(1) = .5;
u = zeros(1,numberOfPoints);
u(1) = .5;

%% Calculation of amplitude scaled system state vectors
for i = 1:(numberOfPoints)
    x(i+1) = x(i)+(z(i) + (y(i) - a)*x(i) + u(i))*dt;	
    y(i+1) = y(i)+(1 - b*y(i) - x(i)^2)*dt;
    z(i+1) = z(i)+(-x(i) - c*z(i))*dt;
    u(i+1) = u(i)+(-d*x(i)*y(i) - k*u(i))*dt;
end

%% State vectors plot
plot(time,x,'LineWidth',2)
grid on
title('Evolução de X com o tempo')
ylabel('Variável x')
xlabel('Tempo')
saveas(gcf,'plotx.png')

figure, plot(time,y,'r','LineWidth',2)
grid on
title('Evolução de Y com o tempo')
ylabel('Variável y')
xlabel('Tempo')
saveas(gcf,'ploty.png')

figure, plot(time,z,'g','LineWidth',2)
grid on
title('Evolução de Z com o tempo')
ylabel('Variável z')
xlabel('Tempo')
saveas(gcf,'plotz.png')

figure, plot(time,u,'m','LineWidth',2)
grid on
title('Evolução de U com o tempo')
ylabel('Variável u')
xlabel('Tempo')
saveas(gcf,'plotu.png')