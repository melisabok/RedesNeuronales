function[M] = obtener_mejores_reglas(Pop, Fitness, Soporte, Confianza, cant)

[sizeRegla, cantReglas] = size(Pop);
[FitnessOrdenado, FitnessIndices] = sort(Fitness, 'descend');

row = 1;
index = 1;
reglaAnt = Pop(:,FitnessIndices(index)); 
M(row, 1:sizeRegla) = reglaAnt'; 
M(row, sizeRegla + 1) = Fitness(FitnessIndices(index));
M(row, sizeRegla + 2) = Soporte(FitnessIndices(index));
M(row, sizeRegla + 3) = Confianza(FitnessIndices(index));

while row < cant
    
    index = index + 1;
    if isequal(reglaAnt, Pop(:,FitnessIndices(index))) == 0
        row = row + 1;
        reglaAnt = Pop(:,FitnessIndices(index)); 
        M(row, 1:sizeRegla) = reglaAnt'; 
        M(row, sizeRegla + 1) = Fitness(FitnessIndices(index));
        M(row, sizeRegla + 2) = Soporte(FitnessIndices(index));
        M(row, sizeRegla + 3) = Confianza(FitnessIndices(index));
    end
    
end
end