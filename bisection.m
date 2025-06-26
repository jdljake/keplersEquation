%bisection method solution
clc; clear;
t = 350;
T = 687; %orbital period (days)
e = 0.0934; %orbital eccentricity
f = @(E) E -(2*pi()*t)/T - e*sin(E);
eps = (10^-6)/100;

grid on
hold on
set(gca, 'XAxisLocation', 'origin') %frame the grid more conventionally
set(gca, 'YAxisLocation', 'origin') %^^

range = 0:10;
plot(range, f(range))

xli = 0;
xui = 5;
xl = xli;
xu = xui;
xr = (xl+xu)/2;
iterations = 0; % set iterations to be incremented later
error = 1000; %high so while loop will run >=1 times


while abs(error) >= eps %stopping criterion
    xold = xr; %save prev xr guess to use with approximate relative error calculation
    iterations = iterations + 1; %increment iterations
    
    if f(xl) * f(xr) <= 0 %check for sign change in lower bracket
        xu = xr; %update bracket accoordingly
    else %no sign change in lower bracker
        xl = xr; %update bracket accoordingly
    end
    
    xr = (xl+xu)/2; %update guess accoording to the bisection method    
    error = (xr - xold); %calculate approximate relative error
end

scatter(xr, f(xr), 'o')

fprintf("Bisection Method\n")
fprintf("Initial Bracket: xl=%g, xu=%g\n", xli, xui)
fprintf("Epsilon: %g\n", eps)
fprintf("Number of Iterations: %g\n", iterations)
fprintf("Approximate E: %g\n", xr)
