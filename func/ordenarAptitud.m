function indivOrd = ordenarAptitud(aptitud, indiv)
    %% Orden por Aptitud
    % La poblaci�n es ordenada de manera descendiente de acuerdo al �ndice
    % de aptitud de cada individuo.
    % Entrada
    % - aptitud: �ndice de aptitud de cada individuo en la poblaci�n.
    % - indiv: Poblaci�n de individuos a ordenar.
    % Salida
    % - indivOrd: Poblaci�n ordenada.
    %%
    [m,n] = size(indiv);
    indivOrd = zeros(m,n);
    [~, index] = sort(aptitud,'ascend');

    for i=1 : m
        indivOrd(i,:) = indiv(index(i),:);
    end


end
