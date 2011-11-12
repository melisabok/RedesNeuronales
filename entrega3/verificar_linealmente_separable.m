function[R] = verificar_linealmente_separable(Train, clase)

[CantPatrones, Cols] = size(Train);

P_esc = escalar(Train,2:Cols); 

P_esc_mezc = mezclar(P_esc);

% Separo en matriz de patrones y vector de clase
P = P_esc_mezc(:, 2:Cols);
NroClase = P_esc_mezc(:,1);
P = P';

% Armo el vector T con valor 1 solo en los patrones que tiene como valor
% el parametro clase
T = zeros(1, CantPatrones);
for i=1:CantPatrones
    if(NroClase(i) == clase)
        T(i) = 1;
    end
end

W = 0.5*rand(1, Cols-1);
b = 0.5*rand;
alfa = 0.05;
MAX_ITERA = 1000;

[W, b, ite] = perceptron(P, T, W, b, alfa, MAX_ITERA);
[CantCorrectos, CantIncorrectos] = evaluate(P, T, W, b);
R = [CantCorrectos, ite];

end