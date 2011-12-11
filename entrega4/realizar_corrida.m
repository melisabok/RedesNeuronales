function[] = realizar_corrida(Datos, clase, numintervalos, conSobranteEstocastico, conTorneo)

lchrom  = 9;            % long. del cromosoma 
popsize = 70;           % tama?o de la poblacion 
pcross  = 0.65;         % probabilidad de crossover
pmutation = 0.05;       % probabilidad de mutacion
maxgen   = 100;        % m?x. cant.de generaciones

[Pop, Fitness, Soporte, Confianza] = obtener_reglas(Datos, lchrom, popsize, pcross, pmutation, numintervalos, clase, maxgen, conSobranteEstocastico, conTorneo);

M = obtener_mejores_reglas(Pop, Fitness, Soporte, Confianza, 2);
R1 = [clase numintervalos conSobranteEstocastico conTorneo M(1,:)];
R2 = [clase numintervalos conSobranteEstocastico conTorneo M(2,:)];
dlmwrite('resultado.csv',[R1;R2],'delimiter','\t','-append');


end

