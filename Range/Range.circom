pragma circom 2.1.4;

// In this exercise , we will learn how to check the range of a private variable and prove that 
// it is within the range . 

// For example we can prove that a certain person's income is within the range
// Declare 3 input signals `a`, `lowerbound` and `upperbound`.
// If 'a' is within the range, output 1 , else output 0 using 'out'

template Num2Bits(n) {
    signal input in;
    signal output out[n];
    var lc1=0;

    var e2=1;
    for (var i = 0; i<n; i++) {
        out[i] <-- (in >> i) & 1;
        out[i] * (out[i] -1 ) === 0;
        lc1 += out[i] * e2;
        e2 = e2+e2;
    }

    lc1 === in;
}
template LessThan() {
    signal input in[2];
    signal output out;

    var n = 50;
    component n2b = Num2Bits(n+1);

    n2b.in <== in[0]+ (1<<n) - in[1];

    out <== 1-n2b.out[n];

}
template Range() {
    signal input a;
    signal input lowerbound;
    signal input upperbound;
    signal output out;

    component less = LessThan();
    signal con1;
    lowerbound ==> less.in[0];
    a ==> less.in[1];
    con1 <== less.out;

    component less2 = LessThan();
    signal con2;
    a ==> less2.in[0];
    upperbound ==> less2.in[1];
    con2 <== less2.out;

    out <== con1*con2;
   
}

component main  = Range();


