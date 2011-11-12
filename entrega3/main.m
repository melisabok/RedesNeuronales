clear all;
clc;

delete('salida.csv');
delete('mapa.csv');
Train = csvread('Segment_Train.csv');
Test = csvread('Segment_Test.csv');

% %%Parametros
fil_ocultas = 9;
col_ocultas = 9;
vecinas = 4;
ITE_MAX = 1000;
alfa = 0.05;
beta = 0.1;
% %%

for i = 1:10
    [RTrain RTest] = realizar_corrida(Train, Test, fil_ocultas, col_ocultas, vecinas, ITE_MAX, alfa, beta);
    dlmwrite('salida.csv',[RTrain RTest],'delimiter','\t','-append');
end

%No son linealmente separables%
% R = verificar_linealmente_separable(Train, 3);
% R
% R = verificar_linealmente_separable(Train, 4);
% R
% R = verificar_linealmente_separable(Train, 5);
% R
% 
% %Son linealmente sep%
% R = verificar_linealmente_separable(Train, 1);
% R
% R = verificar_linealmente_separable(Train, 2);
% R
% R = verificar_linealmente_separable(Train, 6);
% R
% R = verificar_linealmente_separable(Train, 7);
% R
