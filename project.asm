IDEAL
MODEL small
STACK 250h

DATASEG
; --------------------------
visited db 64 dup (0)
color db 4
wordcolor dw (?)
address dw 50 dup (?)
x dw (0)
y dw (0)
GraphicX dw (?)
GraphicY dw (?)
remdi dw (?)
click dw (?)
counter db (0)
counter2 dw (0)
bombcounter dw 0
arrayindex dw (0)
flagcounter db (0)
clickcounter db (0)
rembx dw (?)
clock equ es:6ch
randomarray db 10 dup (0)
; global font_1
; global font_2
; global font_3
; global font_4
; global font_5
; global font_6
; global font_7
; global font_8
; global font_BOMB
; global font_M
; global font_I
; global font_N
; global font_E
; global font_S
; global font_W
; global font_P
; global font_R

font_0 dw 0,0,07e0h,07e0h,1818h,1818h,1818h,1818h,1818h,1818h,1818h,1818h,1818h,1818h,07e0h,07e0h
font_1 dw 0,0,00c0h,00c0h,03c0h,03c0h,0cc0h,0cc0h,00c0h,00c0h,00c0h,00c0h,00c0h,00c0h,0ffch,0,0
font_2 dw 0,0,03c0h,03c0h,0c30h,0c30h,0030h,0030h,00c0h,00c0h,0300h,0300h,0c00h,0c00h,0ff0h,0ff0h
font_3 dw 0,0,03c0h,03c0h,0c30h,0c30h,0030h,0030h,03c0h,03c0h,0030h,0030h,0c30h,0c30h,03c0h,03c0h,0
font_4 dw 0,0,00c0h,00c0h,03c0h,03c0h,0cc0h,0cc0h,30c0h,30c0h,3ff0h,3ff0h,00c0h,00c0h,00c0h,00c0h,0
font_5 dw 0,0,0ff0h,0ff0h,0c00h,0c00h,0fc0h,0fc0h,0030h,0030h,0030h,0030h,0c30h,0c30h,03c0h,03c0h,0
font_6 dw 0,0,03c0h,03c0h,0c30h,0c30h,0c00h,0c00h,0fc0h,0fc0h,0c30h,0c30h,0c30h,0c30h,03c0h,03c0h,0
font_7 dw 0,0,0ff0h,0ff0h,0030h,0030h,0030h,0030h,00c0h,00c0h,0300h,0300h,0300h,0300h,0300h,0300h,0
font_8 dw 0,0,03c0h,03c0h,0c30h,0c30h,0c30h,0c30h,03c0h,03c0h,0c30h,0c30h,0c30h,0c30h,03c0h,03c0h,0
font_9 dw 0,0,07e0h,07e0h,1818h,1818h,1818h,1818h,07f8h,07f8h,0018h,0018h,1818h,1818h,07e0h,07e0h,0
font_bomb dw 0c00h,6200h,0100h,93c0h,23c0h,0ff0h,1ff8h,3ffch,3ffch,7ffeh,7fdeh,7fdeh,3f7ch,1ff8h,0ff0h,03c0h
font_m dw 0,1818h,1818h,6666h,6666h,6186h,6186h,6006h,6006h,6006h,6006h,6006h,6006h,6006h,6006h,0
font_i dw 0,0ff0h,0ff0h,0180h,0180h,0180h,0180h,0180h,0180h,0180h,0180h,0180h,0180h,0ff0h,0ff0h,0
font_n dw 0,3806h,3806h,3c06h,3606h,3306h,3186h,30c6h,3066h,3036h,301eh,300eh,3006h,3006h,3006h,0
font_e dw 0,7ffeh,7ffeh,6000h,6000h,6000h,6000h,7ffeh,7ffeh,6000h,6000h,6000h,6000h,7ffeh,7ffeh,0
font_s dw 0,0fc0h,0fc0h,3030h,3030h,0c00h,0c00h,0300h,0300h,00c0h,00c0h,3030h,3030h,0fc0h,0
font_w dw 0,6006h,6006h,6006h,6006h,6006h,6006h,6006h,6006h,6186h,6186h,6666h,6666h,0781eh,0781eh,0
font_p dw 0,3ff0h,3ff0h,300ch,300ch,300ch,300ch,3ff0h,3ff0h,3000h,3000h,3000h,3000h,3000h,3000h,0
font_r dw 0,3ff0h,3ff0h,300ch,300ch,300ch,300ch,3ff0h,3ff0h,300ch,300ch,300ch,300ch,300ch,300ch,0
font_t dw 0,7ffeh,7ffeh,6186h,6186h,0180h,0180h,0180h,0180h,0180h,0180h,0180h,0180h,07e0h,07e0h,0
font_a dw 0,03c0h,03c0h,0c30h,0c30h,300ch,300ch,300ch,300ch,3ffch,300ch,300ch,300ch,300ch,0fc3fh,0
font_y dw 0,1818h,1818h,1818h,1818h,0660h,0660h,0180h,0180h,0180h,0180h,0180h,0180h,0180h,0180h,0
font_o dw 0,0ff0h,1ff8h,300ch,300ch,300ch,300ch,300ch,300ch,300ch,300ch,300ch,300ch,1ff8h,0ff0h,0
font_u dw 0,300ch,300ch,300ch,300ch,300ch,300ch,300ch,300ch,300ch,300ch,1818h,0c30h,07e0h,03c0h,0
font_v dw 0,2002h,2002h,2002h,2002h,1004h,1004h,0808h,0808h,0410h,0410h,0220h,0220h,0140h,0080h,0
font_g dw 0,0ff0h,0ff0h,300ch,300ch,3000h,3000h,30f0h,30f0h,300ch,300ch,300ch,300ch,0ff0h,0ff0h,0
font_l dw 0,3f80h,3f80h,0e00h,0e00h,0e00h,0e00h,0e00h,0e00h,0e00h,0e00h,0e00h,0e00h,3ffeh,3ffeh,0
font_crown dw 0180h,0240h,0240h,0180h,6246h,9249h,9249h,6a56h,2664h,2004h,1008h,1008h,0810h,0810h,0420h,07e0h
font_restart dw 0,0,0,0,0fa2ch,832ah,82a9h,8269h,0fa29h,8229h,8229h,822ah,822eh,0fa2ch,0,0,0
font_colon dw 0,0,0180h,03c0h,03c0h,0180h,0,0,0,0,0,0180h,03c0h,03c0h,0180h,0
font_wrongflag dw 0c003h,6006h,300ch,1818h,0c30h,0660h,0180h,03c0h,0660h,0c30h,1818h,300ch,6006h,0c003h,8001h
remember dw (?)
bordercheck dw (?)
draw_array dw 16 dup (0)
draw_mask dw (?)
bombs db 64 dup (0)
flags db 64 dup (0)
status db 64 dup (0)
neighbors db 64 dup (0)
; --------------------------
CODESEG

