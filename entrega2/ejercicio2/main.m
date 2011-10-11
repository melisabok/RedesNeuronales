clear all
clc

datos = csvread('drug5.csv');
delete('main_tansig_tansig.csv');
delete('main_tansig_logsig.csv');
delete('main_logsig_logsig.csv');
delete('main_logsig_tansig.csv');
delete('main_tansig_tansig_1.csv');
delete('main_tansig_tansig_3.csv');
delete('main_tansig_tansig_5.csv');
delete('main_tansig_tansig_7.csv');

% Tamanio de los datos
[CantFilas, CantCols] = size(datos);
% Escalo
M = escalar(datos, 1:CantCols-1);
%Parametros
cota_error = 0.000001;
alfa = 0.2;
MAX_ITERA = 5000;


for index = 1:5
    [correctos_train correctos_test] = realizar_corrida(M, alfa, cota_error, MAX_ITERA, 'tansig', 'tansig', 4); 
    R = [alfa cota_error MAX_ITERA correctos_train correctos_test];
    R
    dlmwrite('main_tansig_tansig.csv',R,'-append');
end

for index = 1:5
    [correctos_train correctos_test] = realizar_corrida(M, alfa, cota_error, MAX_ITERA, 'tansig', 'logsig', 4); 
    R = [alfa cota_error MAX_ITERA correctos_train correctos_test];
    R
    dlmwrite('main_tansig_logsig.csv',R,'-append');
end

for index = 1:5
    [correctos_train correctos_test] = realizar_corrida(M, alfa, cota_error, MAX_ITERA, 'logsig', 'logsig', 4); 
    R = [alfa cota_error MAX_ITERA correctos_train correctos_test];
    R
    dlmwrite('main_logsig_logsig.csv',R,'-append');
end

for index = 1:5
    [correctos_train correctos_test] = realizar_corrida(M, alfa, cota_error, MAX_ITERA, 'logsig', 'tansig', 4); 
    R = [alfa cota_error MAX_ITERA correctos_train correctos_test];
    R
    dlmwrite('main_logsig_tansig.csv',R,'-append');
end

for index = 1:5
    [correctos_train correctos_test] = realizar_corrida(M, alfa, cota_error, MAX_ITERA, 'tansig', 'tansig', 1); 
    R = [alfa cota_error MAX_ITERA correctos_train correctos_test];
    R
    dlmwrite('main_tansig_tansig_1.csv',R,'-append');
end

for index = 1:5
    [correctos_train correctos_test] = realizar_corrida(M, alfa, cota_error, MAX_ITERA, 'tansig', 'tansig', 3); 
    R = [alfa cota_error MAX_ITERA correctos_train correctos_test];
    R
    dlmwrite('main_tansig_tansig_3.csv',R,'-append');
end

for index = 1:5
    [correctos_train correctos_test] = realizar_corrida(M, alfa, cota_error, MAX_ITERA, 'tansig', 'tansig', 5); 
    R = [alfa cota_error MAX_ITERA correctos_train correctos_test];
    R
    dlmwrite('main_tansig_tansig_5.csv',R,'-append');
end

for index = 1:5
    [correctos_train correctos_test] = realizar_corrida(M, alfa, cota_error, MAX_ITERA, 'tansig', 'tansig', 7); 
    R = [alfa cota_error MAX_ITERA correctos_train correctos_test];
    R
    dlmwrite('main_tansig_tansig_7.csv',R,'-append');
end




