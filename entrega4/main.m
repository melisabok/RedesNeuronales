clc
clear all

delete('salida.csv');

lchrom  = 9;            % long. del cromosoma 
popsize = 70;           % tama?o de la poblacion 
pcross  = 0.65;         % probabilidad de crossover
pmutation = 0.05;       % probabilidad de mutacion
maxgen   = 100;        % m?x. cant.de generaciones

Datos = csvread('cancer.csv');

numintervalos = 4;
clase = 2;
[Pop, Fitness] = obtener_reglas(Datos, lchrom, popsize, pcross, pmutation, numintervalos, clase, maxgen);