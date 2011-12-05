function [confianza] = calcular_confianza( Datos, Reglas, clase, numintervalos)

[CantRows, CantCols] = size(Datos);
CantReglas = length(Reglas);

soporte = zeros(1, CantReglas);
correctos = zeros(1, CantReglas);

for j=1:CantReglas
    for i=1:CantRows
        esRegla = all(discretizar(Datos(i,1:CantCols-1), numintervalos) == Reglas(:,j)',2);
        if esRegla == 1
            soporte(1,j) = soporte(1,j) + 1;
            correctos(1,j) = correctos(1,j) + (Datos(i,CantCols) == clase);
        end
    end
end

confianza = correctos ./ soporte;
confianza(isnan(confianza))=0;
end
