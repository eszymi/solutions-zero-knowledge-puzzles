pragma circom 2.1.4;

// Input 3 values using 'a'(array of length 3) and check if they all are equal.
// Return using signal 'c'.

template IsZero() {
    signal input in;
    signal output out;

    signal inv;

    inv <-- in!=0 ? 1/in : 0;

    out <== -in*inv +1;
    in*out === 0;
}

template Equality() {
   signal input a[3];
   signal output c;

   component isz = IsZero();

   a[0] - a[1] ==> isz.in;
   signal dif1;
   dif1 <== isz.out;

   component isz2 = IsZero();
   a[1] - a[2] ==> isz2.in;
   signal dif2;
   dif2 <== isz2.out;

   c <== dif1*dif2;

   
}

component main = Equality();