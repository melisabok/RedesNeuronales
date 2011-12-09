function y = select_ruleta(Fitness)

% dado un vector fila con los fitness de los individuos de la poblacion
% selecciona utilizando SELECCION PROPORCIONAL
cuantos = length(Fitness);
sumFitness = sum(Fitness);
% si el sumFitness es cero entonces devuelvo una posicion al azar
if (sumFitness == 0)
    j = round(rand * (cuantos - 1)) + 1;
else

    aleatorio = rand * sumFitness;  %posicion dentro de la ruleta

    %buscando el slot correspondiente
    suma = Fitness(1);
    j = 1;
    while (suma < aleatorio) & (j<cuantos),
        j = j + 1;
        suma = suma + Fitness(j);
    end
end


%retorna el individuo elegido
y = j;
