function [confianza] = calcular_confianza( Datos, Reglas, Clase, numclase)

[CantRows, CantCols] = size(Datos);
CantReglas = length(Reglas);

soporte = zeros(1, CantReglas);
correctos = zeros(1, CantReglas);

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
            correctos(1,j) = correctos(1,j) + (Clase(i) == numclase);
        end
    end
end

confianza = correctos ./ soporte;
confianza(isnan(confianza))=0;
end
