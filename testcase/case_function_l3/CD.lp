Minimize
    WC1n + WC1p + 2 WC2n + 2 WC2p + 3 WC3n + 3 WC3p + WD1n + WD1p + 2 WD2n + 2 WD2p + 3 WD3n + 3 WD3p + WT1n + WT1p + 2 WT2n + 2 WT2p + 3 WT3n + 3 WT3p
Subject To
    P0: 6 WT1p - 6 WT1n + 3 WT2p - 3 WT2n + 2 WT3p - 2 WT3n >= 1
    P1: 6 WD1p - 6 WD1n + 3 WD2p - 3 WD2n + 2 WD3p - 2 WD3n - 6 WT1p + 6 WT1n - 3 WT2p + 3 WT2n - 2 WT3p + 2 WT3n <= -1
    P2: 6 WC1p - 6 WC1n + 3 WC2p - 3 WC2n + 2 WC3p - 2 WC3n - 6 WT1p + 6 WT1n - 3 WT2p + 3 WT2n - 2 WT3p + 2 WT3n <= -1
    P3: 6 WC1p - 6 WC1n + 3 WC2p - 3 WC2n + 2 WC3p - 2 WC3n + 6 WD1p - 6 WD1n + 3 WD2p - 3 WD2n + 2 WD3p - 2 WD3n - 6 WT1p + 6 WT1n - 3 WT2p + 3 WT2n - 2 WT3p + 2 WT3n >= 0
    P4: 5 - 5 a - WC1n >= 0
    P5: 5 a - WC1p >= 0
    P6: 5 - 5 b - WC2n >= 0
    P7: 5 b - WC2p >= 0
    P8: 5 - 5 c - WC3n >= 0
    P9: 5 c - WC3p >= 0
    P10: 5 - 5 d - WD1n >= 0
    P11: 5 d - WD1p >= 0
    P12: 5 - 5 e - WD2n >= 0
    P13: 5 e - WD2p >= 0
    P14: 5 - 5 f - WD3n >= 0
    P15: 5 f - WD3p >= 0
    P16: 5 - 5 g - WT1n >= 0
    P17: 5 g - WT1p >= 0
    P18: 5 - 5 h - WT2n >= 0
    P19: 5 h - WT2p >= 0
    P20: 5 - 5 i - WT3n >= 0
    P21: 5 i - WT3p >= 0
Integer
    WC1n WC1p WC2n WC2p WC3n WC3p WD1n WD1p WD2n WD2p WD3n WD3p WT1n WT1p WT2n WT2p WT3n WT3p 
Binary
    a b c d e f g h i 
End
