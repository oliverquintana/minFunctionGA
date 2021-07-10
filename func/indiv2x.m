function x = indiv2x(indiv, inter)
    %% Individuos binarios a decimales
    % Convierte los cromosomas binarios a valores reales dentro del
    % intervalo especificado.
    % Entrada
    % - indiv: Poblaci�n a convertir.
    % - inter: Intervalo para la conversi�n (inter = k para el intervalo
    %          [-k, k]).
    % Salida:
    % - x: Matriz de mxn donde m es el n�mero de individuos y n corresponde
    %      al n�mero de variables, siendo estas x1 y x2.
    %%
    [~,n] = size(indiv);
    index = round(n/2);

    x1 = indiv(:,1:index);
    x2 = indiv(:,index+1:n);

    x1 = bi2de(x1);
    x2 = bi2de(x2);

    k = (2^round(n/2)) / 2;
    x1 = (x1 - k)*inter ./ (k);
    x2 = (x2 - k)*inter ./ (k);

    x = [x1, x2];

end
