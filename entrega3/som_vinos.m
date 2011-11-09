clear all;
clc;

datos = csvread('Vinos.csv');
[Filas, Cols] = size(datos);
datos = escalar(datos,2:Cols); 
P = datos(:, 2:Cols);
NroClase = datos(:,1);
P = P';

%P = rands(2,1000); 
% Disposicion de las neuronas de la capa oculta 
fil_ocultas = 6; 
col_ocultas = 5; 
pos = gridtop( col_ocultas, fil_ocultas); 
pasos=linkdist(pos); 
[entradas, CantPatrones] = size(P); 

mezcla = randperm(CantPatrones);
P = P(:,mezcla);
NroClase = NroClase(mezcla);
%Y = NroClase';
Y = zeros(3,CantPatrones);
for index = 1:CantPatrones
    Y(NroClase(index), index) = 1;
end

ocultas = fil_ocultas * col_ocultas; 
% Pesos iniciales 
W = ones(entradas,ocultas) * 0.5; 

vecinas = 3; 
ITE_MAX = 100; 
alfa = 0.05; 
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

% dibujemos la red para los ejemplos de vino TIPO 1
mapa = zeros(fil_ocultas, col_ocultas);

for patr=1:CantPatrones
    if NroClase(patr) == 1
        %buscar el W mas proximo
        distancias = sqrt(sum((P(:,patr)*ones(1,ocultas) - W).^2));
        [DMin, ganadora] = min(distancias);
        %f = fix( ganadora / col_ocultas );
        %c = ganadora;
        mapa(ganadora) = mapa(ganadora) + 1;
        
    end
end


% calcular para c/clase la lista de patrones que contiene 
clases = []; 
clases = zeros(ocultas,max(NroClase));
ganadoras = zeros(1,CantPatrones);
for i = 1:CantPatrones 
    %Calcular la neurona ganadora
    distancias = sqrt(sum((P(:,i)*ones(1,ocultas) - W).^2));
    [DMin, ganadora] = min(distancias);
    ganadoras(1,i) = ganadora;
    c= NroClase(i); %ven?a con los patrones 
    clases(ganadora, c) = clases(ganadora, c ) + 1; 
end
ganadoras

% mapa = cell(fil_ocultas, col_ocultas); 
% for nro = 1:ocultas 
%     texto = ''; 
%     for cl = min(NroClase):max(NroClase) 
%         if clases(nro, cl) > 0 
%             if ~isempty(texto)
%                 texto = strcat(texto, ' ; '); 
%             end 
%             textoA = sprintf('c%d -->%d', cl, clases(nro,cl));
%             texto= [texto ',' textoA];
%         end; 
%     end; 
%     fila = fil_ocultas -floor( (nro-1)/col_ocultas ); 
%     col  = mod( (nro-1), col_ocultas ) + 1; 
%     mapa(fila,col) = {[texto]}; 
% end; 
% 
% mapa



%% hacer la capa de salida como hicimos con CPN, tomar el 80 para entrenar
%% y 20 de testeo. Actualizar los valores de los arcos que salen de la
%% neurona ganadora, ver ppt de CPN pag. 12. Solo se actualiza de la
%% neurona ganadora a la capa de salida. 
beta = 0.1; 
salidas = 3;
W2 = zeros( salidas, ocultas); 
ITE_MAX = 50;
ite = 0;
while ( ite <= ITE_MAX )  %%& ( ?los pesos no cambien?), 
    for i=1:CantPatrones, 
        %buscar el W mas proximo 
        distancias = sqrt(sum((P(:,i)*ones(1,ocultas) - W).^2));
        [DMin, ganadora] = min(distancias);
        
        %Actualizar los pesos que salen de la neurona 
        %  ganadora 
        W2( :, ganadora) = W2(:, ganadora) + beta * (Y(:, i) -W2(:, ganadora));    
    end  
    %redibujar 
    ite = ite + 1 
end

%Obtengo las Salidas de Train 
SalidasTrain = zeros(salidas,CantPatrones);
for i= 1:CantPatrones
    distancias = sqrt(sum((P(:,i)*ones(1,ocultas) - W).^2));
    [DMin, ganadora] = min(distancias);  
    SalidasTrain(:,i) = W2(:,ganadora);
end;

SalidasTrain

indices = (SalidasTrain >= - 0.2) & (SalidasTrain <= 0.2);
SalidasTrain(indices) = 0;

indices = (SalidasTrain >= 0.8) & (SalidasTrain <= 1.2);
SalidasTrain(indices) = 1;
    
   
%Calculo solo la cantidad de correctos
CantCorrectos = sum(all(SalidasTrain == Y,1));
CantCorrectos
%W2





