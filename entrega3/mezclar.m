function[M] = mezclar(P)

[CantFilas, CantCols] = size(P);
indices = randperm(CantFilas);
M = P(indices,:);