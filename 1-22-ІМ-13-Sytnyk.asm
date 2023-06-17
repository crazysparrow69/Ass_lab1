.386

.model flat, stdcall
    option casemap :none
    include \masm32\include\masm32rt.inc

.data?
    buffD db 32 dup(?)
    buffE db 32 dup(?)
    buffF db 32 dup(?)
    buffNegD db 32 dup(?)
    buffNegE db 32 dup(?)
    buffNegF db 32 dup(?)
    buffMsgBoxBody db 32 dup(?)

.data
    MsgBoxCaption db "SysPrograming Lab1 Sytnyk", 0
    MsgBoxBody db "ddmmyyyy = %s", 10,
    "A = %d", 10, 
    "-A = %d", 10, 
    "B = %d", 10, 
    "-B = %d", 10, 
    "C = %d", 10, 
    "-C = %d", 10, 10, 
    "D = %s", 10, 
    "-D = %s", 10, 
    "E = %s", 10,
    "-E = %s", 10, 
    "F = %s", 10, 
    "-F = %s", 0
 
    DDMMYYYY db "21082003", 0
    A db 21
    NEG_A db -21
    A_WORD dw 21
    B_WORD dw 2108
    NEG_A_WORD dw -21
    NEG_B_WORD dw -2108
    A_SHORTINT dd 21
    B_SHORTINT dd 2108
    C_SHORTINT dd 21082003
    NEG_A_SHORTINT dd -21
    NEG_B_SHORTINT dd -2108
    NEG_C_SHORTINT dd -21082003
    A_LONGINT dq 21
    B_LONGINT dq 2108
    C_LONGINT dq 21082003
    NEG_A_LONGINT dq -21
    NEG_B_LONGINT dq -2108
    NEG_C_LONGINT dq -21082003

    
    D_SINGLE dq 0.016
    NEG_D_SINGLE dq -0.016
    D_SINGLE2 dd 0.016
    NEG_D_SINGLE2 dd -0.016
    
    E_DOUBLE dq 1.590
    NEG_E_DOUBLE dq -1.590
    
    F_EXTENDED dq 15898.946
    NEG_F_EXTENDED dq -15898.946
    F_EXTENDED2 dt 15898.946
    NEG_F_EXTENDED2 dt -15898.946

.code
    Main:
        invoke FloatToStr2, D_SINGLE, addr buffD
        invoke FloatToStr2, NEG_D_SINGLE, addr buffNegD
        invoke FloatToStr2, E_DOUBLE, addr buffE
        invoke FloatToStr2, NEG_E_DOUBLE, addr buffNegE
        invoke FloatToStr2, F_EXTENDED, addr buffF
        invoke FloatToStr2, NEG_F_EXTENDED, addr buffNegF
        
        invoke wsprintf, addr buffMsgBoxBody, addr MsgBoxBody, addr DDMMYYYY, 
        A_SHORTINT, NEG_A_SHORTINT, B_SHORTINT, NEG_B_SHORTINT,
        C_SHORTINT, NEG_C_SHORTINT,
        addr buffD, addr buffNegD, addr buffE,
        addr buffNegE, addr buffF, addr buffNegF
        
        invoke MessageBox, 0, addr buffMsgBoxBody, addr MsgBoxCaption, 0
        invoke ExitProcess, 0
    end Main