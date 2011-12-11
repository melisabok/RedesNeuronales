function[P] = seleccionar_estocastico(Fitness, totalPadres)

CantReglas = size(Fitness, 2);

TotalFitness = sum(Fitness)
Select = Fitness ./ TotalFitness
Copias = Select .* CantReglas
Enteros = fix(Copias)
Fracciones = Copias - Enteros

totalEnteros = sum(Enteros);
totalSobrantes = 0;
cantEnteros = totalPadres;

P = zeros(1, totalPadres);

%% Calculo cuando necesito obterner de los enteros y cuanto del sobrante
if totalEnteros < totalPadres
    totalSobrantes = totalPadres - totalEnteros;
    cantEnteros = totalEnteros;
end

%% Obtengo los enteros
indices = find(Enteros > 0);
i = 1;
j = 1;

while (i <= length(indices)) && (j <= cantEnteros)
    parteEntera = Enteros(indices(i));
    k = 1;
    while (k <= parteEntera) && (j <= cantEnteros)
        P(j) = indices(i);
        k = k + 1;
        j = j + 1;
    end
    i = i + 1;
end

%% Obtengo los sobrantes
for i=1:totalSobrantes
    P(j) = select(Fracciones);
    j = j + 1;
end

end