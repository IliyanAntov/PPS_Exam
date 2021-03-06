loaded_data = load("espDataFC_414_abs_meters"); % Зареждане на данни
raw_data_table = loaded_data.esp; % Извеждане на таблицата

gyroz = raw_data_table.gyroz;
time = raw_data_table.time;

%%%%%%%%%%%%%%Task 1%%%%%%%%%%%%%%%

figure(1)
plot(time, gyroz); % Изчертаване на необработените данни от колона gyroz спрямо времето
title('Графика 1 - данни от сензора'); % Заглавие на фигурата
xlabel('Time, μs'); % Надпис на абсцисата
ylabel('Raw sensor readings'); % Надпис на ординатата
legend('Жироскоп по оста Z'); % Легенда за графиката

%%%%%%%%%%%%End task 1%%%%%%%%%%%%%

%%%%%%%%%%%%%%Task 2%%%%%%%%%%%%%%%

% Времето се дели на 10^6, тъй като е в μs, а графиката трябва да е в Hz
Ts = mean(diff(time/(10^6))); % Изчисляване на периода на дискретизация
Fs = 1/Ts; % Изчисляване на честотата на дискретизация (f = 1/T)
L = length(gyroz); % Извеждане на дължината на вектора с данни

FFT_result = fft(gyroz); % Анализ на фурие за данните в gyroz
P2 = abs(FFT_result/L); % Изчисляване на двустранен спектър 
P1 = P2(1:floor(L/2)+1); % Извеждане на едностранен спектър (Първата половина от елементите на P2)
P1(2:end-1) = 2*P1(2:end-1); % Удвояване на стойностите в P1 (Тъй като 1/2 от енергията се съдържа в огледалната половина от спектъра)

% Тъй като използваме loglog() за изчертаване на Фурие анализа, за да се
% изобрази първата стойност (f(1), т.е. при 0 Hz) в графиката, е необходимо да се изместят
% стойностите ((0:L/2)/L става (1:(L/2+1))/L). В противен случай първата
% стойност на f е 0 Hz (f(1) == 0), а log(0) не е дефиниран. 
% Трябва да се има предвид, че при такова решение графиката се измества надясно
f = Fs*(1:floor(L/2)+1)/L; % Изчисляване на стойности за абсцисата (до Fs/2)


figure(2); % Промяна на фигурата (За да бъде изчертана в нов прозорец)
loglog(f, P1); % Изчертаване на фурие анализа за gyroz
title('Графика 2 - честотен спектър на жироскопа в колона gyroz'); % Заглавие на фигурата
xlabel('f, Hz'); % Надпис на абсцисата
ylabel('|P1(f)|'); % Надпис на ординатата

%%%%%%%%%%%%End task 2%%%%%%%%%%%%%
