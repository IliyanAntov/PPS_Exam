c = randi(20, 1, 12);
[a,b] = neshto(c);

disp(c);
disp(a);
disp(b);

function [mean, std] = neshto(x)
    mean = (1/length(x))*(sum(x));
    
    total = 0;
    for count = 1:length(x)
        total = total + ((x(count)-mean)^2);
    end
    std = sqrt((1/length(x))*total);
end