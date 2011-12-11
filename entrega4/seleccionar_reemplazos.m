%% Seleccionar los peores individuos de la poblacion
%% Solo se seleccionan del 75% con peor fitness. 
%% Existen dos formas de elegirlos
%% conRuleta = 1: se selecciona mediante el metodo de la ruleta
%% conRuleta = 0: se selecciona el indice al azar
function[r1, r2] = seleccionar_reemplazos(Fitness, conRuleta)

    [Fitness_ordenado, Fitness_indices] = sort(Fitness, 2, 'ascend');
    
    maxIndex = round(0.75*length(Fitness_ordenado));
    if( conRuleta == 1)
    
        indice1 = select(Fitness_ordenado(1:maxIndex));
        indice2 = select(Fitness_ordenado(1:maxIndex));
    else
        
        indice1 = 1 + round(rand() * (maxIndex - 1));
        indice2 = 1 + round(rand() * (maxIndex - 1));
        
    end
    
    r1 = Fitness_indices(indice1);
    r2 = Fitness_indices(indice2);
    
end