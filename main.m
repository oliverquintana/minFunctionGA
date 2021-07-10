close all
clear
clc
addpath('func/')

%% Funci�n a minimizar
syms f(x1,x2)
f(x1,x2) = 10 - exp(-(x1^2 + (3*x2^2)));

%% Generar Poblaci�n
% Individuos de 16 genes. 8: x1, 8: x2
gen   = 8;
indiv = 100;
x1    = randi(2, indiv, gen) - 1;
x2    = randi(2, indiv, gen) - 1;
pob   = [x1, x2];

%% Condiciones
mutar  = 1;  % Mutaci�n 1 - S�
maxGen = 4; % Generaciones m�ximas a ejecutar el AG.
paro   = 1;  % Condic�n de paro. 1 - Generaciones m�ximas 2 - Mejora en aptitud
cruza  = 3;  % 1- Un corte 2 - Dos cortes 3 - Uniforme
cond   = [maxGen, paro, cruza, mutar];

%% AG
[indiv, promAptitud, bestApt] = rank(pob, cond);

%% Funci�n a minimizar
figure,ezsurf(f, [-1,1,-1,1])

%% Resultados de aptitud
figure,
plot(promAptitud, 'linewidth', 2)
hold on
plot(bestApt, 'linewidth', 2)
title('Aptitud de la Poblaci�n')
xlabel('Generaciones')
ylabel('Aptitud')
legend('Promedio poblaci�n', 'Mejor individuo')
grid on

%% Individuos en el espacio de b�squeda
a = 1;
for x1=-1 : 0.01 : 1
    b = 1;
    for x2=-1 : 0.01 : 1
        z(a,b) = 10 - exp(-(x1^2 + (3*x2^2)));
        b = b + 1;
    end
    a = a + 1;
end

x1 = -1:0.01:1;
x2 = -1:0.01:1;

%% Poblaci�n inicial
xi = indiv2x(pob,1);
figure,contour(x1,x2,z)
title('Poblaci�n inicial en el Espacio de B�squeda')
xlabel('x2')
ylabel('x1')
hold on
grid on
plot(xi(:,1),xi(:,2), 'x')
hold off

%% Poblaci�n final
xf = indiv2x(indiv,1);
figure,contour(x1,x2,z)
title('Poblaci�n final en el Espacio de B�squeda')
xlabel('x2')
ylabel('x1')
hold on
grid on
plot(xf(:,1),xf(:,2), 'x')
hold off
%%
disp('Mejor Aptitud:')
disp(double(f(xf(1,1),xf(1,2))))
