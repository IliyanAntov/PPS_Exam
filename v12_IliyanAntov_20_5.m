x = linspace(-1, 1, 1000);


lessThanOne = find(x<0);
y = []

for count = 1:length(lessThanOne)
    y = [y, sin(1/(1-x(lessThanOne(count))^(1/6)))];
end


for count2 = length(lessThanOne):(length(x)-1)
     y = [y, 4*cos(x(count2)^2)];
end

noise = rand(1, 1000);
z = y + noise

plot(x, y);
subplot(x, z, h);

