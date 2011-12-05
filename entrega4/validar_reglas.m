function Y = validar_reglas(Pop, numintervalos)

popsize = size(Pop, 2);

% validamos numeros negativos
indices = Pop < 0;
Pop(indices) = numintervalos;

% validamos numeros fuera de rango
indices = Pop > numintervalos;
Pop(indices) = 0;

% validamos reglas nulas
indices = all(Pop == 0, 2);
Pop(indices, :) = round(numintervalos*rand(sum(indices), popsize));

Y = Pop;

end