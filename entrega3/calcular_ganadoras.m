function[clases, ganadoras] = calcular_ganadoras(P, W, NroClase)

[entradas,ocultas] = size(W);
CantPatrones = length(NroClase);
clases = zeros(ocultas,max(NroClase));
ganadoras = zeros(1,CantPatrones);

for i = 1:CantPatrones 
    %Calcular la neurona ganadora
    distancias = sqrt(sum((P(:,i)*ones(1,ocultas) - W).^2));
    [DMin, ganadora] = min(distancias);
    c = NroClase(i); %ven?a con los patrones 
    
    clases(ganadora, c) = clases(ganadora, c ) + 1; 
    ganadoras(1,i) = ganadora;
end

end