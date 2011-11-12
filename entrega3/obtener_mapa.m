function[mapa] = obtener_mapa(fil_ocultas, col_ocultas, clases)

fid=fopen('mapa.csv','A');

mapa = cell(fil_ocultas, col_ocultas);
ocultas = fil_ocultas * col_ocultas;
for nro = 1:ocultas 
    texto = ''; 
    for cl = 1:length(clases(1,:)) 
        if clases(nro, cl) > 0 
            if ~isempty(texto)
                texto = strcat(texto, ' ; '); 
            end 
            textoA = sprintf('c%d->%d', cl, clases(nro,cl));
            texto= [texto textoA];
        end; 
    end; 
    fila = fil_ocultas -floor( (nro-1)/col_ocultas ); 
    col  = mod( (nro-1), col_ocultas ) + 1; 
    mapa(fila,col) = {[texto]};
    fprintf(fid,'%s,',texto);
    if (col == col_ocultas)
        fprintf(fid, '\n');
    end
end; 

fclose(fid);

end