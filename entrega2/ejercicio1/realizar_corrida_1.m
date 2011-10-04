function[correctos_train correctos_test error_train error_test] = realizar_corrida_1(M, alfa, cota_error, MAX_ITERA, funcion) 

    %Imprimo parametros de la corrida en consola
    %[alfa, cota_error, MAX_ITERA]
    
    [CantFilas, CantCols] = size(M);

    % Separo en Train y Test
    [M_Train, M_Test] = separar_train_test(M, 80);

    P_Train = M_Train(:, 1:CantCols - 1)';
    T_Train = M_Train(:, CantCols)';

    P_Test = M_Test(:, 1:CantCols - 1)';
    T_Test = M_Test(:, CantCols)';

    % Corro la neurona
    [W,b] = neurona_no_lineal(P_Train, T_Train, alfa, cota_error, MAX_ITERA, funcion);

    % Calculo el error
    Y_Train = feval(funcion, W*P_Train+b);
    error_train = sum((T_Train - Y_Train)).^2 / CantFilas;
    % Calculo el error
    Y_Test = feval(funcion, W*P_Test+b);
    error_test = sum((T_Test - Y_Test)).^2 / CantFilas;
    
    %[Y_Train Y_Test]
    % Evaluo los resultado, tomando como correctos los valores que no se
    % alejan un 0.2 del resultado de la funcion aplicada
    correctos_train = evaluar_clase_funcion(T_Train, Y_Train, funcion); 
    correctos_test = evaluar_clase_funcion(T_Test, Y_Test, funcion); 