;resets the screen to black color
proc resetscreen
    push ax
    push bx
    push cx
    push dx
    xor cx, cx
    xor dx, dx
    mov bx, 0
    mov ax, 64000
again16:
    push ax
    mov ah, 0ch
    mov al, 0
    int 10h
    inc cx
    pop ax
    dec ax
    jnz again16
    pop dx
    pop cx
    pop bx
    pop ax
    ret
endp resetscreen

;draws the beginner screen
proc beginnerscreen
    push ax
    push bx
    push cx
    push dx
;part 1 green background
    xor cx, cx
    xor dx, dx
    int 10h
    mov bh, 0
    mov [color], 2
    mov ax, 4800
line1:
    push ax
    mov ah, 0ch
    mov al, [color]
    int 10h
    inc cx
    pop ax
    dec ax
    jnz line1
;part 2 green background
    mov dx, 14
    mov bl, 185
again1:
    mov ax, 80
    inc dx
    xor cx, cx
row1:
    push ax
    mov ah, 0ch
    mov al, [color]
    int 10h
    inc cx
    pop ax
    dec ax
    jnz row1
    dec bl
    jnz again1
;part 3 green background
    mov dx, 14
    mov bl, 185
again2:
    mov ax, 80
    inc dx
    mov cx, 240
row2:
    push ax
    mov ah, 0ch
    mov al, [color]
    int 10h
    inc cx
    pop ax
    dec ax
    jnz row2
    dec bl
    jnz again2
;part 4 green background
    mov dx, 175
    mov cx, 0
    mov ax, 8000
line2:
    push ax
    mov ah, 0ch
    mov al, [color]
    inc cx
    int 10h
    pop ax
    dec ax
    jnz line2
;part 1 grey boxes - background
    mov cx, 79
    mov dx, 14
    mov ax, 160
    mov bl, 160
    mov [color], 7
again3:
    mov cx, 79
    inc dx
    mov ax, 160
background:
    push ax
    mov ah, 0ch
    mov al, [color]
    inc cx
    int 10h
    pop ax
    dec ax
    jnz background
    dec bl
    jnz again3
;part 2 grey boxes - white lines and rows
;White lines
    mov [color], 0fh
    mov dx, -5
    mov bl, 8
again4:
    mov ax, 160
    add dx, 20
    mov cx, 79
whiteline:
    push ax
    mov ah, 0ch
    mov al, [color]
    inc cx
    int 10h
    pop ax
    dec ax
    jnz whiteline
    dec bl
    jnz again4

    ;White rows
    mov cx, 59
    mov bl, 8
    mov [color], 0fh
again5:
    mov ax, 160
    add cx, 20
    mov dx, 14
whiterow:
    push ax
    mov ah, 0ch
    mov al, [color]
    inc dx
    int 10h
    pop ax
    dec ax
    jnz whiterow
    dec bl
    jnz again5
;part 3 grey boxes - grey lines and rows
;Grey rows
    mov cx, 79
    mov bl, 8
    mov [color], 248
again9:
    mov ax, 160
    add cx, 20
    mov dx, 14
greyrow:
    push ax
    mov ah, 0ch
    mov al, [color]
    inc dx
    int 10h
    pop ax
    dec ax
    jnz greyrow
    dec bl
    jnz again9

    ;Grey lines
    mov [color], 248
    mov dx, 14
    mov bl, 8
again8:
    mov ax, 159
    add dx, 20
    mov cx, 79
greyline:
    push ax
    mov ah, 0ch
    mov al, [color]
    inc cx
    int 10h
    pop ax
    dec ax
    jnz greyline
    dec bl
    jnz again8

;now draws the score, end and mines left box below the game screen
    mov dx, 155
    mov [counter], 2
    mov ah, 0ch
    mov al, 7
    mov bh, 0
outerboxlines:
    mov cx, 79
    add dx, 20
    mov bl, 160
outerboxlinesagain:
    int 10h
    inc cx
    dec bl
    jnz outerboxlinesagain
    dec [counter]
    jnz outerboxlines

    mov cx, 79
    mov dx, 175
    mov bl, 20
outerboxrowsagain:
    int 10h
    inc dx
    dec bl
    jnz outerboxrowsagain
    add cx, 20
    mov dx, 175
    mov bl, 20
outerboxrowsagain2:
    int 10h
    inc dx
    dec bl
    jnz outerboxrowsagain2
    add cx, 100
    mov dx, 175
    mov bl, 20
outerboxrowsagain3:
    int 10h
    inc dx
    dec bl
    jnz outerboxrowsagain3
    add cx, 40
    mov dx, 175
    mov bl, 20
outerboxrowsagain4:
    int 10h
    inc dx
    dec bl
    jnz outerboxrowsagain4


;fills the box with the score, end button and mines left
    push 175
    push 81
    push offset font_restart
    push 0
    call draw_font
    push 185
    push 89
    call drawblank
    push 185
    push 109
    call drawblank
    push 185
    push 110
    call drawblank
    push 185
    push 130
    call drawblank
    push 185
    push 150
    call drawblank
    push 185
    push 170
    call drawblank
    push 185
    push 129
    call drawblank
    push 185
    push 149
    call drawblank
    push 185
    push 169
    call drawblank
    push 185
    push 189
    call drawblank
    push 185
    push 209
    call drawblank
    push 185
    push 210
    call drawblank
    push 185
    push 229
    call drawblank
    push 175
    push 81
    push offset font_restart
    push 2
    call draw_font
    push 175
    push 140
    push offset font_colon
    push 0
    call draw_font
    push 175
    push 100
    push offset font_0
    push 0
    call draw_font
    push 175
    push 120
    push offset font_0
    push 0
    call draw_font
    push 175
    push 160
    push offset font_0
    push 0
    call draw_font
    push 175
    push 180
    push offset font_0
    push 0
    call draw_font
    call minesleft

    pop dx
    pop cx
    pop bx
    pop ax
    ret
endp beginnerscreen


proc startscreen
;"MINE"
    push 35
    push 118
    push offset font_m
    push 2
    call draw_font
    push 35
    push 138
    push offset font_i
    push 2
    call draw_font
    push 35
    push 158
    push offset font_n
    push 2
    call draw_font
    push 35
    push 178
    push offset font_e
    push 2
    call draw_font
