function aptitud = evaluarAptitud(pob, f)
    %% Evaluar Aptitud
    % Eval�a el �ndice de aptitud de la poblaci�n de entrada con respecto a
    % una funci�n.
    % Entrada
    % - pob: Poblaci�n de entrada a evaluar.
    % - f: Funci�n de aptitud f(x1,x2).
    % Salida
    % - aptitud: Lista que contiene el valor de aptitud para cada individuo
    %   de la poblaci�n.
    %%
    [m,n] = size(pob);
    index = round(n/2);
    k = (2^round(n/2)) / 2;
    aptitud = zeros(m,1);

    for i=1 : m

        indiv = pob(i,:);

        x1 = (bi2de(indiv(1:index)) - k) / k;
        x2 = (bi2de(indiv(index+1:n)) - k) / k;

        aptitud(i,1) = double(f(x1,x2));

    end

end
