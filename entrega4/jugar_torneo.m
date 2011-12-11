function[ganador] = jugar_torneo(prob, p1, fitness1, p2, fitness2)

value = rand();

if(fitness1 > fitness2)
    masApto = p1;
    menosApto = p2;
else
    masApto = p2;
    menosApto = p1;
end

if(value <= prob)
    ganador = masApto;
else
    ganador = menosApto;
end
end