;"SWEEPER"
    push 60
    push 89
    push offset font_s
    push 2
    call draw_font
    push 60
    push 109
    push offset font_w
    push 2
    call draw_font
    push 60
    push 129
    push offset font_e
    push 2
    call draw_font
    push 60
    push 149
    push offset font_e
    push 2
    call draw_font
    push 60
    push 169
    push offset font_p
    push 2
    call draw_font
    push 60
    push 189
    push offset font_e
    push 2
    call draw_font
    push 60
    push 209
    push offset font_r
    push 2
    call draw_font
;"START"
    push 120
    push 99
    push offset font_s
    push 15
    call draw_font
    push 120
    push 119
    push offset font_t
    push 15
    call draw_font
    push 120
    push 139
    push offset font_a
    push 15
    call draw_font
    push 120
    push 159
    push offset font_r
    push 15
    call draw_font
    push 120
    push 179
    push offset font_t
    push 15
    call draw_font
;surrounding bombs
    push 103
    push 89
    call drawredbox
    push 100
    push 89
    push offset font_bomb
    push 0
    call draw_font
    push 123
    push 89
    call drawredbox
    push 123
    push 89
    push offset font_bomb
    push 0
    call draw_font
    push 143
    push 89
    call drawredbox
    push 143
    push 89
    push offset font_bomb
    push 0
    call draw_font
    push 143
    push 109
    call drawredbox
    push 143
    push 109
    push offset font_bomb
    push 0
    call draw_font
    push 143
    push 129
    call drawredbox
    push 143
    push 129
    push offset font_bomb
    push 0
    call draw_font
    push 143
    push 149
    call drawredbox
    push 143
    push 149
    push offset font_bomb
    push 0
    call draw_font
    push 143
    push 169
    call drawredbox
    push 143
    push 169
    push offset font_bomb
    push 0
    call draw_font
    push 143
    push 189
    call drawredbox
    push 143
    push 189
    push offset font_bomb
    push 0
    push 143
    push 209
    call drawredbox
    push 143
    push 209
    push offset font_bomb
    push 0
    call draw_font
    call draw_font
    push 100
    push 89
    push offset font_bomb
    push 0
    call draw_font
    push 103
    push 109
    call drawredbox
    push 100
    push 109
    push offset font_bomb
    push 0
    call draw_font
    push 103
    push 129
    call drawredbox
    push 100
    push 129
    push offset font_bomb
    push 0
    call draw_font
    push 103
    push 149
    call drawredbox
    push 100
    push 149
    push offset font_bomb
    push 0
    call draw_font
    push 103
    push 169
    call drawredbox
    push 100
    push 169
    push offset font_bomb
    push 0
    call draw_font
    push 103
    push 189
    call drawredbox
    push 100
    push 189
    push offset font_bomb
    push 0
    call draw_font
    push 103
    push 209
    call drawredbox
    push 100
    push 209
    push offset font_bomb
    push 0
    call draw_font
    push 123
    push 209
    call drawredbox
    push 123
    push 209
    push offset font_bomb
    push 0
    call draw_font
;Wait for click on "START"
    push ax
    push bx
    push cx
    push dx
; Initializes the mouse
    mov ax,0h
    int 33h
; Show mouse
    mov ax,1h
    int 33h
again13:
    mov ax,3h ; Waits for mouse click
    int 33h
    cmp bx, 00000001b   ;check if its left click
    jne again13
    shr cx, 1   ;adjust cx to range 0-319, to fit screen
    cmp cx, 99  ;
    jl again13  ;
    cmp cx, 199 ;
    jg again13  ;    Checks if click was on game screen
    cmp dx, 120  ;
    jl again13  ;
    cmp dx, 140 ;
    jg again13  ;
    pop dx
    pop cx
    pop bx
    pop ax
    ret
endp startscreen
;   Input:
;     Graphicy - first push
;     Graphicx - second push
;     Draw Array offset - third push
;     Draw color - fourth push
;Draws the shape in the area of the given x and y and by the array given.
proc draw_font
    pop [di+36]
    pop [wordcolor]
    pop [remember]

    call turnintoarrayXY
    push [y]
    push [x]
    call turnintographicXY
    push ax
    push bx
    push cx
    push dx
    push si
    mov si, [remember]
    mov ax, [wordcolor]
    mov [color], al
    mov cx, [GraphicX]
    mov dx, [GraphicY]
    sub cx, 8
    sub dx, 8
    mov bh, 0
    mov bl, 16
nextline:
    mov ax, 16
    mov [draw_mask], 8000h
drawfontline:
    push ax
    push cx
    mov cx, [draw_mask]
    push dx
    push bx
    mov bx, [si]
    and cx, bx
    jz continueline
    shr [draw_mask], 1
    pop bx
    pop dx
    pop cx
    mov ah, 0ch
    mov al, [color]
    int 10h
    jmp continueline2
continueline:
    pop bx
    pop dx
    pop cx
    shr [draw_mask], 1
continueline2:
    pop ax
    inc cx
    dec ax
    jnz drawfontline
    add si, 2
    sub cx, 16
    inc dx
    dec bl
    jnz nextline

    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    push [di+36]
    ret
endp draw_font

; Input:
;   y - first push
;   x - second push
; Return
;   Array index - in [arrayindex]
proc turnintoarrayindex
    pop [di]
    pop [x]
    pop [y]
    push ax
    push cx
    mov cx, [y] 
    xor bx, bx
    mov ax, 0008
    mul cx  ;  multiply y by 8, and add x to find the array index
    add bx, ax
    add bx, [x]
    mov [arrayindex], bx
    pop cx
    pop ax
    push [di]
    ret
endp turnintoarrayindex

; input:
;   array index
; return:
;   y - in bl
;   x - in bh
proc turnintoxy
    pop [di+40]
    pop [arrayindex]
    push ax
    push cx
    mov [rembx], bx
    xor ax, ax
    mov ax, [arrayindex]
    mov bl, 08
    div bl
    mov bh, ah
    mov bl, al
    pop cx
    pop ax
    push [di+40]
    ret
endp turnintoxy

;   Randomly selects array index and puts a bomb there. loops 10 times.
proc randombombs
    push es
    push di
    push si
    push dx
    push cx
    push bx
    push ax

    mov ax, 40h
    mov es, ax
    mov bx, 0
    mov si, 0
    mov cx, 10
randomagain:
    mov [counter], 2
tiemrdelay: ;spread random bombs more evenly
    mov ax, ax
    mov bx, bx
    mov cx, cx
    mov dx, dx
    dec [counter]
    jnz tiemrdelay
    mov ax, [clock] ;checks time
    mov ah, [byte cs:bx]
    xor al, ah
    and al, 00111111b ;random numbers between 0-64
    inc bx
avoidsameloop: ;checks that all numbers are different
    push cx
    mov cx, 10
    mov di, 0
avoidsame: 
    cmp [byte ptr arrayindex], al
    je changerandom
    cmp al, [randomarray+di]
    je changerandom
    inc di
    jmp continuerandom
