function[Y] = convertir_matriz(NroClase)

CantPatrones = length(NroClase);
CantClases = max(NroClase);

Y = zeros(CantClases,CantPatrones);
for index = 1:CantPatrones
    Y(NroClase(index), index) = 1;
end

end