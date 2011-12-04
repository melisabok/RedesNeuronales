function Y = validar_reglas(Pop, numintervalos)

indices = Pop < 0;
Pop(indices) = round(numintervalos * rand(1, length(Pop(indices))));

indices = Pop > numintervalos;
Pop(indices) = round(numintervalos * rand(1, length(Pop(indices))));

Y = Pop;

end