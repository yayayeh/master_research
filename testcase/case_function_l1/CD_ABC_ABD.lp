Minimize
    WA1n + WA1p + WB1n + WB1p + WC1n + WC1p + WD1n + WD1p + WT1n + WT1p
Subject To
    P0: WT1p - WT1n >= 1
    P1: WB1p - WB1n - WT1p + WT1n <= -1
    P2: WA1p - WA1n - WT1p + WT1n <= -1
    P3: WA1p - WA1n + WB1p - WB1n - WT1p + WT1n >= 0
    P4: WD1p - WD1n - WT1p + WT1n <= -1
    P5: WD1p - WD1n + WB1p - WB1n - WT1p + WT1n <= -1
    P6: WD1p - WD1n + WA1p - WA1n - WT1p + WT1n <= -1
    P7: WD1p - WD1n + WA1p - WA1n + WB1p - WB1n - WT1p + WT1n >= 0
    P8: WC1p - WC1n - WT1p + WT1n <= -1
    P9: WC1p - WC1n + WB1p - WB1n - WT1p + WT1n <= -1
    P10: WC1p - WC1n + WA1p - WA1n - WT1p + WT1n <= -1
    P11: WC1p - WC1n + WA1p - WA1n + WB1p - WB1n - WT1p + WT1n >= 0
    P12: WC1p - WC1n + WD1p - WD1n - WT1p + WT1n <= -1
    P13: WC1p - WC1n + WD1p - WD1n + WB1p - WB1n - WT1p + WT1n >= 0
    P14: WC1p - WC1n + WD1p - WD1n + WA1p - WA1n - WT1p + WT1n >= 0
    P15: WC1p - WC1n + WD1p - WD1n + WA1p - WA1n + WB1p - WB1n - WT1p + WT1n >= 0
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
