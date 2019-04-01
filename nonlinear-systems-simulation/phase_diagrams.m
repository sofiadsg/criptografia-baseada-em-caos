%% Creation of time and state vectors and declaration of constants and initial conditions
tFinal = 100;
dt = 0.001;
numberOfPoints = tFinal/dt;
time = 0:dt:tFinal;

a = .9;
b = .2;
c = 1.5;
d = .2;
k = .17;

x = zeros(10,numberOfPoints);
y = zeros(10,numberOfPoints);
z = zeros(10,numberOfPoints);

for m=1:10
    x(m,1) = -4.83 + .83*m;
    for j = 1:10
        y(j,1) = 0.4*j;
        for k = 1:10
            z(k,1) = -2.5 + 0.5*k;
            for i = 1:(numberOfPoints)
                x(m,i+1) = x(m,i)+(z(k,i) + (y(j,i) - a)*x(m,i))*dt;	
                y(j,i+1) = y(j,i)+(1 - b*y(j,i) - x(m,i)^2)*dt;
                z(k,i+1) = z(k,i)+(-x(m,i) - c*z(k,i))*dt;
            end
        end
    end
end

hold on
for i = 1:10
    plot(x(i,1:numberOfPoints),y(i,1:numberOfPoints))
    title('Evolução da variável y pela variável x')
    xlabel('x')
    ylabel('y')
end
hold off
saveas(gcf,'xy.png')
figure
hold on
for i = 1:10
    plot(x(i,1:numberOfPoints),z(i,1:numberOfPoints))
    title('Evolução da variável z pela variável x')
    xlabel('x')
    ylabel('z')
end
hold off
saveas(gcf,'xz.png')
figure
hold on
for i = 1:10
    plot(y(i,1:numberOfPoints),z(i,1:numberOfPoints))
    title('Evolução da variável z pela variável y')
    xlabel('y')
    ylabel('z')
end
hold off
saveas(gcf,'yz.png')
figure
hold on
for i = 1:10
    plot3(x(i,1:numberOfPoints),y(i,1:numberOfPoints),z(i,1:numberOfPoints))
    title('Evolução das três variáveis de estado')
end
saveas(gcf,'xyz.png')