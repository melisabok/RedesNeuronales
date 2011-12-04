%%
clc
clear all

delete('salida.csv');

lchrom  = 3;            % long. del cromosoma 
popsize = 10;           % tama?o de la poblacion 
pcross  = 1;         % probabilidad de crossover
pmutation = 0;       % probabilidad de mutacion
maxgen   = 2000;        % m?x. cant.de generaciones

%Armos la matriz datos
Datos = [2,2,2,1;
2,1,2,0;
3,2,2,1;
1,2,2,1;
1,2,1,0;
1,1,1,0;
3,1,1,1;
2,1,1,0;
2,2,1,1;
1,1,1,0;
2,2,1,1;
3,2,2,1;
1,1,1,0;
1,2,2,1];

% 1. Genero la poblacion con valores random. una matriz de 20x3 = popsizexlchrom
Pop = zeros(lchrom, popsize);

% Col 1 = Practica, Col 2 = Activ-Distancia, Col 3 = Activ-Presencial
Pop(1,:) = round(3*rand(1, popsize));
Pop(2,:) = round(2*rand(1, popsize));
Pop(3,:) = round(2*rand(1, popsize));

% 1. bis. Valido que las reglas sean validas, si no es asi las corrijo
Pop = validar_reglas(Pop);
Pop

% 2. Comienzo evaluando las reglas donde el consecuente es aprobado.
% calculo el soporte y la confianza para cada reglas
Soporte = calcular_soporte(Datos, Pop) %sobre aprobados
Confianza = calcular_confianza(Datos, Pop, 1)

% 3. Calculo medida aptitud, como el promedio entre el soporte y confianza.
% Puedo agregar la ponderacion por la longitud de la regla
Fitness = (Soporte + Confianza) ./ 2
dlmwrite('salida.csv',Pop,'delimiter','\t','-append');
dlmwrite('salida.csv',Soporte,'delimiter','\t','-append');
dlmwrite('salida.csv',Confianza,'delimiter','\t','-append');
dlmwrite('salida.csv',Fitness,'delimiter','\t','-append');

ite = 0;
ITE_MAX = 3;

while(ite < ITE_MAX)
    
    ite = ite + 1;
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


