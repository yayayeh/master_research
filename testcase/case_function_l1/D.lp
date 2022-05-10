Minimize
    WD1n + WD1p + WT1n + WT1p
Subject To
    P0: WT1p - WT1n >= 1
    P1: WD1p - WD1n - WT1p + WT1n >= 0
    P2: 5 - 5 a - WD1n >= 0
    P3: 5 a - WD1p >= 0
    P4: 5 - 5 b - WT1n >= 0
    P5: 5 b - WT1p >= 0
Integer
    WD1n WD1p WT1n WT1p 
Binary
    a b 
End
