function [soporte, confianza, fitness] = calcular_fitness( Datos, Reglas, Clase, numclase)

[CantDatos, CantCols] = size(Datos);
CantReglas = size(Reglas, 2);

antencedente = zeros(1, CantReglas);
correctos = zeros(1, CantReglas);
longitud = sum(Reglas > 0);



for j=1:CantReglas
    for i=1:CantDatos
        esIgual = 1;
        k = 1;
        while esIgual && k <= CantCols
            if (Reglas(k, j) > 0) && (Reglas(k, j) ~= Datos(i,k))
                esIgual = 0;
            end
            k = k + 1;
        end
        if (esIgual == 1)
            antencedente(1,j) = antencedente(1,j) + 1;
            correctos(1,j) = correctos(1,j) + (Clase(i) == numclase);
        end
    end
end

confianza = correctos ./ antencedente;
confianza(isnan(confianza))=0;
soporte = correctos ./ CantDatos;
fitness = (soporte + confianza) ./ (2 * longitud);
end
