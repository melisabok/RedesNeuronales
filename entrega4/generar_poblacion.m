function[Pop] = generar_poblacion(popsize, lchrom, numIntervalos)

Pop = zeros(lchrom, popsize);
for i=1:lchrom
    Pop(i,:) = round(numIntervalos*rand(1, popsize));
end

end