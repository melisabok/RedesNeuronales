function[ClasesCorrectas] = evaluar(P, W, W2, T)

CantPatrones = size(P,2);
ocultas = size(W,2);
salidas = size(W2,1);
Salidas = zeros(salidas,CantPatrones);

for i= 1:CantPatrones
    distancias = sqrt(sum((P(:,i)*ones(1,ocultas) - W).^2));
    [DMin, ganadora] = min(distancias);  
    Salidas(:,i) = W2(:,ganadora);
end;

indices = (Salidas >= - 0.2) & (Salidas <= 0.2);
Salidas(indices) = 0;

indices = (Salidas >= 0.8) & (Salidas <= 1.2);
Salidas(indices) = 1;
    
   
%Calculo solo la cantidad de correctos
CantCorrectos = sum(all(Salidas == T,1));

ClasesCorrectas = zeros(salidas, 1);
for i = 1:salidas
    [rows, cols] = find(T(i,:) == 1);
    ClasesCorrectas(i) = sum(all(Salidas(:,cols) == T(:,cols),1));
end

end