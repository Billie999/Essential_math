
function[x,y] = randXY(N)

x = rand(N,1);

    noise = 2*randn(N,1);
    
    y = 5*x + 3 + noise;

end


