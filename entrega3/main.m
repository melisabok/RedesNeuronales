clear all;
clc;

%%Parametros
fil_ocultas = 6;
col_ocultas = 5;
vecinas = 3;
ITE_MAX = 100;
alfa = 0.05;
beta = 0.05;
%%

datos = csvread('Vinos.csv');
[CantPatrones, Cols] = size(datos);

datos = escalar(datos,2:Cols); 

datos = mezclar(datos);

% Separo en matriz de patrones y vector de clase
P = datos(:, 2:Cols);
NroClase = datos(:,1);
P = P';

%Armo la matriz con valor = 1 en la fila que corresponda a la clase
Y = convertir_matriz(NroClase);

W = som(P, fil_ocultas, col_ocultas, vecinas, ITE_MAX, alfa);

W

[clases, ganadoras] = calcular_ganadoras(P, W, NroClase);

mapa = obtener_mapa(fil_ocultas, col_ocultas, clases);

mapa

W2 = capa_salida(P, W, Y, ITE_MAX, beta);

W2

CantCorrectos = evaluar(P, W, W2, Y);

CantCorrectos
