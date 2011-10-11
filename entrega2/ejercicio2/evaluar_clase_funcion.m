%%
function[CantCorrectos] = evaluar_clase_funcion(P, T, w1, b1, w2, b2, FuncionOculta, FuncionSalida)

 
    [Entradas, CantPatrones] = size(P);
    NETA_OCULTA = (w1 * P) + b1 * ones(1, CantPatrones);
    F_NETA_OCULTA = feval(FuncionOculta, NETA_OCULTA);

    NETA_SALIDA = w2 * F_NETA_OCULTA + b2 * ones(1, CantPatrones); 
    Y = feval(FuncionSalida, NETA_SALIDA);

    clases = feval(FuncionSalida, 'output');
    cant = length(clases);

    for index=1:cant
        clase = clases(index);
        indices = Y >= (clase - 0.2) & Y <= (clase + 0.2);
        Y(indices) = clase;
    end

    %Calculo solo la cantidad de correctos
    correctos = T == 1;
    CantCorrectos = sum( Y(correctos) == 1);


    

