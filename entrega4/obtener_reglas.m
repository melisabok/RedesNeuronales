function[Pop, Fitness, Soporte, Confianza] = obtener_reglas(Datos, lchrom, popsize, pcross, pmutation, numintervalos, clase, MAX_GEN, conSobranteEstocastico, conTorneo)

CantCols = size(Datos, 2);
Clase = Datos(:, CantCols);
Datos = discretizar(Datos(:, 1:CantCols-1), numintervalos);
prob = 0.7;

% 1. Genero la poblacion con valores random. una matriz de 20x3 = popsizexlchrom
Pop = generar_poblacion(popsize, lchrom);
Pop = discretizar(Pop, numintervalos);

% 2. Valido que las reglas sean validas, si no es asi las corrijo
Pop = validar_reglas(Pop, numintervalos);

% 3. Calculo medida aptitud, como el promedio entre el soporte y confianza.
% Puedo agregar la ponderacion por la longitud de la regla
[Soporte, Confianza, Fitness] = calcular_fitness(Datos, Pop, Clase, clase);

gen = 0;
%max_fitness = 0.6;
while(gen < MAX_GEN)% && max(Fitness) < max_fitness
    
    gen = gen + 1;

    
    % 4. Elijo las reglas que mayor fitness tienen, ordeno por fitness
    % descendente y elijo las dos primeras
    [p1, p2] = seleccionar_padres(Fitness, conSobranteEstocastico);
    
    % 4. Cruzar y mutar las reglas
    [h1, h2] = cruzar_y_mutar(Pop, p1, p2, pcross, pmutation);
    
    % 5. Elijo los reemplazos
    [r1, r2] = seleccionar_reemplazos(Fitness, 1);
    if conTorneo == 1
        Hijos = [h1, h2];
        Hijos = validar_reglas(Hijos, numintervalos);
        [soporte, confianza, fitness] = calcular_fitness(Datos, Hijos, Clase, clase);

        h1 = jugar_torneo(prob, Hijos(1), fitness(1), Pop(:, r1), Fitness(r1));
        h2 = jugar_torneo(prob, Hijos(2), fitness(2), Pop(:, r2), Fitness(r2));
    end
    
    % 6. Reemplazo los valores
    Pop(:, r1) = h1;
    Pop(:, r2) = h2;
    

    % 7. Valido y recalculo
    Pop = validar_reglas(Pop, numintervalos);
    [Soporte, Confianza, Fitness] = calcular_fitness(Datos, Pop, Clase, clase)
    

end
%gen
end


