function Y = validar_reglas(Pop, numintervalos)

[longregla, popsize] = size(Pop);

% validamos numeros negativos
indices = Pop < 0;
Pop(indices) = numintervalos;

% validamos numeros fuera de rango
indices = Pop > numintervalos;
Pop(indices) = 0;

% validamos reglas nulas
indices = all(Pop == 0, 1);
[reglas indices_reglas] = find(indices > 0);

% si hay reglas nulas
for i=1:length(indices_reglas)
    %busco un valor al azar
    valor = round((numintervalos-1)*rand()) + 1;
    %busco una variable de la regla al azar
    indice_valor = round((longregla-1)*rand()) + 1;
    %le asigno ese valor a la regla para que deje ser nula
    Pop(indice_valor, indices_reglas(i)) = valor; 
end

Y = Pop;

end