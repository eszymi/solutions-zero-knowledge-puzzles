pragma circom 2.1.4;

include "../node_modules/circomlib/circuits/comparators.circom";

// Create a Quadratic Equation( ax^2 + bx + c ) verifier using the below data.
// Use comparators.circom lib to compare results if equal

template QuadraticEquation() {
    signal input x;     // x value
    signal input a;     // coeffecient of x^2
    signal input b;     // coeffecient of x 
    signal input c;     // constant c in equation
    signal input res;   // Expected result of the equation
    signal output out;  // If res is correct , then return 1 , else 0 . 

    signal x2 <== x*x;
    signal ax2 <== a*x2;
    signal bx <== b*x;
    signal sum <== ax2+bx+c;

    component ise = IsEqual();
    sum ==> ise.in[0];
    res ==> ise.in[1];
    out <== ise.out;
}

component main  = QuadraticEquation();


