% Funcion que sirve para poder obtner un conjunto de datos
% para el entrenamiento y otro para el testeo
% Me aseguro que los datos esten mezclados para que cada
% separacion sea diferente
%
function[Train, Test] = separar_train_test(M, percent)

    %Primero mezclo los datos
    M = mezclar(M);

    %Obtengo el tamanio de la matriz
    [Rows, Columns] = size(M);
    
    %Calculo la cantidad de filas que corresponden al porcentaje
    n = floor(Rows*(percent / 100));
    
    %Separo la matriz en dos
    Train = M(1:n, :);
    Test = M((n+1):Rows, :);