function[Pop] = generar_poblacion(popsize, lchrom)

Pop = zeros(lchrom, popsize);
for j=1:popsize
    for i=1:lchrom
        % solo al 20% le pongo  valores entre 1 y 10
        pGen = rand();
        if pGen <= 0.2
            Pop(i,j) = 1 + round(9 * rand());
        end
    end
end
end