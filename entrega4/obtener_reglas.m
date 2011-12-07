function[Pop, Fitness] = obtener_reglas(Datos, lchrom, popsize, pcross, pmutation, numintervalos, clase, MAX_GEN)

CantCols = size(Datos, 2);
Clase = Datos(:, CantCols);
Datos = discretizar(Datos(:, 1:CantCols-1), numintervalos);

% 1. Genero la poblacion con valores random. una matriz de 20x3 = popsizexlchrom
Pop = generar_poblacion(popsize, lchrom, numintervalos);

% 2. Valido que las reglas sean validas, si no es asi las corrijo
Pop = validar_reglas(Pop, numintervalos);

gen = 0;
while(gen < MAX_GEN)
    
    gen = gen + 1;

    % 3. Calculo medida aptitud, como el promedio entre el soporte y confianza.
    % Puedo agregar la ponderacion por la longitud de la regla
    [Soporte, Confianza, Fitness] = calcular_fitness(Datos, Pop, Clase, clase)
    dlmwrite('salida.csv',Pop,'delimiter','\t','-append');
    dlmwrite('salida.csv',Soporte,'delimiter','\t','-append');
    dlmwrite('salida.csv',Confianza,'delimiter','\t','-append');
    dlmwrite('salida.csv',Fitness,'delimiter','\t','-append');
    
    % 4. Elijo las reglas que mayor fitness tienen, ordeno por fitness
    % descendente y elijo las dos primeras
    y1 = select(Fitness);
    y2 = select(Fitness);  
    while(y2 == y1)
        y2 = y2 + 1;
    end
    
    % 4. Cruzar y mutar las reglas
    [h1, h2] = cruzar_y_mutar(Pop, y1, y2, pcross, pmutation);

    % 5. Elijo las 2 peores reglas
    [Fitness_ordenado, Fitness_indices] = sort(Fitness, 2, 'ascend');
    peor1 = select(Fitness_ordenado(1:(round(0.75*end))));
    peor2 = select(Fitness_ordenado(1:(round(0.75*end))));
    
    if(peor2 == peor1)
        peor2 = peor2 + 1;
    end
    
    Pop(:, Fitness_indices(peor1)) = h1;
    Pop(:, Fitness_indices(peor2)) = h2;

    % 6. Valido las reglas
    Pop = validar_reglas(Pop, numintervalos);

end

end


