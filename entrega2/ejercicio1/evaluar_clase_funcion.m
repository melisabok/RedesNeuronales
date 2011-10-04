function[CantCorrectos] = evaluar_clase_funcion(T, Y, funcion)

clases = feval(funcion, 'output');
cant = length(clases);

for index=1:cant
    clase = clases(index);
    indices = Y >= (clase - 0.2) & Y <= (clase + 0.2);
    Y(indices) = clase;
end

%Calculo solo la cantidad de correctos
CantCorrectos = sum(T == Y);
%Parecidas = sum(abs(T-Y) < 0.2);

