Minimize
    WD1n + WD1p + 2 WD2n + 2 WD2p + 3 WD3n + 3 WD3p + 4 WD4n + 4 WD4p + WT1n + WT1p + 2 WT2n + 2 WT2p + 3 WT3n + 3 WT3p + 4 WT4n + 4 WT4p
Subject To
    P0: 24 WT1p - 24 WT1n + 12 WT2p - 12 WT2n + 8 WT3p - 8 WT3n + 6 WT4p - 6 WT4n >= 1
    P1: 24 WD1p - 24 WD1n + 12 WD2p - 12 WD2n + 8 WD3p - 8 WD3n + 6 WD4p - 6 WD4n - 24 WT1p + 24 WT1n - 12 WT2p + 12 WT2n - 8 WT3p + 8 WT3n - 6 WT4p + 6 WT4n >= 0
    P2: 5 - 5 a - WD1n >= 0
    P3: 5 a - WD1p >= 0
    P4: 5 - 5 b - WD2n >= 0
    P5: 5 b - WD2p >= 0
    P6: 5 - 5 c - WD3n >= 0
    P7: 5 c - WD3p >= 0
    P8: 5 - 5 d - WD4n >= 0
    P9: 5 d - WD4p >= 0
    P10: 5 - 5 e - WT1n >= 0
    P11: 5 e - WT1p >= 0
    P12: 5 - 5 f - WT2n >= 0
    P13: 5 f - WT2p >= 0
    P14: 5 - 5 g - WT3n >= 0
    P15: 5 g - WT3p >= 0
    P16: 5 - 5 h - WT4n >= 0
    P17: 5 h - WT4p >= 0
Integer
    WD1n WD1p WD2n WD2p WD3n WD3p WD4n WD4p WT1n WT1p WT2n WT2p WT3n WT3p WT4n WT4p 
Binary
    a b c d e f g h 
End
