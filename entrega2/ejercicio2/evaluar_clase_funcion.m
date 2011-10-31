%Evalua la cantidad de patrones clasificados correctamente en una arquitectura multicapa,
% capa oculta y capa de salida
function[CantCorrectos] = evaluar_clase_funcion(P, T, w1, b1, w2, b2, FuncionOculta, FuncionSalida)

 
    [Entradas, CantPatrones] = size(P);
    NETA_OCULTA = (w1 * P) + b1 * ones(1, CantPatrones);
    F_NETA_OCULTA = feval(FuncionOculta, NETA_OCULTA);

    NETA_SALIDA = w2 * F_NETA_OCULTA + b2 * ones(1, CantPatrones); 
    Y = feval(FuncionSalida, NETA_SALIDA);

    falso = 0;
    verdadero = 1;
    if(strcmp(FuncionSalida,'tansig') > 0)
       falso = -1; 
    end

    indices = Y >= (falso - 0.2) & Y <= (falso + 0.2);
    Y(indices) = falso;

    indices = Y >= (verdadero - 0.2) & Y <= (verdadero + 0.2);
    Y(indices) = verdadero;
    
   
    %Calculo solo la cantidad de correctos
    CantCorrectos = sum(all(Y == T,1));


    

