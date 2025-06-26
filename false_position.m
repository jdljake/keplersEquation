%false-position method
clc; clear; %clean up console and workspace
t = 350; %time (days)
T = 687; %orbital period (days)
e = 0.0934; %orbital eccentricity
f = @(E) E -(2*pi()*t)/T - e*sin(E); %function for where root solves for E(t)
xli = 0; %initial xi val
xui = 5; %initial xu val
eps = (10^-6)/100; %eps val( converted to decimal)

xl = xli; %set xl to initial xl val
xu = xui; %set xu to initial xu val

%false-position method
xr = xl - (f(xl)*(xu-xl)/(f(xu) - f(xl))); %implement next guess xr with the false-position method
iterations = 0; % reset iterations count for each combination of initial values
error = 1000; %set error arbitrarially high to trigger >1 iteration of while loop

while abs(error) >= eps %stopping criterion is absolute val of error larger than given epsilon val
    xold = xr; %save prev xval to use in approx relative error calculation
    iterations = iterations + 1; %increment iterations

    if f(xl) * f(xr) <= 0 %check for sign change (or somehow hitting the root)
        xu = xr; %update bracket accoordingly^
    else %no sign change
        xl = xr; %update bracket accoordingly
    end

    xr = xl - (f(xl)*(xu-xl)/(f(xu) - f(xl))); %update guess accoording to false position method
    error = (xr - xold)/xr; %calc for approx relative error stop criterion
end

fprintf("False-Position Method\n")
fprintf("Initial Guesses: x_l = %g and x_u = %g\n", xli, xui)
fprintf("Epsilon: %g\n", eps)
fprintf("Number of Iterations: %g\n", iterations)  %display iterations
fprintf("Approximate E: %g\n", xr) %display found root
