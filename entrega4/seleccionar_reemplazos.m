function[r1, r2] = seleccionar_reemplazos(Fitness)

    [Fitness_ordenado, Fitness_indices] = sort(Fitness, 2, 'ascend');
    
    indice1 = select(Fitness_ordenado(1:(round(0.75*end))));
    indice2 = select(Fitness_ordenado(1:(round(0.75*end))));
    
    r1 = Fitness_indices(indice1);
    r2 = Fitness_indices(indice2);
    
end