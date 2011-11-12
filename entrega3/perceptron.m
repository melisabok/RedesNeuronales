function[W, b, ite] = perceptron(P, T, W, b, alfa, MAX_ITERA)

%% Algoritmo del perceptron
[CantAtrib, CantPatrones] = size(P);
ite = 0;
todoBien = 0;

%fprintf('Parametros: %.2f %.2f  %d\n', b, alfa, MAX_ITERA);

while (ite<MAX_ITERA) && (todoBien == 0)
    ite=ite+1;
    todoBien = 1;
    for patr = 1 : CantPatrones
        neta = W * P(:,patr) + b;
        y = hardlim(neta);
        if T(patr) ~= y
            todoBien = 0;

            W = W + alfa * (T(patr)-y)*P(:,patr)';

            b = b + alfa*(T(patr)-y);
        end
    end
end


%fprintf('Weight resultante');
%W
%fprintf('b resultante %.2f\n', b);

%fprintf('MAX_ITERA %.2f\n', ite);


