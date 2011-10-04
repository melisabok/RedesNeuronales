clear all
clc

datos = csvread('drug5.csv');
delete('estimar_parametros_tansig_1.csv');
delete('estimar_parametros_logsig_1.csv');

% Tamanio de los datos
[CantFilas, CantCols] = size(datos);
% Escalo
M = escalar(datos, 1:CantCols-1);
%Parametros
cota_error = 0.0001;
alfas = [0.005 0.01 0.02 0.03 0.04 0.05 0.1 0.15 0.2];

%Primero probamos con tansig
% Convierto la clase segun la funcion dada
unos = find(M(:,CantCols) == 1);
M(:, CantCols) = -1;
M(unos, CantCols) = 1;

for index = 1:length(alfas)
    for MAX_ITERA = 3000: 500: 5000
        [correctos_train correctos_test error_train error_test] = realizar_corrida_1(M, alfas(index), cota_error, MAX_ITERA, 'tansig'); 
        R = [alfas(index) cota_error MAX_ITERA correctos_train correctos_test error_train error_test];
        R
        dlmwrite('estimar_parametros_tansig_1.csv',R,'-append');
    end
end

%Luego probamos para logsig
M(:, CantCols) = 0;
M(unos, CantCols) = 1;

for index = 1:length(alfas)
    for MAX_ITERA = 3000: 500: 5000
        [correctos_train correctos_test error_train error_test] = realizar_corrida_1(M, alfas(index), cota_error, MAX_ITERA, 'logsig'); 
        R = [alfas(index) cota_error MAX_ITERA correctos_train correctos_test error_train error_test];
        R
        dlmwrite('estimar_parametros_logsig_1.csv',R,'-append');
    end
end







