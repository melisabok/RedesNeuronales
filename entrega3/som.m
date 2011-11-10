function[W] = som(P, fil_ocultas, col_ocultas, vecinas, ITE_MAX, alfa)

pos = gridtop( col_ocultas, fil_ocultas); 
pasos = linkdist(pos); 
[entradas, CantPatrones] = size(P); 

ocultas = fil_ocultas * col_ocultas; 
% Pesos iniciales 
W = ones(entradas,ocultas) * 0.5; 
ite = 0;
Reduccion = 20;
ITE_MIN = (vecinas+2)*Reduccion;

WAnt = 100*ones(entradas, ocultas);
Dife = mean(sqrt(sum(WAnt - W).^2));

while (( ite <= ITE_MAX ) && (Dife > 0.01)) || (ite < ITE_MIN)% "W no cambie mucho?
    ite = ite + 1;
    WAnt = W;
    for patr =1:CantPatrones, 
        %buscar el W mas proximo
        distancias = sqrt(sum((P(:,patr)*ones(1,ocultas) - W).^2));
        [DMin, ganadora] = min(distancias);
        
        %Actualizar la neurona ganadora y su vecindad 
        for c=1:ocultas
            if pasos(ganadora,c) <= vecinas
                %actualizar W porque es la ganadora o una vecina
                W(:,c) = W(:,c) + alfa * (P(:,patr) - W(:,c));
            end
        end
    end
    Dife = mean(sqrt(sum(WAnt - W).^2));
    if (vecinas>=1) & (mod(ite,Reduccion)==0), 
        vecinas = vecinas-1; 
    end 
end

end