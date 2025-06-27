# Numerical Methods for Solving Kepler's Equation

This project investigates and implements various numerical root-finding methods to approximate solutions to Kepler's equation of orbital mechanics. The equation relates the eccentic anomoly ($E$) of an orbiting body to its mean anomaly ($M$), orbital eccentricity ($e$), and orbital period ($T$) at a given time ($t$).
<p align="center">
<img src="https://upload.wikimedia.org/wikipedia/commons/a/aa/Classical_Kepler_orbit_e0.6.gif?20080111093917" width="250px">
</p>

## Introduction 

Kepler's Equation is given by:
### $M = E - e \sin(E)$

where:
- $M = \frac{2\pi t}{T}$ is the Mean Anomaly (proportional to time, $t$, and orbital period, $T$)
- $E$ is the Eccentric Anomaly, the angle that defines the position of a body on an elliptical orbit
- $e$ is the orbital eccentricity

This equation is transcendental and cannot be solved for $E$ analytically. Therefore, we utilize numerical methods to determine the eccentric anomaly.

## Methods Implemented
I implemented four root-finding methods for comparison:
1. ### Bisection method (bisection.m)
    - This is a bracketing method based on repeatedly halving the interval \[ $x_{l}$, $x_{u}$ ]
    - Keeps bracket containing sign change where $f(x_{l})$ and $f(x_{u})$ have opposite signs. 
    - Based stoping criterion on absolute error
2. ### False-Position Method (false_position.m)
    - This is a bracketing method which estimates the root by drawing a secant line between points $(x_{l},f(x_{l}))$ and $(x_{u},f(x_{u}))$ and determining where an extension of this line intersects the x-axis.
    - Tends to converge faster than Bisection Method
    - Still requires initial bracket
    - Kept absolute error stopping criterion
4. ### Newton-Raphson Method (newton_raphson.m)
    - This is an open method which uses the derivative of the function to find increasingly better approximations to a root. It projects the tangent line for the current guess to the x-axis to find the next guess.
    - Requires initial guess $x_{0}$ and the derivative $f'(E)$
    - Can converge very quickly if the initial guess is close to the root, but convergence is not guaranteed
    - Based stopping criterion on approximate relative error 
6. ### Secant Method (secant.m)
    - This is an open method similar to Newton-Raphson, but it approximates the derivative using a finite difference. This is useful when the derivative is difficult to calculate analytically or unknown.
    - Requires two initial guesses $(x_{0}, x_{1})$
    - Generally faster than linear methods like Bisection but slower than Newton-Raphson
    - Convergence is not guaranteed
    - Stopping criterion based on approximate relative error again

## Implementation Details

Each script calculates the approximated value of $E$ for the given parameters:
- $t = 350$ days
- $T = 687$ days
- $e = 0.0934$ 
Each script prints:
- initial guesses or bracket
- the specified error tolerance ($\epsilon = 10^{-8)}$
- \# of iterations required
- the final approximate value of $E$

## How to Run
All files are MATLAB (.m) files, and should run in any current verison of MATLAB. If you don't have MATLAB installed, you can use an online compiler for Octave which I understand to be mostly compatible with MATLAB: [Online Octave Compiler](https://www.mycompiler.io/online-octave-matlab-compiler)

## Results

Bisection method was clearly slower than the others with 28 iterations. False-position, Newton-Raphson, and secant method all performed about the same as each other with 4-5 iterations, all successfully converging on a root. This shows the ‘slow but steady’ nature of bisection method. While guaranteed to converge, it takes significantly longer as it is blind to features of the function that can help make stronger guesses, unlike the other methods.

I graphed the function to visualize where I expected the root to be, which allowed me to
make reasonable initial guesses, which was especially helpful for the open methods that are
more sensitive to said initial guesses. This also helped me avoid getting trapped in low-gradient
zones which could prevent convergence with the false-position method, for example. Different initial conditions will change the quality of results (in terms of number of iterations) for these methods, but because the function is pretty generally near linear and without low-gradient zones, I would expect all the used open methods to perform in pretty much the same way relative to each other.



