clear all
clc

datos = csvread('drug5.csv');
delete('main_tansig_tansig.csv');
delete('main_tansig_logsig.csv');
delete('main_logsig_logsig.csv');
delete('main_logsig_tansig.csv');
delete('main_tansig_purelin.csv');
delete('main_logsig_purelin.csv');
delete('main_purelin_tansig.csv');
delete('main_logsig_logsig_1.csv');
delete('main_logsig_logsig_3.csv');
delete('main_logsig_logsig_5.csv');
delete('main_logsig_logsig_7.csv');

% Tamanio de los datos
[CantFilas, CantCols] = size(datos);
% Escalo
M = escalar(datos, 1:CantCols-1);
%Parametros
cota_error = 0.000001;
alfa = 0.15;
MAX_ITERA = 3300;


for index = 1:5
    [correctos_train correctos_test] = realizar_corrida(M, alfa, cota_error, MAX_ITERA, 'tansig', 'tansig', 4); 
    R = [alfa cota_error MAX_ITERA correctos_train correctos_test (correctos_train / 160) * 100 (correctos_test / 40) * 100];
    R
    dlmwrite('main_tansig_tansig.csv',R,'delimiter','\t','-append');
end

for index = 1:5
    [correctos_train correctos_test] = realizar_corrida(M, alfa, cota_error, MAX_ITERA, 'tansig', 'logsig', 4); 
    R = [alfa cota_error MAX_ITERA correctos_train correctos_test (correctos_train / 160) * 100 (correctos_test / 40) * 100];
    R
    dlmwrite('main_tansig_logsig.csv',R,'delimiter','\t','-append');
end

for index = 1:5
    [correctos_train correctos_test] = realizar_corrida(M, alfa, cota_error, MAX_ITERA, 'logsig', 'logsig', 4); 
    R = [alfa cota_error MAX_ITERA correctos_train correctos_test (correctos_train / 160) * 100 (correctos_test / 40) * 100];
    R
    dlmwrite('main_logsig_logsig.csv',R,'delimiter','\t','-append');
end

for index = 1:5
    [correctos_train correctos_test] = realizar_corrida(M, alfa, cota_error, MAX_ITERA, 'logsig', 'tansig', 4); 
    R = [alfa cota_error MAX_ITERA correctos_train correctos_test (correctos_train / 160) * 100 (correctos_test / 40) * 100];
    R
    dlmwrite('main_logsig_tansig.csv',R,'delimiter','\t','-append');
end

for index = 1:5
    [correctos_train correctos_test] = realizar_corrida(M, alfa, cota_error, MAX_ITERA, 'logsig', 'purelin', 4); 
    R = [alfa cota_error MAX_ITERA correctos_train correctos_test (correctos_train / 160) * 100 (correctos_test / 40) * 100];
    R
    dlmwrite('main_logsig_purelin.csv',R,'delimiter','\t','-append');
end

for index = 1:5
    [correctos_train correctos_test] = realizar_corrida(M, alfa, cota_error, MAX_ITERA, 'tansig', 'purelin', 4); 
    R = [alfa cota_error MAX_ITERA correctos_train correctos_test (correctos_train / 160) * 100 (correctos_test / 40) * 100];
    R
    dlmwrite('main_tansig_purelin.csv',R,'delimiter','\t','-append');
end

for index = 1:5
    [correctos_train correctos_test] = realizar_corrida(M, alfa, cota_error, MAX_ITERA, 'purelin', 'tansig', 4); 
    R = [alfa cota_error MAX_ITERA correctos_train correctos_test (correctos_train / 160) * 100 (correctos_test / 40) * 100];
    R
    dlmwrite('main_purelin_tansig.csv',R,'delimiter','\t','-append');
end

for index = 1:5
    [correctos_train correctos_test] = realizar_corrida(M, alfa, cota_error, MAX_ITERA, 'logsig', 'logsig', 1); 
    R = [alfa cota_error MAX_ITERA correctos_train correctos_test (correctos_train / 160) * 100 (correctos_test / 40) * 100];
    R
    dlmwrite('main_logsig_logsig_1.csv',R,'delimiter','\t','-append');
end

for index = 1:5
    [correctos_train correctos_test] = realizar_corrida(M, alfa, cota_error, MAX_ITERA, 'logsig', 'logsig', 3); 
    R = [alfa cota_error MAX_ITERA correctos_train correctos_test (correctos_train / 160) * 100 (correctos_test / 40) * 100];
    R
    dlmwrite('main_logsig_logsig_3.csv',R,'delimiter','\t','-append');
end

for index = 1:5
    [correctos_train correctos_test] = realizar_corrida(M, alfa, cota_error, MAX_ITERA, 'logsig', 'logsig', 5); 
    R = [alfa cota_error MAX_ITERA correctos_train correctos_test (correctos_train / 160) * 100 (correctos_test / 40) * 100];
    R
    dlmwrite('main_logsig_logsig_5.csv',R,'delimiter','\t','-append');
end

for index = 1:5
    [correctos_train correctos_test] = realizar_corrida(M, alfa, cota_error, MAX_ITERA, 'logsig', 'logsig', 7); 
    R = [alfa cota_error MAX_ITERA correctos_train correctos_test (correctos_train / 160) * 100 (correctos_test / 40) * 100];
    R
    dlmwrite('main_logsig_logsig_7.csv',R,'delimiter','\t','-append');
end




