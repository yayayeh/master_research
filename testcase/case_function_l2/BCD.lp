Minimize
    WB1n + WB1p + 2 WB2n + 2 WB2p + WC1n + WC1p + 2 WC2n + 2 WC2p + WD1n + WD1p + 2 WD2n + 2 WD2p + WT1n + WT1p + 2 WT2n + 2 WT2p
Subject To
    P0: 2 WT1p - 2 WT1n + WT2p - WT2n >= 1
    P1: 2 WD1p - 2 WD1n + WD2p - WD2n - 2 WT1p + 2 WT1n - WT2p + WT2n <= -1
    P2: 2 WC1p - 2 WC1n + WC2p - WC2n - 2 WT1p + 2 WT1n - WT2p + WT2n <= -1
    P3: 2 WC1p - 2 WC1n + WC2p - WC2n + 2 WD1p - 2 WD1n + WD2p - WD2n - 2 WT1p + 2 WT1n - WT2p + WT2n <= -1
    P4: 2 WB1p - 2 WB1n + WB2p - WB2n - 2 WT1p + 2 WT1n - WT2p + WT2n <= -1
    P5: 2 WB1p - 2 WB1n + WB2p - WB2n + 2 WD1p - 2 WD1n + WD2p - WD2n - 2 WT1p + 2 WT1n - WT2p + WT2n <= -1
    P6: 2 WB1p - 2 WB1n + WB2p - WB2n + 2 WC1p - 2 WC1n + WC2p - WC2n - 2 WT1p + 2 WT1n - WT2p + WT2n <= -1
    P7: 2 WB1p - 2 WB1n + WB2p - WB2n + 2 WC1p - 2 WC1n + WC2p - WC2n + 2 WD1p - 2 WD1n + WD2p - WD2n - 2 WT1p + 2 WT1n - WT2p + WT2n >= 0
    P8: 5 - 5 a - WB1n >= 0
    P9: 5 a - WB1p >= 0
    P10: 5 - 5 b - WB2n >= 0
    P11: 5 b - WB2p >= 0
    P12: 5 - 5 c - WC1n >= 0
    P13: 5 c - WC1p >= 0
    P14: 5 - 5 d - WC2n >= 0
    P15: 5 d - WC2p >= 0
    P16: 5 - 5 e - WD1n >= 0
    P17: 5 e - WD1p >= 0
    P18: 5 - 5 f - WD2n >= 0
    P19: 5 f - WD2p >= 0
    P20: 5 - 5 g - WT1n >= 0
    P21: 5 g - WT1p >= 0
    P22: 5 - 5 h - WT2n >= 0
    P23: 5 h - WT2p >= 0
Integer
    WB1n WB1p WB2n WB2p WC1n WC1p WC2n WC2p WD1n WD1p WD2n WD2p WT1n WT1p WT2n WT2p 
Binary
    a b c d e f g h 
End
