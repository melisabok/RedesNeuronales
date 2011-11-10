% Funcion para escalar los datos por columnas
% Cada elemento de una fila se la resta el minimo valor 
% se toda la columna y se lo divide por la longitud 
% del intervalo
% Parametros: Matriz P sobre la cual escalar los datos
%             Cols, columnas a escalar
function[P] = escalar(P, Cols)

for index=1:length(Cols)

    colIndex = Cols(index);
    minimo = min(P(:, colIndex));
    maximo = max(P(:, colIndex));
    longitud = (maximo - minimo);
    if longitud == 0
        longitud = 1;
    end
    P(:,colIndex) = ((P(:,colIndex) - minimo) ./ longitud); 
end