changerandom:
    pop cx
    jmp randomagain
continuerandom:
    dec cx
    jnz avoidsame
    pop cx
    mov [randomarray+si], al
    inc si
    dec cx
    jnz randomagain

    mov cx, 10
    mov si, offset bombs
    mov di, offset randomarray
loopbombs:
    mov si, offset bombs
    mov ax, [di]
    xor ah, ah
    add si, ax
    mov [byte ptr si], 1
    mov si, offset visited
    add si, ax
    mov [byte ptr si], 1
    inc di
    dec cx
    jnz loopbombs


    pop ax
    pop bx
    pop cx
    pop dx
    pop si
    pop di
    pop es
    ret 
endp randombombs

; Input:
;   y - first push
;   x - second push
; Return:
;   puts 0 in [bordercheck] if its in the borders, or 1 if else
proc checkborders
    pop [di+2]
    pop [x]
    pop [y]
    push dx
    push ax
    mov [counter], 0
    mov [bordercheck], 0

    mov dx, [y]
    mov ax, [x]
    cmp dx, 0      ;check if y is negative 
    jge checkifybigthan8
    inc [counter]
checkifybigthan8:
    cmp dx, 8      ;check if y is bigger than 8
    jl checkifxnegative
    inc [counter]
checkifxnegative:
    cmp ax, 0       ;check if x is negative
    jge  checkifxbigthan8
    inc [counter]
checkifxbigthan8:
    cmp ax, 8       ;check if x is bigger than 8
    jl finalcheck
    inc [counter]
finalcheck:
    cmp [counter], 0
    jg outofborder
    mov [bordercheck], 0
    jmp realfinal
outofborder:
    mov [bordercheck], 1
realfinal:
    pop ax
    pop dx
    push [di+2]
    ret
endp checkborders


;   Input:
;     y - first push
;     x - second push
;   Return:
;     inc [bombcounter] if it has bomb, else does nothing
;
;
proc bombinindex
    pop [di+32]
    pop [x]
    pop [y]
    push ax
    push bx
    push cx
    push dx
    push si

    xor bx, bx
    mov dx, [y]
    mov ax, [x]
    push dx
    push ax
    call checkborders
    cmp [bordercheck], 0
    je checkbomb
    jmp finish
checkbomb:
    push  dx
    push  ax
    call turnintoarrayindex
    mov si, offset bombs
    add si, bx
    cmp [byte ptr si], 1
    jnz finish
    inc [bombcounter]
finish:
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    push [di+32]
    ret
endp bombinindex

;   Input:
;   array index
;   Return:
;   how many neighbor bombs - in [bombcounter]
proc neighborbombs
    pop [di+34]
    pop [arrayindex]
    push ax
    push bx
    push [x]
    push [y]
    mov [bombcounter], 0
    xor ax, ax
    push [arrayindex]
    call turnintoxy  ;turns index to x, y to check all x's and y's near him.
    mov al, bh
    xor bh, bh

    dec ax
    push bx
    push ax
    call bombinindex
    dec bx
    push bx
    push ax
    call bombinindex
    inc ax
    push bx
    push ax
    call bombinindex
    inc ax
    push bx
    push ax
    call bombinindex
    inc bx
    push bx
    push ax
    call bombinindex
    inc bx
    push bx
    push ax
    call bombinindex
    dec ax
    push bx
    push ax
    call bombinindex
    dec ax
    push bx
    push ax
    call bombinindex

    pop [y]
    pop [X]
    pop bx
    pop ax
    push [di+34]
    ret
endp neighborbombs

;   Input:
;     y - in [y]
;     x - in [x]
;   Does;
;      fills visited array for the index given
proc visitedarray
    xor ax, ax
    xor dx, dx
    xor bx, bx
    mov ax, [x]
    mov dx, [y]
    push dx
    push ax
    call turnintoarrayindex
    mov [arrayindex], bx
    mov si, offset visited
    add si, [arrayindex]

    push [y]
    push [x]
    call checkborders
    cmp [bordercheck], 0
    jg middlejump4

    cmp [byte ptr si], 0
    jg middlejump4

    push [y]
    push [x]
    call turnintoarrayindex
    mov [arrayindex], bx
    push [y]
    push [x]
    call turnintographicXY
    mov si, offset flags
    add si, [arrayindex]
    cmp [byte ptr si], 0
    jg middlejump4
    ; push [GraphicY]
    ; push [GraphicX]
    ; call deleteflag
    ; dec [flagcounter]
    ; push [graphicy]
    ; push [GraphicX]
    ; call minesleft
    ; pop [GraphicX]
    ; pop [GraphicY]
continuevisited:
    mov si, offset visited
    add si, [arrayindex]
    mov [byte ptr si], 1
    push [arrayindex]
    call neighborbombs
    inc [clickcounter]
    cmp [bombcounter], 0
    jg checkhowmany
    
    push [GraphicY]
    push [GraphicX]
    call drawblank
    jmp newxy
middlejump4:
    jmp middlejump2
checkhowmany:
    push [GraphicY]
    push [Graphicx]
    cmp [byte ptr bombcounter],1
    jg twobomb
    push [GraphicY]
    push [Graphicx]
    call drawblank
    push offset font_1
    push 1
    call draw_font
    ret
twobomb:
    cmp [byte ptr bombcounter],2
    jg threebomb
    push offset font_2
    push [GraphicY]
    push [Graphicx]
    call drawblank
    push 193
    call draw_font
    ret
threebomb:
    cmp [byte ptr bombcounter],3
    jg fourbomb
    push offset font_3
    push [GraphicY]
    push [Graphicx]
    call drawblank
    push 0ch
    call draw_font
    ret
    jmp continueprogram2
middlejump2:
    jmp middlejump
continueprogram2:
fourbomb:
    cmp [byte ptr bombcounter],4
    jg fivebomb
    push offset font_4
    push [GraphicY]
    push [Graphicx]
    call drawblank
    push 203
    call draw_font
    ret
fivebomb:
    cmp [byte ptr bombcounter],5
    jg sixbomb
    push offset font_5
    push [GraphicY]
    push [Graphicx]
    call drawblank
    push 4
    call draw_font
    ret
sixbomb:
    cmp [byte ptr bombcounter],6
    jg sevenbomb
    push offset font_6
    push [GraphicY]
    push [Graphicx]
    call drawblank
    push 122
    call draw_font
    ret
sevenbomb:
    cmp [byte ptr bombcounter],7
    jg eightbomb
    push offset font_7
    push [GraphicY]
    push [Graphicx]
    call drawblank
    push 254
    call draw_font
    ret
