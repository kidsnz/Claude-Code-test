;==============================================================================
; cc-pong.asm
; APONG (Pong) 再現プロジェクト
; ターゲット: docs_pong/AtariAge/APongJuly02.bin
;
; Step 1: スケルトン
;   - 標準的な262行 NTSC フレーム構造
;   - VSYNC(3) + VBLANK(37) + Kernel(192) + Overscan(30)
;   - TIM64T でフレーム末を厳密に待機（ハング無し）
;   - 全黒画面
;==============================================================================

    processor 6502
    include "vcs.h"
    include "macro.h"

;------------------------------------------------------------------------------
; ROM領域: $F000-$FFFF (4KB)
;------------------------------------------------------------------------------
    SEG Code
    ORG $F000

Reset:
    CLEAN_START                 ; RAM/TIA全クリア、SP=$FF、A=X=Y=0

;------------------------------------------------------------------------------
; メインフレームループ
;------------------------------------------------------------------------------
MainLoop:
    ;----- VSYNC (3行) -----
    VERTICAL_SYNC               ; マクロ: 3行分のVSYNC、戻り時 A=0

    ;----- VBLANK (37行) -----
    lda #43                     ; 37行 * 76サイクル / 64 ≒ 43
    sta TIM64T

    ; (Step 1 では VBLANK 中の処理なし)

WaitVBlank:
    lda INTIM
    bne WaitVBlank
    sta WSYNC
    sta VBLANK                  ; 画面表示 ON (A=0)

    ;----- 可視カーネル (192行) -----
    ldx #192
KernelLoop:
    sta WSYNC
    dex
    bne KernelLoop

    ;----- Overscan (30行) -----
    lda #2
    sta VBLANK                  ; 画面表示 OFF

    lda #35                     ; 30行 * 76サイクル / 64 ≒ 35
    sta TIM64T

    ; (Step 1 では Overscan 中の処理なし)

WaitOverscan:
    lda INTIM
    bne WaitOverscan
    sta WSYNC

    jmp MainLoop

;------------------------------------------------------------------------------
; リセットベクター
;------------------------------------------------------------------------------
    ORG $FFFA
    .word Reset                 ; NMI
    .word Reset                 ; RESET
    .word Reset                 ; IRQ

    END
