function[p1, p2] = seleccionar_padres(Fitness, conSobranteEstocastico)

    if (conSobranteEstocastico == 1)
        P = seleccionar_estocastico(Fitness, 2);
        p1 = P(1);
        p2 = P(2);
    else
        p1 = select(Fitness);
        p2 = select(Fitness);  
    end
end