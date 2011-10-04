function[CantCorrectos] = evaluar_tansig(P, T, W, b)


Y = tansig(W * P + b);
unos = Y >= 0.8;
menosunos = Y <= -0.8;
Y(unos)=1;
Y(menosunos)=-1;

%Calculo solo la cantidad de correctos
CantCorrectos = sum(T == Y);
%Parecidas = sum(abs(T-Y) < 0.2);

