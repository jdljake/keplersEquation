%Newton-Raphson method

clc; clear;
t = 350; %time (days)
T = 687; %orbital period (days)
e = 0.0934; %orbital eccentricity
f = @(E) E -(2*pi()*t)/T - e*sin(E); %function for where root solves for E(t)
%TODO DERIVATIVE
g = @(E) 1 - 467*cos(E)/5000; %derivative of function f
range = 0:0.1:5; %set range of x vals
eps = (10^-6)/100;

x0 = 6; %initial guesses

xi = x0; %rename xi for use later
x_next = xi; % set up initial xi to get thru start of while loop
iterations = 0; % reset iterations for each initial guess
error = 1000;
while abs(error) >= eps && iterations < 1000 %set epsilon params for convergence and max iterations
    iterations = iterations + 1; %increment iterations
    x_next = xi - f(xi)/g(xi); %find next guess based on newton-raphson method
    error = (x_next - xi)/x_next;
    xi = x_next; %update xi
end

fprintf("Newton-Raphson Method\n")
fprintf("Initial Guess: %g\n", x0) %display init guess root
fprintf("Epsilon: %g\n", eps) %display eps val
fprintf("Iterations: %g\n", iterations) %display iterations
fprintf("Approximate E: %g\n", x_next) %display root
