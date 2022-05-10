Minimize
    WB1n + WB1p + WC1n + WC1p + WD1n + WD1p + WT1n + WT1p
Subject To
    P0: WT1p - WT1n >= 1
    P1: WD1p - WD1n - WT1p + WT1n >= 0
    P2: WC1p - WC1n - WT1p + WT1n >= 0
    P3: WC1p - WC1n + WD1p - WD1n - WT1p + WT1n >= 0
    P4: WB1p - WB1n - WT1p + WT1n >= 0
    P5: WB1p - WB1n + WD1p - WD1n - WT1p + WT1n >= 0
    P6: WB1p - WB1n + WC1p - WC1n - WT1p + WT1n >= 0
    P7: WB1p - WB1n + WC1p - WC1n + WD1p - WD1n - WT1p + WT1n >= 0
    P8: 5 - 5 a - WB1n >= 0
    P9: 5 a - WB1p >= 0
    P10: 5 - 5 b - WC1n >= 0
    P11: 5 b - WC1p >= 0
    P12: 5 - 5 c - WD1n >= 0
    P13: 5 c - WD1p >= 0
    P14: 5 - 5 d - WT1n >= 0
    P15: 5 d - WT1p >= 0
Integer
    WB1n WB1p WC1n WC1p WD1n WD1p WT1n WT1p 
Binary
    a b c d 
End
