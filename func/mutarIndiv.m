function indiv = mutarIndiv(indiv, index, corte)
    %% Mutar Individuos
    % Los individuos de entrada son mutados reemplazando una subcadena por
    % otra generada aleatoriamente.
    % Entrada:
    % - indiv: Individuos a mutar.
    % - index: �ndice desde el cual se considerar� la cadena a reemplazar.
    % - corte: Tama�o de la subcadena.
    % Salida:
    % - indiv: Individuos mutados.
    %%
    [m,~] = size(indiv);

    for i=1 : m
        string = randi(2, 1, corte) - 1;
        indiv(i,index:index+corte-1) = string;
    end

end
