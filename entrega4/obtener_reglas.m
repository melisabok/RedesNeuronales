function[Pop] = obtener_reglas(Datos, lchrom, popsize, pcross, pmutation, numintervalos, clase, MAX_GEN)

% 1. Genero la poblacion con valores random. una matriz de 20x3 = popsizexlchrom
Pop = generar_poblacion(popsize, lchrom, numintervalos);

% 1. bis. Valido que las reglas sean validas, si no es asi las corrijo
Pop = validar_reglas(Pop, numintervalos);


% 2. Comienzo evaluando las reglas donde el consecuente es aprobado.
% calculo el soporte y la confianza para cada reglas
Soporte = calcular_soporte(Datos, Pop) %sobre aprobados
Confianza = calcular_confianza(Datos, Pop, clase)

% 3. Calculo medida aptitud, como el promedio entre el soporte y confianza.
% Puedo agregar la ponderacion por la longitud de la regla
Fitness = (Soporte + Confianza) ./ 2
dlmwrite('salida.csv',Pop,'delimiter','\t','-append');
dlmwrite('salida.csv',Soporte,'delimiter','\t','-append');
dlmwrite('salida.csv',Confianza,'delimiter','\t','-append');
dlmwrite('salida.csv',Fitness,'delimiter','\t','-append');

gen = 0;
while(gen < MAX_GEN)
    
    gen = gen + 1;
    
    % 4. Elijo las reglas que mayor fitness tienen, ordeno por fitness
    % descendente y elijo las dos primeras
    [Fitness_ordenado, Fitness_indices] = sort(Fitness, 2, 'descend');
    regla1 = Pop(:, Fitness_indices(1));
    regla2 = Pop(:, Fitness_indices(2));

    regla1
    regla2

    % 4. Cruzar y mutar las reglas
    [h1, h2] = cruzar_y_mutar(Pop,Fitness_indices(1), Fitness_indices(2), pcross, pmutation);

    h1
    h2

    % 5. Elijo las 2 peores reglas
    peor1 = Pop(:, Fitness_indices(popsize));
    peor2 = Pop(:, Fitness_indices(popsize - 1));

    peor1
    peor2

    Pop(:, Fitness_indices(popsize)) = h1;
    Pop(:, Fitness_indices(popsize - 1)) = h2;



    Pop'
    Soporte = calcular_soporte(Datos, Pop);
    Confianza = calcular_confianza(Datos, Pop, 1);
    Fitness = (Soporte + Confianza) ./ 2

    % 6. Valido las reglas
    Pop = validar_reglas(Pop);
    
    dlmwrite('salida.csv',Pop,'delimiter','\t','-append');
    dlmwrite('salida.csv',Soporte,'delimiter','\t','-append');
    dlmwrite('salida.csv',Confianza,'delimiter','\t','-append');
    dlmwrite('salida.csv',Fitness,'delimiter','\t','-append');
    
end

end


