%% Creation of time and state vectors and declaration of constants and initial conditions for the time scaled function
% In order to perform time scaling, it is necessary to multiply the right
% side of the equation by the scaling factor
scalingFactor = 0.1;
tFinal = 20*scalingFactor;
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

%% Calculation of system state vectors
for i = 1:(numberOfPoints)
    x(i+1) = x(i)+(z(i) + (y(i) - a)*x(i) + u(i))*dt/scalingFactor;	
    y(i+1) = y(i)+(1 - b*y(i) - x(i)^2)*dt/scalingFactor;
    z(i+1) = z(i)+(-x(i) - c*z(i))*dt/scalingFactor;
    u(i+1) = u(i)+(-d*x(i)*y(i) - k*u(i))*dt/scalingFactor;
end

%% State vectors plot
plot(time,x,'LineWidth',2)
grid on
title('Evolução de X com o tempo')
ylabel('Variável x')
xlabel('Tempo')
saveas(gcf,'plotx_timescaled.png')

figure, plot(time,y,'r','LineWidth',2)
grid on
title('Evolução de Y com o tempo')
ylabel('Variável y')
xlabel('Tempo')
saveas(gcf,'ploty_timescaled.png')

figure, plot(time,z,'g','LineWidth',2)
grid on
title('Evolução de Z com o tempo')
ylabel('Variável z')
xlabel('Tempo')
saveas(gcf,'plotz_timescaled.png')

figure, plot(time,u,'m','LineWidth',2)
grid on
title('Evolução de U com o tempo')
ylabel('Variável u')
xlabel('Tempo')
saveas(gcf,'plotu_timescaled.png')