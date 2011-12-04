function NewAlelo = mutar( Alelo, probabilidad)
%muta el ALELO con la probabilidad inidicada
if (probabilidad==1) | (rand<=probabilidad),
    % hay mutacion, veo si sumo o resto
    if (rand <= 0.5)
        NewAlelo = Alelo + 1;
    else
        NewAlelo = Alelo - 1;
    end
else
    NewAlelo = Alelo;
end 