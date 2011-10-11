% Backpropagation
% redes neuronales con una sola capa oculta
function[w1, b1, w2, b2] = bpn(P, T, alfa, CotaError, MAX_ITE, FuncionOculta, FuncionSalida, Ocultas, Salidas)


% Inicializar la red 
[Entradas, CantPatrones] = size(P);
w1 = rand(Ocultas,Entradas) - 0.5 * ones(Ocultas,Entradas); 
b1 = rand(Ocultas,1) - 0.5 * ones(Ocultas,1); 
 
w2 = rand(Salidas,Ocultas) - 0.5 * ones(Salidas, Ocultas); 
b2 = rand(Salidas,1) - 0.5 * ones(Salidas,1);

AVGError = 1;
itera = 0;

while ( AVGError > CotaError ) & ( itera <= MAX_ITE  )  
    itera = itera + 1;
    AVGError = 0;
    for patr=1:CantPatrones; 
      % Calcular el error de c/u de las neuronas de salida  
      % Calcular el error de c/u de la neuronas ocultas 
      
      neta_oculta = w1*P(:,patr) + b1;
      f_neta_oculta = feval(FuncionOculta, neta_oculta);
      
      neta_salida = w2 * f_neta_oculta + b2; 
      f_neta_salida = feval(FuncionSalida, neta_salida); 
      
      
      % Multiplico por la derivada de la funcion de salida
      ErrorSalida = (T(:,patr) - f_neta_salida);
      DeltaSalida = feval([ 'd' FuncionSalida], neta_salida, f_neta_salida).* ErrorSalida;
      DeltaOculta = feval([ 'd' FuncionOculta], neta_oculta, f_neta_oculta).* (w2' * ErrorSalida);
      
      AVGError = AVGError + sum(ErrorSalida .^2);
   
      % actualizar los pesos (W y B)
      w2 = w2 + alfa * DeltaSalida * f_neta_oculta'; 
      b2 = b2 + alfa * DeltaSalida; 
    
      w1 = w1 + alfa * DeltaOculta * P(:,patr)' ; 
      b1 = b1 + alfa * DeltaOculta;
      
   end; 
   [itera AVGError]
end; 
% 
% NETA_OCULTA = (w1 * P) + b1 * ones(1, CantPatrones);
% F_NETA_OCULTA = feval(FuncionOculta, NETA_OCULTA);
% 
% NETA_SALIDA = w2 * F_NETA_OCULTA + b2 * ones(1, CantPatrones); 
% F_NETA_SALIDA = feval(FuncionSalida, NETA_SALIDA);
% 
% unos = F_NETA_SALIDA >= 0.8;
% menosunos = F_NETA_SALIDA <= -0.8;
% F_NETA_SALIDA(unos)=1;
% F_NETA_SALIDA(menosunos)=-1;
% 
% correctos = T2 == 1;
% cantidad = sum( F_NETA_SALIDA(correctos) == 1);
% 
% fprintf('Resultados:');
% R = [alfa itera AVGError cantidad (CantPatrones - cantidad)];
% dlmwrite('bpn_vinos.csv',R,'-append');


