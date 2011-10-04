%% Algoritmo del perceptron

% Eliminamos todas las variables
clear all
clc

datos = csvread('clima_numerico.csv');
[CantPatrones, CantAtrib] = size(datos);
P = datos(:, 1:CantAtrib - 1);
T = datos(:, CantAtrib);

% los patrones ahora est?n en las columnas
P = P';
% vector fila con la clase a que pertence cada patr?n
T = T';  

%a) probar variando los parametros
%ejercicio_1(P,T)
    
%b) probar escalando los datos
P(2,:) = (P(2,:) - min(P(2,:))) ./ (max(P(2,:)) - min(P(2,:)));
P(3,:) = (P(3,:) - min(P(3,:))) ./ (max(P(3,:)) - min(P(3,:)));
%ejercicio_1(P,T)

%c) con la clase ordenada
datos = sortrows(datos,5);
P = datos(:, 1:CantAtrib - 1);
T = datos(:, CantAtrib);
P = P';
T = T';  
%ejercicio_1(P,T)


datos = sortrows(datos,-5);
P = datos(:, 1:CantAtrib - 1);
T = datos(:, CantAtrib);
P = P';
T = T';  
ejercicio_1(P,T)

