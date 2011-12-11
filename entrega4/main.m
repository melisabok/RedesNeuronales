clc
clear all

delete('salida.csv');
delete('resultado.csv');

Datos = csvread('cancer.csv');

realizar_corrida(Datos, 2, 4, 0, 0);
realizar_corrida(Datos, 2, 4, 1, 1);
realizar_corrida(Datos, 4, 4, 0, 0);
realizar_corrida(Datos, 4, 4, 1, 1);
realizar_corrida(Datos, 2, 7, 0, 0);
realizar_corrida(Datos, 2, 7, 1, 1);
realizar_corrida(Datos, 4, 7, 0, 0);
realizar_corrida(Datos, 4, 7, 1, 1);

