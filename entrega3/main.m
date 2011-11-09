clear all;
clc;

datos = csvread('Vinos.csv');
[CantPatrones, Cols] = size(datos);
datos = escalar(datos,2:Cols); 
P = datos(:, 2:Cols);
NroClase = datos(:,1);
P = P';

mezcla = randperm(CantPatrones);
P = P(:,mezcla);
NroClase = NroClase(mezcla);

%Armo la matriz con valor = 1 en la fila que corresponda a la clase
Y = zeros(3,CantPatrones);
for index = 1:CantPatrones
    Y(NroClase(index), index) = 1;
end

W = som(P, 6, 5, 3, 100, 0.05);

W

[clases, ganadoras] = calcular_ganadoras(P, W, NroClase);

mapa = obtener_mapa(6, 5, clases);

mapa

W2 = capa_salida(P, W, Y, 100, 0.05);

W2

%Obtengo las Salidas de Train 
SalidasTrain = zeros(3,CantPatrones);
for i= 1:CantPatrones
    SalidasTrain(:,i) = W2(:,ganadoras(i));
end;

SalidasTrain

indices = (SalidasTrain >= - 0.2) & (SalidasTrain <= 0.2);
SalidasTrain(indices) = 0;

indices = (SalidasTrain >= 0.8) & (SalidasTrain <= 1.2);
SalidasTrain(indices) = 1;
    
   
%Calculo solo la cantidad de correctos
CantCorrectos = sum(all(SalidasTrain == Y,1));
CantCorrectos

