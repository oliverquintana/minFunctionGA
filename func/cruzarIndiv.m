function Y = cruzarIndiv(indiv, metodoCruza)
    %% Cruza de Individuos
    % Se generan los descendientes de la población de entrada.
    % Entrada
    % - indiv: Población a cruzar.
    % - metodoCruza:
    %       1. Un corte
    %       2. Dos cortes
    %       3. Uniforme
    % Salida
    % Y: Poblaci�n descendiente de 'indiv'.
    %%
    [m,n] = size(indiv);
    Y = zeros(m,n);
    i = 1;

    if metodoCruza == 1
        % 1 Corte
        div = round(n/2);
        while i <= m
            Y(i,:) = [indiv(i, 1:div), indiv(i+1, div+1:n)];
            Y(i+1,:) = [indiv(i+1, 1:div), indiv(i, div+1:n)];
            i = i + 2;
        end

    elseif metodoCruza == 2
        % 2 Cortes
        div = round(n/2);
        while i <= m
            Y(i,:) = [indiv(i, 1:div), indiv(i+1, div+1:div*2), indiv(i, (div*2)+1:n)];
            Y(i+1,:) = [indiv(i+1, 1:div), indiv(i, div+1:div*2), indiv(i+1, (div*2)+1:n)];
            i = i + 2;
        end

    else
        % Uniforme
        h1 = zeros(1,n);
        h2 = zeros(1,n);
        while i <= m
            for k=1 : n
               z = randi(2);
               if z == 1
                   h1(1,k) = indiv(i,k);
                   h2(1,k) = indiv(i+1,k);
               else
                   h1(1,k) = indiv(i+1,k);
                   h2(1,k) = indiv(i,k);
               end
            end
            Y(i:i+1,:) = [h1; h2];
            i = i + 2;
        end

    end
end
