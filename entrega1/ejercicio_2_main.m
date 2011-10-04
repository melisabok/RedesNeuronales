%% Algoritmo del perceptron

% Eliminamos todas las variables
clear all
clc

datos = csvread('Adult_Parte1.csv');
delete('resultados_2.csv');

[CantPatrones, CantAtrib] = size(datos);
P = datos;

% escalar datos
P_escalado = P;
P_escalado(:,1) = (P_escalado(:,1) - min(P_escalado(:,1))) ./ (max(P_escalado(:,1)) - min(P_escalado(:,1)));
P_escalado(:,2) = (P_escalado(:,2) - min(P_escalado(:,2))) ./ (max(P_escalado(:,2)) - min(P_escalado(:,2)));
P_escalado(:,3) = (P_escalado(:,3) - min(P_escalado(:,3))) ./ (max(P_escalado(:,3)) - min(P_escalado(:,3)));


% 2ai Pruebo sin escalar, sin ordenar y con un alfa fijo
ejercicio_2(P, 0, 0.3, 0);

% 2aii Pruebo escalando, sin ordenar y con un alfa fijo
ejercicio_2(P_escalado, 0, 0.3, 0);

% 2bi Pruebo escalando, ordenando y con un alfa fijo
ejercicio_2(P_escalado, 1, 0.3, 0);

% 2bii Pruebo escalando, alternando y con un alfa fijo
ejercicio_2(P_escalado, 2, 0.3, 0);

% 2c Pruebo escalando, sin ordenar y con un alfa variable
ejercicio_2(P_escalado, 0, 0.03, 0.03);

    

