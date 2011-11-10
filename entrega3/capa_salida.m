function[W2] = capa_salida(P, W, T, ITE_MAX, beta)

ocultas = size(W,2);
salidas = size(T,1);
[entradas, CantPatrones] = size(P);
W2 = zeros( salidas, ocultas);
W2Ant = 100*ones(salidas, ocultas);
ite = 0;
Dife = max(sqrt(sum(W2Ant - W2).^2));

while ( ite <= ITE_MAX )  & (Dife > 0.01), 
    ite = ite + 1;
    W2Ant = W2;
    for i=1:CantPatrones, 
        %buscar el W mas proximo 
        distancias = sqrt(sum((P(:,i)*ones(1,ocultas) - W).^2));
        [DMin, ganadora] = min(distancias);
        
        %Actualizar los pesos que salen de la neurona 
        %  ganadora 
        W2( :, ganadora) = W2(:, ganadora) + beta * (T(:, i) - W2 (:, ganadora));    
    end  
    Dife = max(sqrt(sum(W2Ant - W2).^2));
    [ite Dife];
    %redibujar 
end

end