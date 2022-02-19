[org 0x7c00]

mov ax, 3
int 0x10 ; 清空显示文本

; xchg bx, bx
mov ax, 0xb800
mov es, ax

mov ax, 0
mov ds, ax

mov si, message
mov di, 0
mov cx, (message_end - message)

loop1:
    mov al, [ds:si]
    mov [es:di], al
    add si, 1
    add di, 2
    loop loop1

message:
    db "HIIIII!!", 0
message_end:

times 510 - ($ - $$) db 0
db 0x56, 0xaa
