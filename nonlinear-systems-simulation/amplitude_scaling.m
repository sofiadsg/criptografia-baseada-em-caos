%% Creation of time and state vectors and declaration of constants and initial conditions
% Since the gratest absolute value for amplitude of the non-scaled system
% is 3.15, that will be the scaling factor.
% Amplitude scaling is done by:
% 1. Dividing all the initial conditions by the scaling factor and
% 2. Multiplying all the non-linear terms and dividing the constants of the equation by
% the scaling factor
scalingFactor = 3.15;
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
x(1) = 1/scalingFactor;
y = zeros(1,numberOfPoints);
y(1) = 2/scalingFactor;
z = zeros(1,numberOfPoints);
z(1) = .5/scalingFactor;
u = zeros(1,numberOfPoints);
u(1) = .5/scalingFactor;

%% Calculation of scaled system state vectors
for i = 1:(numberOfPoints)
    x(i+1) = x(i)+(z(i) + (y(i)*scalingFactor - a)*x(i) + u(i))*dt;	
    y(i+1) = y(i)+(1/scalingFactor - b*y(i) - x(i)^2*scalingFactor)*dt;
    z(i+1) = z(i)+(-x(i) - c*z(i))*dt;
    u(i+1) = u(i)+(-d*x(i)*y(i)*scalingFactor - k*u(i))*dt;
end

%% State vectors plot
plot(time,x,'LineWidth',2)
grid on
title('Evolução de X com o tempo')
ylabel('Variável x')
xlabel('Tempo')
saveas(gcf,'plotx_ampscaled.png')

figure, plot(time,y,'r','LineWidth',2)
grid on
title('Evolução de Y com o tempo')
ylabel('Variável y')
xlabel('Tempo')
saveas(gcf,'ploty_ampscaled.png')

figure, plot(time,z,'g','LineWidth',2)
grid on
title('Evolução de Z com o tempo')
ylabel('Variável z')
xlabel('Tempo')
saveas(gcf,'plotz_ampscaled.png')

figure, plot(time,u,'m','LineWidth',2)
grid on
title('Evolução de U com o tempo')
ylabel('Variável u')
xlabel('Tempo')
saveas(gcf,'plotu_ampscaled.png')