eightbomb:
    push offset font_8
    push [GraphicY]
    push [Graphicx]
    call drawblank
    push 7
    call draw_font
    ret
newxy:
    dec [x]
    call visitedarray
    inc [x]

    dec [Y]
    call visitedarray
    inc [Y]

    jmp continueprogram
middlejump:
    jmp finished
continueprogram:

    inc [x]
    call visitedarray
    dec [x]

    inc [Y]
    call visitedarray
    dec [Y]
finished: 
    ret 
endp visitedarray

;Waits for mouse click and puts in [click] - 1 if left click, 2 if right click.
;Also puts in [x] the click x and in [y] the click y. 
proc mouseclick
    push ax
    push cx
    push dx
    xor ax, ax
    xor bx ,bx
    xor cx, cx
    xor dx, dx
    mov [clickcounter], 0
; Initializes the mouse
    mov ax,0h
    int 33h
; Show mouse
    mov ax,1h
    int 33h
again7:
    mov ax,3h ; Waits for mouse click
    int 33h
    cmp [clickcounter], 54
    je winmiddlejump

    shr cx, 1   ;adjust cx to range 0-319, to fit screen
    
    cmp bx, 00000001b   ;check if its left click
    jne continuecheck
    cmp cx, 79           ;
    jl continuecheck     ;
    cmp cx, 99           ;
    jg continuecheck     ; Check if end button was pressed
    cmp dx, 175          ;
    jl continuecheck     ;
    cmp dx, 195          ;
    jg continuecheck 
    jmp exit    ;
continuecheck:
    cmp cx, 80 ;
    jl again7   ;
    cmp cx, 238 ;
    jg again7   ;    Checks if click was on game screen
    cmp dx, 15  ;
    jl again7   ;
    cmp dx, 173 ;
    jg again7   ;

    cmp bx, 00000001b   ;check if its left click
    je leftclick
    cmp bx, 00000010b
    je rightclick2
    jmp again7
    jmp leftclick
winmiddlejump:
    jmp wonthegame
leftclick:
    cmp [clickcounter], 0 ;check if it was the first click so it cant have a bomb
    jg continueleftclick2
    push dx
    push cx
    push dx
    push cx
    call turnintoarrayXY
    push [y]
    push [x]
    call turnintoarrayindex
    mov [arrayindex], bx
    call randombombs 
    pop cx
    pop dx
continueleftclick2:
    mov [click], 1
    ; Hide mouse
    mov ax, 2h 
    int 33h
    push dx
    push cx
    call turnintoarrayXY 
    push [y]
    push [x]
    call turnintoarrayindex
    mov [arrayindex], bx
    mov si, offset flags
    add si, [arrayindex]
    cmp [byte ptr si], 1
    je deleteleftclickflag
    jmp continueleftclick
deleteleftclickflag:
    mov [byte ptr si], 0
    push [y]
    push [x]
    call turnintographicXY
    push [GraphicY]
    push [GraphicX]
    call deleteflag
    jmp continueleftclick
rightclick2:
    jmp rightclick1
continueleftclick:
    mov si, offset bombs
    add si, [arrayindex]
    cmp [byte ptr si], 1
    je itsbomb1
    call visitedarray
    jmp continueprogram3
wonthegame:
; Hide mouse
    mov ax, 2h 
    int 33h
    push 3
    push 0
    call turnintographicXY
    push [GraphicY]
    push [Graphicx]
    call drawgreenbox
    push [GraphicY]
    push [Graphicx]
    push offset font_crown
    push 0
    call draw_font
    add [GraphicX], 20
    push [GraphicY]
    push [Graphicx]
    call drawgreenbox
    push [GraphicY]
    push [Graphicx]
    push offset font_y
    push 0
    call draw_font
    jmp continuewin
    itsbomb1:
    jmp itsbomb
continuewin:
    add [GraphicX], 20
    push [GraphicY]
    push [Graphicx]
    call drawgreenbox
    push [GraphicY]
    push [Graphicx]
    push offset font_o
    push 0
    call draw_font
    add [GraphicX], 20
    push [GraphicY]
    push [Graphicx]
    call drawgreenbox
    push [GraphicY]
    push [Graphicx]
    push offset font_u
    push 0
    call draw_font
    add [GraphicX], 20
    push [GraphicY]
    push [Graphicx]
    call drawgreenbox
    push [GraphicY]
    push [Graphicx]
    push offset font_w
    push 0
    call draw_font
    add [GraphicX], 20
    push [GraphicY]
    push [Graphicx]
    call drawgreenbox
    push [GraphicY]
    push [Graphicx]
    push offset font_i
    push 0
    call draw_font
    add [GraphicX], 20
    push [GraphicY]
    push [Graphicx]
    call drawgreenbox
    push [GraphicY]
    push [Graphicx]
    push offset font_n
    push 0
    call draw_font
    add [GraphicX], 20
    push [GraphicY]
    push [Graphicx]
    call drawgreenbox
    push [GraphicY]
    push [Graphicx]
    push offset font_crown
    push 0
    call draw_font
    sub [GraphicX], 100
    add [graphicy], 40
    push [GraphicY]
    push [Graphicx]
    call deleteflag
    push [GraphicY]
    push [Graphicx]
    push offset font_g
    push 0
    call draw_font
    add [GraphicX], 20
    push [GraphicY]
    push [Graphicx]
    call deleteflag
    push [GraphicY]
    push [Graphicx]
    push offset font_a
    push 0
    call draw_font
    add [GraphicX], 20
    push [GraphicY]
    push [Graphicx]
    call deleteflag
    push [GraphicY]
    push [Graphicx]
    push offset font_m
    push 0
    call draw_font
    add [GraphicX], 20
    push [GraphicY]
    push [Graphicx]
    call deleteflag
    push [GraphicY]
    push [Graphicx]
    push offset font_e
    push 0
    call draw_font
    add [graphicy], 20
    sub [GraphicX], 80
    add [GraphicX], 20
    push [GraphicY]
    push [Graphicx]
    call deleteflag
    push [GraphicY]
    push [Graphicx]
    push offset font_o
    push 0
    call draw_font
    add [GraphicX], 20
    push [GraphicY]
    push [Graphicx]
    call deleteflag
    push [GraphicY]
    push [Graphicx]
    push offset font_v
    push 0
    call draw_font
    add [GraphicX], 20
    push [GraphicY]
    push [Graphicx]
    call deleteflag
    push [GraphicY]
    push [Graphicx]
    push offset font_e
    push 0
    call draw_font
    add [GraphicX], 20
    push [GraphicY]
    push [Graphicx]
    call deleteflag
    push [GraphicY]
    push [Graphicx]
    push offset font_r
    push 0
    call draw_font

; Show mouse
    mov ax,1h
    int 33h
