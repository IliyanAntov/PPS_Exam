seed = 20 + 30
rng(seed)
data = randi(30,30)

b1 = data(:, 8);
b2 = data(7, 5:10);
total = sum(data(:, 3));

if total < 20
    b3 = data(:, 10);
end

divisibleBySix = find(data/6==0);
b4 = {};

for count = 1:length(divisibleBySix)
    b4 = [b4, data(divisibleBySix(count))];
end


