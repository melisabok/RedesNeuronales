clear all;
clc;

Train = csvread('Segment_Train.csv');
Test = csvread('Segment_Test.csv');


% %%Parametros
fil_ocultas = 9;
col_ocultas = 9;
vecinas = 4;
ITE_MAX = 500;
alfa = 0.05;
beta = 0.05;
% %%

for i = 1:10
    realizar_corrida(Train, Test, fil_ocultas, col_ocultas, vecinas, ITE_MAX, alfa, beta); 
end

% %%Parametros
% fil_ocultas = 9;
% col_ocultas = 9;
% vecinas = 4;
% ITE_MAX = 500;
% alfa = 0.05;
% beta = 0.05;
% %%
% 
% datos = csvread('Segment_Train.csv');
% [CantPatrones, Cols] = size(datos);
% 
% P_esc = escalar(datos,2:Cols); 
% 
% P_esc_mezc = mezclar(P_esc);
% 
% % Separo en matriz de patrones y vector de clase
% P = P_esc_mezc(:, 2:Cols);
% NroClase = P_esc_mezc(:,1);
% P = P';
% 
% %Armo la matriz con valor = 1 en la fila que corresponda a la clase
% Y = convertir_matriz(NroClase);
% 
% W = som(P, fil_ocultas, col_ocultas, vecinas, ITE_MAX, alfa);
% 
% %W
% 
% [clases, ganadoras] = calcular_ganadoras(P, W, NroClase);
% 
% % mapa = obtener_mapa(fil_ocultas, col_ocultas, clases);
% % 
% % mapa
% 
% W2 = capa_salida(P, W, Y, ITE_MAX, beta);
% 
% %W2
% 
% R = evaluar(P, W, W2, Y);
% 
% [R (R ./ sum(Y,2)) * 100]
% 
% %% Testeo!
% datos = csvread('Segment_Test.csv');
% [CantPatrones, Cols] = size(datos);
% 
% P_esc = escalar(datos,2:Cols); 
% 
% P_esc_mezc = mezclar(P_esc);
% 
% % Separo en matriz de patrones y vector de clase
% P = P_esc_mezc(:, 2:Cols);
% NroClase = P_esc_mezc(:,1);
% P = P';
% 
% %Armo la matriz con valor = 1 en la fila que corresponda a la clase
% Y = convertir_matriz(NroClase);
% 
% R = evaluar(P, W, W2, Y);
% 
% [R (R ./ sum(Y,2)) * 100]
% 
% 
% 
% 
% 
