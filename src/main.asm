org 0x7c00                  ; bootloader address
bits 16

start:
    jmp main

main:
    mov ah, 0x0e            ; bios tele-type output mode
    mov bp, msg             ; address of message
    mov cx, len             ; length of message

print:
    mov al, [bp]            ; moves character to al
    int 0x10                ; bios video interrupt
    inc bp                  ; increment base pointer (bp)
    dec cx                  ; decrement counter
    jnz print               ; jump if not zero

hang:
    jmp hang                ; freeze the system

msg db 'Hello World!!', 0x0d, 0x0a
len equ $ - msg             ; string length

times 510 - ($ - $$) db 0   ; pad the boot sector with zeros
dw 0xaa55                   ; boot signature