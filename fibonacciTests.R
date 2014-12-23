fib <- function(n) {
  if (n<2) n else
    fib(n-1)+fib(n-2)
}
fibR  <- function(n) ifelse(n<2, n, fibR(n-1)+fibR(n-2))

system.time(fibR(25))
library(rbenchmark)
library(Rcpp)
benchmark(fib(25), fibCpp(25))

cppFunction('int fibCpp(int n) { 
  if (n < 2) return(n);  
  return(fibCpp(n-1) + fibCpp(n-2));  
  }')

