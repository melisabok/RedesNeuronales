function[P] = discretizar(Datos, numIntervalos)

cuatro_intervalos = [1 1 2 2 2 3 3 3 4 4];
siete_intervalos = [1 2 3 3 4 4 5 5 6 7];

intervalos = cuatro_intervalos;

if numIntervalos == 7
    intervalos = siete_intervalos;
end

P = intervalos(Datos);

end