%Realiza una corrida independiente:
% - mezcla los datos
% - separa el conjunto en training y test
% - arma la matriz T en funcion de: FuncionSalida y cantidad de neuronas en
% la capa oculta
% - corre el multipercetron
% - evalua training
% - evalue testing
% devuelve la cantidad de patrones correctos para training y testing
function[correctos_train correctos_test] = realizar_corrida(M, alfa, cota_error, MAX_ITERA, FuncionOculta, FuncionSalida, Ocultas) 

    %Imprimo parametros de la corrida en consola
    %[alfa, cota_error, MAX_ITERA]
    Salidas = 5;
    [CantFilas, CantCols] = size(M);

    % Separo en Train y Test
    [M_Train, M_Test] = separar_train_test(M, 80);

    % Armo los T para Train y Test segun la funcion de salida
    P_Train = M_Train(:, 1:CantCols - 1)';
    Temp_Train = M_Train(:, CantCols)';
    falso = 0;
    if(strcmp(FuncionSalida,'tansig') > 0)
       falso = -1; 
    end
    T_Train = ones(5,length(Temp_Train)) * falso;
    for index = 1:length(Temp_Train)
        T_Train(Temp_Train(index), index) = 1;
    end
    
    P_Test = M_Test(:, 1:CantCols - 1)';
    Temp_Test = M_Test(:, CantCols)';
    T_Test = ones(5,length(Temp_Test)) * falso;
    for index = 1:length(Temp_Test)
        T_Test(Temp_Test(index), index) = 1;
    end

    
    %Corro la neurona
    [w1,b1,w2,b2] = bpn(P_Train, T_Train, alfa, cota_error, MAX_ITERA, FuncionOculta, FuncionSalida, Ocultas, Salidas);
    
    %Evaluo Training
    [correctos_train] = evaluar_clase_funcion(P_Train, T_Train, w1, b1, w2, b2, FuncionOculta, FuncionSalida);
    
    %Evaluo Test
    [correctos_test] = evaluar_clase_funcion(P_Test, T_Test, w1, b1, w2, b2, FuncionOculta, FuncionSalida);

    





