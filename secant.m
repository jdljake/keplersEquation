%secant method
clc; clear; % clean workspace and console
t = 350; %time (days)
T = 687; %orbital period (days)
e = 0.0934; %orbital eccentricity
f = @(E) E -(2*pi()*t)/T - e*sin(E); %function for where root solves for E(t)
x0 = 0; %save initial guess
x1 = 5; %save initial guess
eps = (10^-6)/100; %eps val converted to percent

xi = x1; %rename to xi for easier readability later
xi_minus1 = x0; %rename to iminus1 just easier for me to keep track of

%secant method
x_next = xi - (f(xi)*(xi-xi_minus1)/(f(xi) - f(xi_minus1))); %update x_next guess accoording to the secant method
iterations = 0; %reset iteration count for each init guess combo
error = 1000;
while abs(error) >= eps && iterations < 1000 %stopping criteria of function abs val against my chosen epsilon val 0.01 and setting max iterations
    iterations = iterations + 1; %increment iterations count

    x_next = xi - (f(xi)*(xi-xi_minus1)/(f(xi) - f(xi_minus1))); %update guess accoording to secant method
    xi_minus1 = xi; %update previous xi val
    error = (x_next - xi)/x_next;
    xi = x_next; %update current xi value
end
fprintf("Newton-Raphson method\n")
fprintf("Initial Guesses: x0=%g, x1=%g\n", x0, x1)
fprintf("Epsilon: %g\n", eps)
fprintf("Iterations: %g\n", iterations); %display iteration count
fprintf("Approximate E: %g\n", x_next); %display found root
