Minimize
    WD1n + WD1p + 2 WD2n + 2 WD2p + WT1n + WT1p + 2 WT2n + 2 WT2p
Subject To
    P0: 2 WT1p - 2 WT1n + WT2p - WT2n >= 1
    P1: 2 WD1p - 2 WD1n + WD2p - WD2n - 2 WT1p + 2 WT1n - WT2p + WT2n >= 0
    P2: 5 - 5 a - WD1n >= 0
    P3: 5 a - WD1p >= 0
    P4: 5 - 5 b - WD2n >= 0
    P5: 5 b - WD2p >= 0
    P6: 5 - 5 c - WT1n >= 0
    P7: 5 c - WT1p >= 0
    P8: 5 - 5 d - WT2n >= 0
    P9: 5 d - WT2p >= 0
Integer
    WD1n WD1p WD2n WD2p WT1n WT1p WT2n WT2p 
Binary
    a b c d 
End
