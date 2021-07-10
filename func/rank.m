function [indiv, promAptitud, bestApt] = rank(indiv, cond)
    %% Selecci�n Rank
    % Realiza la selecci�n de los individuos en parejas ordenadas de mayor a menor aptitud.
    % Entrada:
    % - indiv: Poblaci�n de individuos.
    % - cond: Condiciones para los m�todos de cruza, mutaci�n y criterios
    %         de paro.
    % Salida:
    % - indiv: Poblaci�n obtenida despu�s del corrimiento del algoritmo
    %          gen�tico.
    % - promAptitud: Promedio de aptitud de la poblaci�n en cada
    %                generaci�n.
    % - bestApt: Aptitud del mejor individuo de la poblaci�n en cada
    %            generaci�n.
    %% Funci�n f(x1,x2) a minimizar
    syms f(x1,x2)
    f(x1,x2) = 10 - exp(-(x1^2 + (3*x2^2)));

    %% Condiciones
    maxGen = cond(1);
    paro = cond(2);
    cruza = cond(3);
    mutar = cond(4);
    genApt = 40;

    %% Precargar Variables
    [m,n] = size(indiv);
    apt = evaluarAptitud(indiv, f);
    promAptitud(1,1) = mean(apt);
    bestApt(1,1) = 1 / max(promAptitud);
    i = 1;

    %% Algoritmo Gen�tico
    while true

        indiv = ordenarAptitud(apt, indiv);

        %% Cruza

        if cruza == 1
            cruzaInd = cruzarIndiv(indiv, 1);
        elseif cruza == 2
            cruzaInd = cruzarIndiv(indiv, 2);
        elseif cruza == 3
            cruzaIndx1 = cruzarIndiv(indiv(:,1:round(n/2)), 3);
            cruzaIndx2 = cruzarIndiv(indiv(:,round(n/2)+1:n), 3);
            cruzaInd = [cruzaIndx1, cruzaIndx2];
        end

        %% Mutar Individuos
        if mutar == 1
            porcMutar = 10;
            porc = round(randi(porcMutar) * 0.01 * m);
            corte = randi(round(n/3)) + round(n/3);
            index = randi(n - corte);
            indiv(m-porc:m,:) = mutarIndiv(indiv(m-porc:m,:), index, corte);
        end

        %% Evaluar Individuos
        nIndiv = [indiv; cruzaInd];
        apt = evaluarAptitud(nIndiv, f);
        nIndiv = ordenarAptitud(apt, nIndiv);
        indiv = nIndiv(1:m, :);

        apt = evaluarAptitud(indiv,f);
        promAptitud(i,1) = mean(apt);
        bestApt(i,1) = apt(1,1);

        %% Criterios de Paro

        if paro == 1 && i >= maxGen
            break
        elseif paro == 2 && i > genApt
            if round(mean(bestApt(i-genApt:i)),14) == round(bestApt(i),14)
                break
            end
        end

        i = i + 1;
        clc
        disp('Generaci�n: ')
        disp(i)

    end

end
