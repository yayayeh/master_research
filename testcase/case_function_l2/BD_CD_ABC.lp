Minimize
    WA1n + WA1p + 2 WA2n + 2 WA2p + WB1n + WB1p + 2 WB2n + 2 WB2p + WC1n + WC1p + 2 WC2n + 2 WC2p + WD1n + WD1p + 2 WD2n + 2 WD2p + WT1n + WT1p + 2 WT2n + 2 WT2p
Subject To
    P0: 2 WT1p - 2 WT1n + WT2p - WT2n >= 1
    P1: 2 WA1p - 2 WA1n + WA2p - WA2n - 2 WT1p + 2 WT1n - WT2p + WT2n <= -1
    P2: 2 WC1p - 2 WC1n + WC2p - WC2n - 2 WT1p + 2 WT1n - WT2p + WT2n <= -1
    P3: 2 WC1p - 2 WC1n + WC2p - WC2n + 2 WA1p - 2 WA1n + WA2p - WA2n - 2 WT1p + 2 WT1n - WT2p + WT2n >= 0
    P4: 2 WD1p - 2 WD1n + WD2p - WD2n - 2 WT1p + 2 WT1n - WT2p + WT2n <= -1
    P5: 2 WD1p - 2 WD1n + WD2p - WD2n + 2 WA1p - 2 WA1n + WA2p - WA2n - 2 WT1p + 2 WT1n - WT2p + WT2n >= 0
    P6: 2 WD1p - 2 WD1n + WD2p - WD2n + 2 WC1p - 2 WC1n + WC2p - WC2n - 2 WT1p + 2 WT1n - WT2p + WT2n <= -1
    P7: 2 WD1p - 2 WD1n + WD2p - WD2n + 2 WC1p - 2 WC1n + WC2p - WC2n + 2 WA1p - 2 WA1n + WA2p - WA2n - 2 WT1p + 2 WT1n - WT2p + WT2n >= 0
    P8: 2 WB1p - 2 WB1n + WB2p - WB2n - 2 WT1p + 2 WT1n - WT2p + WT2n <= -1
    P9: 2 WB1p - 2 WB1n + WB2p - WB2n + 2 WA1p - 2 WA1n + WA2p - WA2n - 2 WT1p + 2 WT1n - WT2p + WT2n <= -1
    P10: 2 WB1p - 2 WB1n + WB2p - WB2n + 2 WC1p - 2 WC1n + WC2p - WC2n - 2 WT1p + 2 WT1n - WT2p + WT2n <= -1
    P11: 2 WB1p - 2 WB1n + WB2p - WB2n + 2 WC1p - 2 WC1n + WC2p - WC2n + 2 WA1p - 2 WA1n + WA2p - WA2n - 2 WT1p + 2 WT1n - WT2p + WT2n >= 0
    P12: 2 WB1p - 2 WB1n + WB2p - WB2n + 2 WD1p - 2 WD1n + WD2p - WD2n - 2 WT1p + 2 WT1n - WT2p + WT2n <= -1
    P13: 2 WB1p - 2 WB1n + WB2p - WB2n + 2 WD1p - 2 WD1n + WD2p - WD2n + 2 WA1p - 2 WA1n + WA2p - WA2n - 2 WT1p + 2 WT1n - WT2p + WT2n >= 0
    P14: 2 WB1p - 2 WB1n + WB2p - WB2n + 2 WD1p - 2 WD1n + WD2p - WD2n + 2 WC1p - 2 WC1n + WC2p - WC2n - 2 WT1p + 2 WT1n - WT2p + WT2n >= 0
    P15: 2 WB1p - 2 WB1n + WB2p - WB2n + 2 WD1p - 2 WD1n + WD2p - WD2n + 2 WC1p - 2 WC1n + WC2p - WC2n + 2 WA1p - 2 WA1n + WA2p - WA2n - 2 WT1p + 2 WT1n - WT2p + WT2n >= 0
    P16: 5 - 5 a - WA1n >= 0
    P17: 5 a - WA1p >= 0
    P18: 5 - 5 b - WA2n >= 0
    P19: 5 b - WA2p >= 0
    P20: 5 - 5 c - WB1n >= 0
    P21: 5 c - WB1p >= 0
    P22: 5 - 5 d - WB2n >= 0
    P23: 5 d - WB2p >= 0
    P24: 5 - 5 e - WC1n >= 0
    P25: 5 e - WC1p >= 0
    P26: 5 - 5 f - WC2n >= 0
    P27: 5 f - WC2p >= 0
    P28: 5 - 5 g - WD1n >= 0
    P29: 5 g - WD1p >= 0
    P30: 5 - 5 h - WD2n >= 0
    P31: 5 h - WD2p >= 0
    P32: 5 - 5 i - WT1n >= 0
    P33: 5 i - WT1p >= 0
    P34: 5 - 5 j - WT2n >= 0
    P35: 5 j - WT2p >= 0
Integer
    WA1n WA1p WA2n WA2p WB1n WB1p WB2n WB2p WC1n WC1p WC2n WC2p WD1n WD1p WD2n WD2p WT1n WT1p WT2n WT2p 
Binary
    a b c d e f g h i j 
End
