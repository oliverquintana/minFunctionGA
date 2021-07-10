close all
clear
clc
addpath('func/')

%% Función a minimizar
syms f(x1,x2)
f(x1,x2) = 10 - exp(-(x1^2 + (3*x2^2)));

%% Generar Población
% Individuos de 16 genes. 8: x1, 8: x2
gen   = 8;
indiv = 100;
x1    = randi(2, indiv, gen) - 1;
x2    = randi(2, indiv, gen) - 1;
pob   = [x1, x2];

%% Condiciones
mutar  = 1;  % Mutación 1 - Sí
maxGen = 4; % Generaciones máximas a ejecutar el AG.
paro   = 1;  % Condicón de paro. 1 - Generaciones máximas 2 - Mejora en aptitud
cruza  = 3;  % 1- Un corte 2 - Dos cortes 3 - Uniforme
cond   = [maxGen, paro, cruza, mutar];

%% AG
[indiv, promAptitud, bestApt] = rank(pob, cond);

%% Función a minimizar
figure,ezsurf(f, [-1,1,-1,1])

%% Resultados de aptitud
figure,
plot(promAptitud, 'linewidth', 2)
hold on
plot(bestApt, 'linewidth', 2)
title('Aptitud de la Población')
xlabel('Generaciones')
ylabel('Aptitud')
legend('Promedio población', 'Mejor individuo')
grid on

%% Individuos en el espacio de búsqueda
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
title('Población inicial en el Espacio de Búsqueda')
xlabel('x2')
ylabel('x1')
hold on
grid on
plot(xi(:,1),xi(:,2), 'x')
hold off

%% Poblaci�n final
xf = indiv2x(indiv,1);
figure,contour(x1,x2,z)
title('Población final en el Espacio de Búsqueda')
xlabel('x2')
ylabel('x1')
hold on
grid on
plot(xf(:,1),xf(:,2), 'x')
hold off
%%
disp('Mejor Aptitud:')
disp(double(f(xf(1,1),xf(1,2))))
