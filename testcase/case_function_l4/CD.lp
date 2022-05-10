Minimize
    WC1n + WC1p + 2 WC2n + 2 WC2p + 3 WC3n + 3 WC3p + 4 WC4n + 4 WC4p + WD1n + WD1p + 2 WD2n + 2 WD2p + 3 WD3n + 3 WD3p + 4 WD4n + 4 WD4p + WT1n + WT1p + 2 WT2n + 2 WT2p + 3 WT3n + 3 WT3p + 4 WT4n + 4 WT4p
Subject To
    P0: 24 WT1p - 24 WT1n + 12 WT2p - 12 WT2n + 8 WT3p - 8 WT3n + 6 WT4p - 6 WT4n >= 1
    P1: 24 WD1p - 24 WD1n + 12 WD2p - 12 WD2n + 8 WD3p - 8 WD3n + 6 WD4p - 6 WD4n - 24 WT1p + 24 WT1n - 12 WT2p + 12 WT2n - 8 WT3p + 8 WT3n - 6 WT4p + 6 WT4n <= -1
    P2: 24 WC1p - 24 WC1n + 12 WC2p - 12 WC2n + 8 WC3p - 8 WC3n + 6 WC4p - 6 WC4n - 24 WT1p + 24 WT1n - 12 WT2p + 12 WT2n - 8 WT3p + 8 WT3n - 6 WT4p + 6 WT4n <= -1
    P3: 24 WC1p - 24 WC1n + 12 WC2p - 12 WC2n + 8 WC3p - 8 WC3n + 6 WC4p - 6 WC4n + 24 WD1p - 24 WD1n + 12 WD2p - 12 WD2n + 8 WD3p - 8 WD3n + 6 WD4p - 6 WD4n - 24 WT1p + 24 WT1n - 12 WT2p + 12 WT2n - 8 WT3p + 8 WT3n - 6 WT4p + 6 WT4n >= 0
    P4: 5 - 5 a - WC1n >= 0
    P5: 5 a - WC1p >= 0
    P6: 5 - 5 b - WC2n >= 0
    P7: 5 b - WC2p >= 0
    P8: 5 - 5 c - WC3n >= 0
    P9: 5 c - WC3p >= 0
    P10: 5 - 5 d - WC4n >= 0
    P11: 5 d - WC4p >= 0
    P12: 5 - 5 e - WD1n >= 0
    P13: 5 e - WD1p >= 0
    P14: 5 - 5 f - WD2n >= 0
    P15: 5 f - WD2p >= 0
    P16: 5 - 5 g - WD3n >= 0
    P17: 5 g - WD3p >= 0
    P18: 5 - 5 h - WD4n >= 0
    P19: 5 h - WD4p >= 0
    P20: 5 - 5 i - WT1n >= 0
    P21: 5 i - WT1p >= 0
    P22: 5 - 5 j - WT2n >= 0
    P23: 5 j - WT2p >= 0
    P24: 5 - 5 k - WT3n >= 0
    P25: 5 k - WT3p >= 0
    P26: 5 - 5 l - WT4n >= 0
    P27: 5 l - WT4p >= 0
Integer
    WC1n WC1p WC2n WC2p WC3n WC3p WC4n WC4p WD1n WD1p WD2n WD2p WD3n WD3p WD4n WD4p WT1n WT1p WT2n WT2p WT3n WT3p WT4n WT4p 
Binary
    a b c d e f g h i j k l 
End
