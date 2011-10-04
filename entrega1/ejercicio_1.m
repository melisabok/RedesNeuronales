function[] = ejercicio_1(P, T) 

MAX_ITERA = 4000;

alfa = 0;
alfa_step_size = 0.01;
alfa_step_count = 30;
alfa_step = 0;

converge = 0;

while alfa_step < alfa_step_count && (converge == 0)
    
    W = rand(1,4);     
    b = rand;      
    fprintf('Weight original\n');
    W

    alfa = alfa + alfa_step_size;

    [Wfinal, bfinal, itefinal] = perceptron(P, T, W, b, alfa, MAX_ITERA);
    [CantCorrectos CantIncorrectos] = evaluate(P, T, Wfinal, bfinal);
        
    fprintf('Weight final\n');
    Wfinal
        
    fprintf('Resultados para alfa = %.2f\n', alfa);
    [itefinal CantCorrectos CantIncorrectos]
        
    alfa_step = alfa_step + 1;    
end
    

