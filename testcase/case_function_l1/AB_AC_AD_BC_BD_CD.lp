Minimize
    WA1n + WA1p + WB1n + WB1p + WC1n + WC1p + WD1n + WD1p + WT1n + WT1p
Subject To
    P0: WT1p - WT1n >= 1
    P1: WD1p - WD1n - WT1p + WT1n <= -1
    P2: WC1p - WC1n - WT1p + WT1n <= -1
    P3: WC1p - WC1n + WD1p - WD1n - WT1p + WT1n >= 0
    P4: WB1p - WB1n - WT1p + WT1n <= -1
    P5: WB1p - WB1n + WD1p - WD1n - WT1p + WT1n >= 0
    P6: WB1p - WB1n + WC1p - WC1n - WT1p + WT1n >= 0
    P7: WB1p - WB1n + WC1p - WC1n + WD1p - WD1n - WT1p + WT1n >= 0
    P8: WA1p - WA1n - WT1p + WT1n <= -1
    P9: WA1p - WA1n + WD1p - WD1n - WT1p + WT1n >= 0
    P10: WA1p - WA1n + WC1p - WC1n - WT1p + WT1n >= 0
    P11: WA1p - WA1n + WC1p - WC1n + WD1p - WD1n - WT1p + WT1n >= 0
    P12: WA1p - WA1n + WB1p - WB1n - WT1p + WT1n >= 0
    P13: WA1p - WA1n + WB1p - WB1n + WD1p - WD1n - WT1p + WT1n >= 0
    P14: WA1p - WA1n + WB1p - WB1n + WC1p - WC1n - WT1p + WT1n >= 0
    P15: WA1p - WA1n + WB1p - WB1n + WC1p - WC1n + WD1p - WD1n - WT1p + WT1n >= 0
    P16: 5 - 5 a - WA1n >= 0
    P17: 5 a - WA1p >= 0
    P18: 5 - 5 b - WB1n >= 0
    P19: 5 b - WB1p >= 0
    P20: 5 - 5 c - WC1n >= 0
    P21: 5 c - WC1p >= 0
    P22: 5 - 5 d - WD1n >= 0
    P23: 5 d - WD1p >= 0
    P24: 5 - 5 e - WT1n >= 0
    P25: 5 e - WT1p >= 0
Integer
    WA1n WA1p WB1n WB1p WC1n WC1p WD1n WD1p WT1n WT1p 
Binary
    a b c d e 
End
