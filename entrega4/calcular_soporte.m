function [soporte] = calcular_soporte(Datos, Reglas, numintervalos)

[CantRows, CantCols] = size(Datos);
CantReglas = length(Reglas);

soporte = zeros(1, CantReglas);

for j=1:CantReglas
    for i=1:CantRows
        soporte(1,j) = soporte(1,j) + all(discretizar(Datos(i,1:CantCols-1), numintervalos) == Reglas(:,j)',2);
    end
end

soporte = soporte / CantRows;
end