winagain:
    mov ax,3h ; Waits for mouse click
    int 33h
    shr cx, 1   ;adjust cx to range 0-319, to fit screen
    cmp bx, 00000001b   ;check if its left click
    jne winagain
    cmp cx, 79           ;
    jl winagain          ;
    cmp cx, 99           ;
    jg winagain          ; Check if end button was pressed
    cmp dx, 175          ;
    jl winagain          ;
    cmp dx, 195          ;
    jg winagain          ;
    jmp exit             ;

rightclick1:
    jmp rightclick
itsbomb:  ;if a bomb was pressed, reveal all bombs
    push ax
    push bx
    push [GraphicY]
    push [Graphicx]
    call turnintoarrayXY
    push [y]
    push [x]
    call turnintographicXY
    push [GraphicY]
    push [Graphicx]

    mov ax, 64
    mov si, offset bombs
    xor bx, bx
allbombs:
    cmp [byte ptr si], 0
    je continuteallbombs
    push bx
    call turnintoxy
    mov [byte ptr x], bh
    mov [byte ptr y], bl
    mov bx, [rembx]
    push [y]
    push [x]
    call turnintographicXY
    push [GraphicY]
    push [Graphicx]
    call deleteflag
    push [GraphicY]
    push [Graphicx]
    push offset font_bomb
    push 0
    call draw_font
continuteallbombs:
    inc si
    inc bx
    dec ax
    jnz allbombs

    mov ax, 64
    mov si, offset bombs
    mov di, offset flags
    xor bx, bx
allflags:
    cmp [byte ptr di], 0
    je continuteallflags
    cmp [byte ptr si], 1
    je continuteallflags
    mov di, offset address
    push bx
    call turnintoxy
    mov [byte ptr x], bh
    mov [byte ptr y], bl
    mov bx, [rembx]
    push [y]
    push [x]
    call turnintographicXY
    push [GraphicY]
    push [Graphicx]
    call deleteflag
    push [GraphicY]
    push [Graphicx]
    push offset font_bomb
    push 0
    call draw_font
    jmp continuewrongflags
allflags1:
    jmp allflags
continuewrongflags:
    push [GraphicY]
    push [Graphicx]
    push offset font_wrongflag
    push 4
    call draw_font
continuteallflags:
    inc [counter2]
    mov di, offset flags
    add di, [counter2]
    inc si
    inc bx
    dec ax
    jnz allflags1
    call drawredbox
    push [GraphicY]
    push [Graphicx]
    push offset font_bomb
    push 0
    call draw_font
    pop bx
    pop ax

; ;Delay the losing message\
;     mov bx, 100
; delayloop3:
;     mov cx, 0ffffh
; again15:
;     mov ax, ax
;     loop again15
;     dec bx
;     jnz delayloop3

; ;Now show on screen "You Lost game over"
; ; Hide mouse
;     mov ax, 2h 
;     int 33h
;     push 3
;     push 0
;     call turnintographicXY
;     push [GraphicY]
;     push [Graphicx]
;     call drawredbox
;     push [GraphicY]
;     push [Graphicx]
;     push offset font_y
;     push 0
;     call draw_font
;     add [GraphicX], 20
;     push [GraphicY]
;     push [Graphicx]
;     call drawredbox
;     push [GraphicY]
;     push [Graphicx]
;     push offset font_o
;     push 0
;     call draw_font
;     add [GraphicX], 20
;     push [GraphicY]
;     push [Graphicx]
;     call drawredbox
;     push [GraphicY]
;     push [Graphicx]
;     push offset font_u
;     push 0
;     call draw_font
;     add [GraphicX], 20
;     push [GraphicY]
;     push [Graphicx]
;     call deleteflag
;     add [GraphicX], 20
;     push [GraphicY]
;     push [Graphicx]
;     call drawredbox
;     push [GraphicY]
;     push [Graphicx]
;     push offset font_l
;     push 0
;     call draw_font
;     add [GraphicX], 20
;     push [GraphicY]
;     push [Graphicx]
;     call drawredbox
;     push [GraphicY]
;     push [Graphicx]
;     push offset font_o
;     push 0
;     call draw_font
;     add [GraphicX], 20
;     push [GraphicY]
;     push [Graphicx]
;     call drawredbox
;     push [GraphicY]
;     push [Graphicx]
;     push offset font_S
;     push 0
;     call draw_font
;     add [GraphicX], 20
;     push [GraphicY]
;     push [Graphicx]
;     call drawredbox
;     push [GraphicY]
;     push [Graphicx]
;     push offset font_t
;     push 0
;     call draw_font

;     sub [GraphicX], 100
;     add [graphicy], 39
;     push [GraphicY]
;     push [Graphicx]
;     call deleteflag
;     push [GraphicY]
;     push [Graphicx]
;     push offset font_g
;     push 0
;     call draw_font
;     add [GraphicX], 20
;     sub [graphicy], 1
;     push [GraphicY]
;     push [Graphicx]
;     call deleteflag
;     push [GraphicY]
;     push [Graphicx]
;     push offset font_a
;     push 0
;     call draw_font
;     add [GraphicX], 20
;     sub [graphicy], 1
;     push [GraphicY]
;     push [Graphicx]
;     call deleteflag
;     push [GraphicY]
;     push [Graphicx]
;     push offset font_m
;     push 0
;     call draw_font
;     add [GraphicX], 20
;     sub [graphicy], 1
;     push [GraphicY]
;     push [Graphicx]
;     call deleteflag
;     push [GraphicY]
;     push [Graphicx]
;     push offset font_e
;     push 0
;     call draw_font
;     add [graphicy], 19
;     sub [GraphicX], 80
;     add [GraphicX], 20
;     push [GraphicY]
;     push [Graphicx]
;     call deleteflag
;     push [GraphicY]
;     push [Graphicx]
;     push offset font_o
;     push 0
;     call draw_font
;     add [GraphicX], 20
;     sub [graphicy], 1
;     push [GraphicY]
;     push [Graphicx]
;     call deleteflag
;     push [GraphicY]
;     push [Graphicx]
;     push offset font_v
;     push 0
;     call draw_font
;     add [GraphicX], 20
;     sub [graphicy], 1
;     push [GraphicY]
;     push [Graphicx]
;     call deleteflag
;     push [GraphicY]
;     push [Graphicx]
;     push offset font_e
;     push 0
;     call draw_font
;     add [GraphicX], 20
;     sub [graphicy], 1
;     push [GraphicY]
;     push [Graphicx]
;     call deleteflag
;     push [GraphicY]
;     push [Graphicx]
;     push offset font_r
;     push 0
;     call draw_font
; Show mouse
    mov ax,1h
    int 33h
    jmp endgame
middlejump3:
    jmp again7
