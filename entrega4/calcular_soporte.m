function [soporte] = calcular_soporte(Datos, Reglas)

[CantRows, CantCols] = size(Datos);
CantReglas = length(Reglas);

soporte = zeros(1, CantReglas);

for j=1:CantReglas
    for i=1:CantRows
        esIgual = 1;
        k = 1;
        while esIgual && k <= CantCols
            if (Reglas(k, j) > 0) && (Reglas(k, j) ~= Datos(i,k))
                esIgual = 0;
            end
            k = k + 1;
        end
        if (esIgual == 1)
            soporte(1,j) = soporte(1,j) + 1;
        end
    end
end

soporte = soporte / CantRows;
end