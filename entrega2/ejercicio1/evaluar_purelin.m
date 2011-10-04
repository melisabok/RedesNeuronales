function[CantCorrectos] = evaluar_purelin(P, T, W, b)


Y = purelin(W * P + b);
clases = max(T);

for clase=1:clases
    indices = Y >= (clase - 0.2) & Y <= (clase + 0.2);
    Y(indices) = clase;
end

%Calculo solo la cantidad de correctos
CantCorrectos = sum(T == Y);
%Parecidas = sum(abs(T-Y) < 0.2);