continueprogram3:
    ; Show mouse
    mov ax, 1h
    int 33h
    mov bx, 3
    delayloop2:
    mov cx, 0ffffh
again11:
    mov ax, ax
    loop again11
    dec bx
    jnz delayloop2
    jmp again7
endgame:
again14:
    ; Show mouse
    mov ax, 1h
    int 33h
    mov ax,3h ; Waits for mouse click
    int 33h
    cmp bx, 00000001b   ;check if its left click
    jne again14
    shr cx, 1    ;adjust cx to range 0-319, to fit screen
    cmp cx, 79   ;
    jl again14   ;
    cmp cx, 99   ;
    jg again14   ;    Checks if click was on game screen
    cmp dx, 174  ;
    jl again14   ;
    cmp dx, 194  ;
    jg again14   ;
    pop ax
    pop cx
    pop dx
    jmp exit
    ret
rightclick:
    push dx
    push cx
    call turnintoarrayXY
    push [y]
    push [x]
    call turnintoarrayindex
;check the pixel color in order to know if visited or not
    push [y]
    push [x]
    call turnintographicXY
    ; Read dot
    mov bh, 0h
    mov cx, [Graphicx]
    mov dx, [Graphicy]
    add cx, 3
    mov ah, 0Dh
    int 10h ; return al the pixel value read
    cmp al, 7
    jne middlejump3
    mov [click], 2
    ; Hide mouse
    mov ax, 2h 
    int 33h
    mov si, offset flags
    add si, [arrayindex]
    cmp [byte ptr si], 1
    je deletetheflag
    push [y]
    push [x]
    call turnintographicXY
    cmp [flagcounter], 10
    je continuemouse
    mov si, offset bombs
    add si, [arrayindex]
    cmp [byte ptr si], 1
    je continueflag
    mov si, offset visited
    add si, [arrayindex]
    cmp [byte ptr si], 1
    je continuemouse
continueflag:
    push [GraphicY]
    push [Graphicx]
    call drawflag
    inc [flagcounter]
    call minesleft
    mov si, offset flags
    add si, [arrayindex]
    mov [byte ptr si], 1
    jmp continuemouse
deletetheflag:
    push [y]
    push [x]
    call turnintographicXY
    push [GraphicY]
    push [GraphicX]
    call deleteflag
    dec [flagcounter]
    call minesleft
    mov si, offset flags
    add si, [arrayindex]
    mov [byte ptr si], 0
continuemouse:
    ; Show mouse
    mov ax, 1h
    int 33h
    ;delay second click
    mov bx, 4
delayloop:
    mov cx, 0ffffh
again10:
    mov ax, ax
    loop again10
    dec bx
    jnz delayloop
    jmp again7


    pop ax
    pop cx
    pop dx
    ret
endp mouseclick

proc minesleft

    push 185
    push 209
    call drawblank
    push 185
    push 229
    call drawblank

    cmp [flagcounter], 0
    jg oneflag
    push 190
    push 209
    push offset font_1
    push 4
    call draw_font
    push 190
    push 229
    push offset font_0
    push 4
    call draw_font
    jmp finishminesleft
oneflag:
    cmp [flagcounter], 1
    jg twoflags
    push 190
    push 229
    push offset font_9
    push 4
    call draw_font
    push 190
    push 209
    push offset font_0
    push 4
    call draw_font
    jmp finishminesleft
twoflags:
    cmp [flagcounter], 2
    jg threeflags
    push 190
    push 229
    push offset font_8
    push 4
    call draw_font
    push 190
    push 209
    push offset font_0
    push 4
    call draw_font
    jmp finishminesleft
threeflags:
    cmp [flagcounter], 3
    jg fourflags
    push 190
    push 229
    push offset font_7
    push 4
    call draw_font
    push 190
    push 209
    push offset font_0
    push 4
    call draw_font
    jmp finishminesleft
fourflags:
    cmp [flagcounter], 4
    jg fiveflags
    push 190
    push 229
    push offset font_6
    push 4
    call draw_font
    push 190
    push 209
    push offset font_0
    push 4
    call draw_font
    jmp finishminesleft
fiveflags:
    cmp [flagcounter], 5
    jg sixflags
    push 190
    push 229
    push offset font_5
    push 4
    call draw_font
    push 190
    push 209
    push offset font_0
    push 4
    call draw_font
    jmp finishminesleft
sixflags:
    cmp [flagcounter], 6
    jg sevenflags
    push 190
    push 229
    push offset font_4
    push 4
    call draw_font
    push 190
    push 209
    push offset font_0
    push 4
    call draw_font
    jmp finishminesleft
sevenflags:
    cmp [flagcounter], 7
    jg eightflags
    push 190
    push 229
    push offset font_3
    push 4
    call draw_font
    push 190
    push 209
    push offset font_0
    push 4
    call draw_font
    jmp finishminesleft
eightflags:
    cmp [flagcounter], 8
    jg nineflags
    push 190
    push 229
    push offset font_2
    push 4
    call draw_font
    push 190
    push 209
    push offset font_0
    push 4
    call draw_font
    jmp finishminesleft
nineflags:
    cmp [flagcounter], 9
    jg tenflags
    push 190
    push 229
    push offset font_1
    push 4
    call draw_font
    push 190
    push 209
    push offset font_0
    push 4
    call draw_font
    jmp finishminesleft
tenflags:
    push 190
    push 229
    push offset font_0
    push 4
    call draw_font
    push 190
    push 209
    push offset font_0
    push 4
    call draw_font
finishminesleft: 
    ret
endp minesleft

;   Input:
;     GraphicY - first push
;     GraphicX - second push
;   Return:
;     Array x in [x]
;     Array x in [y]
proc turnintoarrayXY
    pop [di+8]
    pop [Graphicx]
    pop [GraphicY]
    push dx
    push cx
    push bx
    push ax
    mov cx, [GraphicX]
    mov dx, [GraphicY]

    sub cx, 79  
    mov bl, 20  
    mov ax, cx 
    xor ah, ah 
    div bl    
    xor ah, ah
    mov [x], ax  

    sub dx, 14
    mov ax, dx
    mov bl, 20
    xor ah, ah
    div bl
    xor ah, ah
    mov [y], ax

    pop ax
    pop bx
    pop cx
    pop dx
    push [di+8]
    ret
endp turnintoarrayXY

;   Input:
;     y - first push
;     x - second push
;   Return:
;     GraphicX in [GraphicX]
;     GraphicY in [GraphicY]
proc turnintographicXY
    pop [di+6]
    pop [x]
    pop [y]
    push ax
    push bx
    mov [GraphicX], 89
    mov [GraphicY], 24
    xor ax, ax
    mov bl, 20
    mov ax, [x]
    mul bl
    add [GraphicX], ax

    xor ax, ax
    mov bl, 20
    mov ax, [y]
    mul bl
    add [GraphicY], ax

    pop bx
    pop ax
    push [di+6]
    ret
