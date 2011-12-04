function [h1, h2] = cruzar_y_mutar(Pop,p1,p2,pcross,pmutation)
[long, col] = size(Pop);
%ver si corresponde aplicar crossover
hayCrossover = ((pcross==1) | (rand<=pcross));

if hayCrossover,   
    posicion = round(rand * (long-2)) + 1;
else
    posicion = long;
end

for i=1:1:posicion,
  h1(i,1) = mutar(Pop(i,p1),pmutation);
  h2(i,1) = mutar(Pop(i,p2),pmutation);
end

if hayCrossover,
  fprintf('Hay crossover en %d', posicion);  
  for i=posicion+1:1:long,
     h1(i,1) = mutar(Pop(i,p2),pmutation);
     h2(i,1) = mutar(Pop(i,p1),pmutation);
  end
end  