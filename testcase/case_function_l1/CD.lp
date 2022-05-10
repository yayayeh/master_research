Minimize
    WC1n + WC1p + WD1n + WD1p + WT1n + WT1p
Subject To
    P0: WT1p - WT1n >= 1
    P1: WD1p - WD1n - WT1p + WT1n <= -1
    P2: WC1p - WC1n - WT1p + WT1n <= -1
    P3: WC1p - WC1n + WD1p - WD1n - WT1p + WT1n >= 0
    P4: 5 - 5 a - WC1n >= 0
    P5: 5 a - WC1p >= 0
    P6: 5 - 5 b - WD1n >= 0
    P7: 5 b - WD1p >= 0
    P8: 5 - 5 c - WT1n >= 0
    P9: 5 c - WT1p >= 0
Integer
    WC1n WC1p WD1n WD1p WT1n WT1p 
Binary
    a b c 
End
