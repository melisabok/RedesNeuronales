function[CantCorrectos, CantIncorrectos] = evaluate(P, T, W, b)

[CantAtrib, CantPatrones] = size(P);
y = hardlim(W * P + b);

CantCorrectos = sum((T == y));

%fprintf('Cantidad de patrones bien clasificados = ');
%fprintf('%d \n', CantCorrectos)

CantIncorrectos = CantPatrones - CantCorrectos;
%fprintf('Quedaron mal clasificados = ')
%fprintf('%d \n', CantIncorrectos)

