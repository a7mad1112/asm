dosseg
.model small
.data
msgEqual db "sum=200$"
msgBelow db "sum less than 200$"
msgAbove db "sum more than 200$"
.code
main:
mov ax, @data
mov ds, ax
;
        call read1
        mov dl, bl
        call read1
        add bl, dl
        cmp bl, 200
        je equal
        jb below
        ja above


        jmp ex

read1:  mov bl, 0 ; acc = 0
        mov bh, 10
        mov cl, 0
read:
        mov ah, 1
        int 21h
        cmp al, 13
        je exit
        ;
        sub al, 30h
        mov cl, al
        mov al, bl
        mul bh
        add al, cl
        mov bl, al
        jmp read

exit:   ret

equal:
        mov dx, offset msgEqual
        mov ah, 9
        int 21h
        jmp ex
below:
        mov dx, offset msgBelow
        mov ah, 9
        int 21h
        jmp ex

above:
        mov dx, offset msgAbove
        mov ah, 9
        int 21h
        jmp ex
ex:
mov ah, 4ch
int 21h
end main

