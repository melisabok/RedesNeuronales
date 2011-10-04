function[W, b] = neurona_no_lineal(P, T, alfa, CotaError, MAX_ITE, funcion)

% clear
% clc
% %==========  Areas de grafico ===========
% figure(1), 
% set(1,'Position',[400 400 700 300])
% 
% %====== muestras ======
% X = [ 2 3 1 3 0 2 -1 2 ;
%       2 1 0 3 1 4  1 5 ];
% T = [ 0 1 0 1 0 1  0 1 ]; %salida binaria para dibujar
% T2 = [ -1 1 -1 1 -1 1  -1 1 ]; % salida bipolar para tansig
% 
[CantAtrib, CantPatrones] = size(P);

W = rand(1,CantAtrib) - 0.5 * ones(1,CantAtrib); 
b = rand - 0.5;


error_Ant = 0;
error_Act = sum((T - feval(funcion, W*P+b))).^2 / CantPatrones;
ite = 0;
error_abs = abs(error_Act - error_Ant);
suma_error = 1;

while (ite < MAX_ITE) & (suma_error > CotaError)

    ite = ite + 1;
    error_Ant = error_Act;
    suma_error = 0;
    
    for patr = 1 : CantPatrones
    
        neta = W*P(:,patr) + b;
        f_neta = feval(funcion, neta);
        f_prima_neta = feval([ 'd' funcion], neta, f_neta);
        
        errorK = T(patr) - f_neta;
        gradiente = -2*errorK*f_prima_neta*P(:, patr);
        
        W = W - alfa * gradiente';  
        b = b - alfa * (-2*errorK*f_prima_neta); 
        suma_error = suma_error + errorK^2;
    
    end
    
    error_Act = suma_error / CantPatrones;
    error_abs = abs(error_Act - error_Ant);
    [ite suma_error]
    
end








