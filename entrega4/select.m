function y = select(Fitness)

% dado un vector fila con los fitness de los individuos de la poblacion
% selecciona utilizando SELECCION PROPORCIONAL
cuantos = length(Fitness);
sumFitness = sum(Fitness);
aleatorio = rand * sumFitness;  %posicion dentro de la ruleta

%buscando el slot correspondiente
suma = Fitness(1);
j = 1;
while (suma < aleatorio) & (j<cuantos),
    j = j + 1;
    suma = suma + Fitness(j);
end

%retorna el individuo elegido
y = j;