endp turnintographicXY

;   Input:
;     Graphicy - first push
;     Graphicx - second push
;Draws a blank box in the area of the given x and y
proc drawblank
    pop [di+20]
    pop [GraphicX]
    pop [GraphicY]
    push ax
    push bx
    push cx
    push dx
    mov cx, [GraphicX]
    mov dx, [GraphicY]
    add cx, 10 ;Turn to Box X
    sub dx, 9 ;Turn to Box Y
    mov bl, 19
    mov [color], 8
    mov bh, 0

blankline:
    mov ax, 19
    sub cx, 19
blankrow:
    push ax
    mov ah, 0ch
    mov al, [color]
    int 10h
    inc cx
    pop ax
    dec ax
    jnz blankrow
    inc dx
    dec bl
    jnz blankline

    pop dx
    pop cx
    pop bx
    pop ax
    push [di+20]
    ret
endp drawblank 

;   Input:
;     Graphicy - first push
;     Graphicx - second push
;Draws red box in the area of the given x and y
proc drawredbox
    pop [di+30]
    pop [GraphicX]
    pop [GraphicY]
    push ax
    push bx
    push cx
    push dx
    mov cx, [GraphicX]
    mov dx, [GraphicY]
    add cx, 10
    sub dx, 9
    mov bl, 19
    mov [color], 4
    mov bh, 0

redline:
    mov ax, 19
    sub cx, 19
redrow:
    push ax
    mov ah, 0ch
    mov al, [color]
    int 10h
    inc cx
    pop ax
    dec ax
    jnz redrow
    inc dx
    dec bl
    jnz redline

    pop dx
    pop cx
    pop bx
    pop ax
    push [di+30]
    ret
endp drawredbox

;Draws green box in the area of the given x and y
proc drawgreenbox
    pop [di+46]
    pop [GraphicX]
    pop [GraphicY]
    push ax
    push bx
    push cx
    push dx
    mov cx, [GraphicX]
    mov dx, [GraphicY]
    add cx, 10
    sub dx, 9
    mov bl, 19
    mov [color], 2
    mov bh, 0

greenline:
    mov ax, 19
    sub cx, 19
greenrow:
    push ax
    mov ah, 0ch
    mov al, [color]
    int 10h
    inc cx
    pop ax
    dec ax
    jnz greenrow
    inc dx
    dec bl
    jnz greenline

    pop dx
    pop cx
    pop bx
    pop ax
    push [di+46]
    ret
endp drawgreenbox

;   Input:
;     Graphicy - first push
;     Graphicx - second push
;Draws a flag in the area of the given x and y
proc drawflag
    pop [di+21]
    pop [GraphicX]
    pop [GraphicY]
    push dx
    push cx
    push bx
    push ax
    mov dx, [GraphicY]
    mov cx, [Graphicx]
    add dx, 8
    add cx, 8
;black flag base
    mov [color], 0
    mov bh, 0
    mov bl, 2
blackbottom2:
    sub cx, 15
    mov ax, 15
blackbottom:
    push ax
    mov ah, 0ch
    mov al, [color]
    int 10h
    inc cx
    pop ax
    dec ax
    jnz blackbottom
    dec dx
    dec bl
    jnz blackbottom2

    sub cx, 2
    mov bl, 2
upperblack2:
    sub cx, 11
    mov ax, 11
upperblack:
    push ax
    mov ah, 0ch
    mov al, [color]
    int 10h
    inc cx
    pop ax
    dec ax
    jnz upperblack
    dec dx
    dec bl
    jnz upperblack2

    mov bl, 6
    mov al, 0
    mov ah, 0ch
    sub cx, 6
blackrow:
    int 10h
    dec dx
    dec bl
    jnz blackrow

    mov [color], 12
    mov bh, 0
    mov bl, 6
redflag2:
    mov ax, 9
redflag:
    push ax
    mov ah, 0ch
    mov al, [color]
    int 10h
    dec cx
    pop ax
    dec ax
    jnz redflag
    dec dx
    add cx, 9
    dec bl
    jnz redflag2


    pop ax
    pop bx
    pop cx
    pop dx
    push [di+21]
    ret
endp drawflag

;   Input:
;     Graphicy - first push
;     Graphicx - second push
;Removes the flag in the area of the given x and y
proc deleteflag
    pop [di+22]
    pop [GraphicX]
    pop [GraphicY]
    push ax
    push bx
    push cx
    push dx
    mov cx, [GraphicX]
    mov dx, [GraphicY]
    add cx, 10 ;Turn to Box X
    sub dx, 8 ;Turn to Box Y
    mov bl, 18
    mov [color], 7
    mov bh, 0

deleteflagline:
    mov ax, 19
    sub cx, 19
deleteflagrow:
    push ax
    mov ah, 0ch
    mov al, [color]
    int 10h
    inc cx
    pop ax
    dec ax
    jnz deleteflagrow
    inc dx
    dec bl
    jnz deleteflagline

    pop dx
    pop cx
    pop bx
    pop ax
    push [di+22]
    ret
endp deleteflag

proc timer
    push es
    push cx
    push ax

    mov ax, 4c00h
    mov es, ax
    mov ax, [clock]
whentostart:
    cmp ax, [clock]
    je startcounting
    mov cx, 18
startcounting:
    mov ax, [clock]
clockchange:
    cmp ax, [clock]
    je clockchange
    dec cx
    jnz startcounting
    
    pop ax
    pop cx
    pop es
endp timer
start:
	mov ax, @data
	mov ds, ax

    mov di, offset address
; --------------------------
; Graphics mode
    mov ax,13h
    int 10h
startover:
    ; mov si, offset bombs
    ; mov [byte ptr si], 1
    ; add si, 1
    ; mov [byte ptr si], 1
    ; add si, 1
    ; mov [byte ptr si], 1
    ; add si, 1
    ; mov [byte ptr si], 1
    ; add si, 1
    ; mov [byte ptr si], 1
    ; add si, 1
    ; mov [byte ptr si], 1
    ; add si, 1
    ; mov [byte ptr si], 1
    ; add si, 1
    ; mov [byte ptr si], 1
    ; add si, 1
    ; mov [byte ptr si], 1
    ; add si, 1
    ; mov [byte ptr si], 1
    ; add si, 1

    call resetscreen
    call startscreen
    call beginnerscreen
    call mouseclick
    jmp startover
; --------------------------
exit:
    ; Text mode
    mov ax,3h
    int 10h
	mov ax, 4c00h
	int 21h
END start


