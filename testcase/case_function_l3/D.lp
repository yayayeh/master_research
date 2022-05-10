Minimize
    WD1n + WD1p + 2 WD2n + 2 WD2p + 3 WD3n + 3 WD3p + WT1n + WT1p + 2 WT2n + 2 WT2p + 3 WT3n + 3 WT3p
Subject To
    P0: 6 WT1p - 6 WT1n + 3 WT2p - 3 WT2n + 2 WT3p - 2 WT3n >= 1
    P1: 6 WD1p - 6 WD1n + 3 WD2p - 3 WD2n + 2 WD3p - 2 WD3n - 6 WT1p + 6 WT1n - 3 WT2p + 3 WT2n - 2 WT3p + 2 WT3n >= 0
    P2: 5 - 5 a - WD1n >= 0
    P3: 5 a - WD1p >= 0
    P4: 5 - 5 b - WD2n >= 0
    P5: 5 b - WD2p >= 0
    P6: 5 - 5 c - WD3n >= 0
    P7: 5 c - WD3p >= 0
    P8: 5 - 5 d - WT1n >= 0
    P9: 5 d - WT1p >= 0
    P10: 5 - 5 e - WT2n >= 0
    P11: 5 e - WT2p >= 0
    P12: 5 - 5 f - WT3n >= 0
    P13: 5 f - WT3p >= 0
Integer
    WD1n WD1p WD2n WD2p WD3n WD3p WT1n WT1p WT2n WT2p WT3n WT3p 
Binary
    a b c d e f 
End
