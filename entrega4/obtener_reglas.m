function[Pop, Fitness] = obtener_reglas(Datos, lchrom, popsize, pcross, pmutation, numintervalos, clase, MAX_GEN)

% 1. Genero la poblacion con valores random. una matriz de 20x3 = popsizexlchrom
Pop = generar_poblacion(popsize, lchrom, numintervalos);

% 1. bis. Valido que las reglas sean validas, si no es asi las corrijo
Pop = validar_reglas(Pop, numintervalos);


% 2. Comienzo evaluando las reglas donde el consecuente es aprobado.
% calculo el soporte y la confianza para cada reglas
Soporte = calcular_soporte(Datos, Pop, numintervalos); %sobre aprobados
Confianza = calcular_confianza(Datos, Pop, clase, numintervalos);

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
    %[Fitness_ordenado, Fitness_indices] = sort(Fitness, 2, 'descend');
    %regla1 = Pop(:, Fitness_indices(1));
    %regla2 = Pop(:, Fitness_indices(2));
    y1 = select(Fitness);
    y2 = select(Fitness);  
    while(y2 == y1)
        y2 = y2 + 1;
    end
    %   
%regla1
%     regla2

    % 4. Cruzar y mutar las reglas
    [h1, h2] = cruzar_y_mutar(Pop, y1, y2, pcross, pmutation);

%     h1
%     h2

    % 5. Elijo las 2 peores reglas
    [Fitness_ordenado, Fitness_indices] = sort(Fitness, 2, 'ascend');
    peor1 = select(Fitness_ordenado(1:(round(0.75*end))));
    peor2 = select(Fitness_ordenado(1:(round(0.75*end))));
    
    if(peor2 == peor1)
        peor2 = peor2 + 1;
    end

%     peor1
%     peor2

    Pop(:, Fitness_indices(peor1)) = h1;
    Pop(:, Fitness_indices(peor2)) = h2;



%     Pop'
    Soporte = calcular_soporte(Datos, Pop, numintervalos);
    Confianza = calcular_confianza(Datos, Pop, clase, numintervalos);
    Fitness = (Soporte + Confianza) ./ 2

    % 6. Valido las reglas
    Pop = validar_reglas(Pop, numintervalos);
    
    dlmwrite('salida.csv',Pop,'delimiter','\t','-append');
    dlmwrite('salida.csv',Soporte,'delimiter','\t','-append');
    dlmwrite('salida.csv',Confianza,'delimiter','\t','-append');
    dlmwrite('salida.csv',Fitness,'delimiter','\t','-append');
    
end

end


