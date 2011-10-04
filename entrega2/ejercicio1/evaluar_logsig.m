function[CantCorrectos] = evaluar_logsig(P, T, W, b)


Y = logsig(W * P + b);
unos = Y >= 0.8;
ceros = Y <= 0.2;
Y(unos)=1;
Y(ceros)=0;

%Calculo solo la cantidad de correctos
CantCorrectos = sum(T == Y);
%Parecidas = sum(abs(T-Y) < 0.2);

