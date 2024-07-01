f = @(x) x.^2-3*x.+3
x = linspace(-15,15,100)
plot(x,f(x))
roots(f(x))
