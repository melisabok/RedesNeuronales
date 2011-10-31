% Neurona no lineal.
% Algoritmo que resuelve una neurona no lineal
% P : Patrones
% T : clase, tiene que estar compuesta en base a la funcion utilizada
% alfa : tasa de aprendizaje
% CotaError: cota del error
% MAX_ITE: cantidad maxima de iteraciones
% funcion: funcion a aplicar a los valores netos obtenidos en la red
% detalle: puede tener valor 1 o 0, significa si se guarda la eficiencia
% cada 100 iteraciones realizadas, se utiliza para la estimacion de
% parametros
function[ite, W, b] = neurona_no_lineal(P, T, alfa, CotaError, MAX_ITE, funcion, detalle)


[CantAtrib, CantPatrones] = size(P);

W = rand(1,CantAtrib) - 0.5 * ones(1,CantAtrib); 
b = rand - 0.5;


errorAct = 1;
ite = 0;

while (ite < MAX_ITE) & (errorAct > CotaError)

    ite = ite + 1;
    errorAct = 0;
    
    for patr = 1 : CantPatrones
    
        neta = W*P(:,patr) + b;
        f_neta = feval(funcion, neta);
        f_prima_neta = feval([ 'd' funcion], neta, f_neta);
        
        errorK = T(patr) - f_neta;
        gradiente = -2*errorK*f_prima_neta*P(:, patr);
        
        W = W - alfa * gradiente';  
        b = b - alfa * (-2*errorK*f_prima_neta);
        errorAct = errorAct + errorK^2;
    
    end
    
    %[ite ErrorAct]
    if (detalle == 1 & mod(ite,100) == 0)
        
        correctos_train = evaluar_clase_funcion(T, feval(funcion, W*P+b), funcion);
        R = [alfa ite correctos_train (correctos_train / CantPatrones) * 100];
        R
        archivo = strcat('estimar_parametros_', funcion, '.csv');
        dlmwrite(archivo,R,'delimiter','\t','-append');
    end
    
    
end








