%  Funcion que ejecuta las diferentes corridas que 
%   son necesarias para el ejercicio 2. 
%  Cada corrida con su variacion de parametros
%  es almacenada en el archivo resultados_2.csv
%   
%   D: matriz de datos, son las filas son los patrones y las columnas
%       menos la ultima son los atributos, siendo la ultima correspondiente
%       a la clase. 
%
%   Orden: puede poseer tres valores:
%          0: la clase no se ordena, se respeta el orden de las mezcla
%          1: la clase se ordena en orden ascendente.
%          2: la clase se intercala 
%

function[] = ejercicio_2(D, Orden, alfa, alfa_step)   

%Obtengo la dimensi?n de los datos
[CantFilas, CantCols] = size(D);
CantAtrib = CantCols - 1;
CantPatrones = CantFilas;
Clase = CantCols;

%Parametros inicializados
MAX_ITERA = 1000;

%Hago 10 iteraciones independientes
for index = 1 : 10
    
    %Vector de pesos iniciados aleatoreamente entre 0 y 1
    W = rand(1,CantAtrib);     
    %Bias iniciado aleatoreamente entre 0 y 1
    b = rand;       

    % Mezclo los datos
    mezcla = randperm(CantPatrones); 
    M = D(mezcla,:);
    
    %Separo en 80/20 
    n = floor(CantPatrones*0.8);
    M_Train = M(1:n, :);
    M_Test = M((n+1):CantPatrones, :);
    
    
    if(Orden == 1)
        %Ordeno training
        M_Train = sortrows(M_Train, Clase);
    end
    if(Orden == 2)
        %Intercalo
        M_Train = intercalarClase(M_Train, Clase);
        
    end
    
    %Traspuesta
    M_Train = M_Train';
    M_Test = M_Test';
    
    %Separo la clase los atributos
    Patr_Train = M_Train(1:CantAtrib, :);
    Clase_Train = M_Train(Clase, :);

    %Separo la clase los atributos
    Patr_Test = M_Test(1:CantAtrib, :);
    Clase_Test = M_Test(Clase, :);
           
    [Wfinal, bfinal, itefinal] = perceptron(Patr_Train, Clase_Train, W, b, alfa, MAX_ITERA);
    
    [CantTrainCorrectos CantTrainIncorrectos] = evaluate(Patr_Train, Clase_Train, Wfinal, bfinal); 
    [CantTestCorrectos CantTestIncorrectos] = evaluate(Patr_Test, Clase_Test, Wfinal, bfinal);
    
    R(1,:) = [Orden alfa itefinal CantTrainCorrectos CantTrainIncorrectos CantTestCorrectos CantTestIncorrectos];

    dlmwrite('resultados_2.csv',R,'-append');
    alfa = alfa + alfa_step;
end


    

