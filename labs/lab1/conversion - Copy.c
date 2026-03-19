/*

B2U(x), U2B(x):
    B binary <-> U means unsigned

B2T(x), T2B(x):
    B binary <-> T two's complement (signed intergral)
    can be for + or - 
    B2T(x) if first val is 1, make the first val negative
    if x < 0 
        T2B(x), formular (~( U2B(|X|) )) + 1 , ~ means complement
            or U2B(T2U(x)) -> U2B( X + 2^w )

*/
