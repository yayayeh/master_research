Minimize
    WC1n + WC1p + 2 WC2n + 2 WC2p + WD1n + WD1p + 2 WD2n + 2 WD2p + WT1n + WT1p + 2 WT2n + 2 WT2p
Subject To
    P0: 2 WT1p - 2 WT1n + WT2p - WT2n >= 1
    P1: 2 WD1p - 2 WD1n + WD2p - WD2n - 2 WT1p + 2 WT1n - WT2p + WT2n >= 0
    P2: 2 WC1p - 2 WC1n + WC2p - WC2n - 2 WT1p + 2 WT1n - WT2p + WT2n >= 0
    P3: 2 WC1p - 2 WC1n + WC2p - WC2n + 2 WD1p - 2 WD1n + WD2p - WD2n - 2 WT1p + 2 WT1n - WT2p + WT2n >= 0
    P4: 5 - 5 a - WC1n >= 0
    P5: 5 a - WC1p >= 0
    P6: 5 - 5 b - WC2n >= 0
    P7: 5 b - WC2p >= 0
    P8: 5 - 5 c - WD1n >= 0
    P9: 5 c - WD1p >= 0
    P10: 5 - 5 d - WD2n >= 0
    P11: 5 d - WD2p >= 0
    P12: 5 - 5 e - WT1n >= 0
    P13: 5 e - WT1p >= 0
    P14: 5 - 5 f - WT2n >= 0
    P15: 5 f - WT2p >= 0
Integer
    WC1n WC1p WC2n WC2p WD1n WD1p WD2n WD2p WT1n WT1p WT2n WT2p 
Binary
    a b c d e f 
End
