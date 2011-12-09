function[P] = discretizar(Datos, numIntervalos)

cuatro_intervalos = [1 1 2 2 2 3 3 3 4 4];
siete_intervalos = [1 1 2 3 4 5 6 6 7 7];

intervalos = cuatro_intervalos;

if numIntervalos == 7
    intervalos = siete_intervalos;
end


[CantRows, CantCols] = size(Datos);
P = zeros(CantRows, CantCols);
for i=1:CantRows
    for j=1:CantCols
        if Datos(i,j) > 0
            P(i,j) = intervalos(Datos(i,j));
        end
    end
end


end