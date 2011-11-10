function[RTrain, RTest] = realizar_corrida(Train, Test, fil_ocultas, col_ocultas, vecinas, ITE_MAX, alfa, beta)


%%Parametros
% fil_ocultas = 9;
% col_ocultas = 9;
% vecinas = 4;
% ITE_MAX = 500;
% alfa = 0.05;
% beta = 0.05;
%%

[CantPatrones, Cols] = size(Train);

P_esc = escalar(Train,2:Cols); 

P_esc_mezc = mezclar(P_esc);

% Separo en matriz de patrones y vector de clase
P = P_esc_mezc(:, 2:Cols);
NroClase = P_esc_mezc(:,1);
P = P';

%Armo la matriz con valor = 1 en la fila que corresponda a la clase
Y = convertir_matriz(NroClase);

W = som(P, fil_ocultas, col_ocultas, vecinas, ITE_MAX, alfa);

%W

[clases, ganadoras] = calcular_ganadoras(P, W, NroClase);

% mapa = obtener_mapa(fil_ocultas, col_ocultas, clases);
% 
% mapa

W2 = capa_salida(P, W, Y, ITE_MAX, beta);

%W2

R = evaluar(P, W, W2, Y);

RTrain = [R (R ./ sum(Y,2)) * 100]

%% Testeo!
[CantPatrones, Cols] = size(Test);

P_esc = escalar(Test,2:Cols); 

P_esc_mezc = mezclar(P_esc);

% Separo en matriz de patrones y vector de clase
P = P_esc_mezc(:, 2:Cols);
NroClase = P_esc_mezc(:,1);
P = P';

%Armo la matriz con valor = 1 en la fila que corresponda a la clase
Y = convertir_matriz(NroClase);

R = evaluar(P, W, W2, Y);

RTest = [R (R ./ sum(Y,2)) * 100]








end