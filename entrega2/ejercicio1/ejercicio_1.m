%%%%%%
%
% Neurona No Lineal para el archivo Drug5.csv
%
%
%%%%%%

datos = csvread('drug5.csv');

[CantFilas, CantCols] = size(datos);

% Escalo
M = escalar(datos, 1:CantCols-1);

% Convierto la clase en 1 (cuando es 1) y 0 (cuando es distinto de 1)
unos = find(M(:,CantCols) == 1);
M(:, CantCols) = -1;
M(unos, CantCols) = 1;

% Separo en Train y Test
[M_Train, M_Test] = separar_train_test(M, 80);

P_Train = M_Train(:, 1:CantCols - 1)';
T_Train = M_Train(:, CantCols)';

P_Test = M_Test(:, 1:CantCols - 1)';
T_Test = M_Test(:, CantCols)';

% X = [ 2 3 1 3 0 2 -1 2 ;
%       2 1 0 3 1 4  1 5 ];
% T = [ 0 1 0 1 0 1  0 1 ]; %salida binaria para dibujar
% T2 = [ -1 1 -1 1 -1 1  -1 1 ]; % salida bipolar para tansig

% [W,b] = neurona_no_lineal(X, T, 0.05, 0.00001, 1000, 'logsig');
[W,b] = neurona_no_lineal(P_Train, T_Train, 0.2, 0.000001, 3000, 'tansig');

correctos_train = evaluar_tansig(P_Train, T_Train, W, b); 
correctos_test = evaluar_tansig(P_Test, T_Test, W, b); 
fprintf('Cantidad de correctos train y test \n');
[correctos_train correctos_test]




