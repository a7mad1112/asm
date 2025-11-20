## Lab 6
Ask the user to enter two numbers, and print their sum

```
dosseg
.model small
.data
.stack 100
.code
main:
        mov ax, @data
        mov ds, ax
        ;
        call read1
        mov dl, bl
        call read1
        add bl, dl
        mov ah, "$"
        mov al, "$"
        push ax
        jmp print

read1:
        mov bl, 0
        mov bh, 10
        mov cl, 0

read:
        mov ah, 1
        int 21h
        cmp al, 13
        je exit
        sub al, 30h
        mov cl, al
        mov al, bl
        mul bh
        add al, cl
        mov bl, al
        jmp read
exit:
        ret


print:
        mov bh, 10
lp:
        mov ax, 0
        mov al, bl
        div bh
        push ax
        mov bl, al
        cmp al, 0
        jz pt
        jmp lp
pt:
        pop ax
        cmp ah, "$"
        jz ex
        mov dl, ah
        add dl, 30h
        mov ah, 2
        int 21h
        jmp pt



        

ex:
        mov ah, 4ch
        int 21h
        end main
```

Ask the user to enter a string, and print its length
```
dosseg
.model small
.data
.stack 100
.code
main:
        mov ax, @data
        mov ds, ax
        ;
        mov cl, 0
again:
        mov ah, 1
        int 21h
        inc cl
        cmp al, 13
        jne again
        ; value in bl
        mov bl, cl
        mov ah, "$"
        mov al, "$"
        push ax
        jmp print

print:
        mov bh, 10
lp:
        mov ax, 0
        mov al, bl
        div bh
        push ax
        mov bl, al
        cmp al, 0
        jz pt
        jmp lp
pt:
        pop ax
        cmp ah, "$"
        jz ex
        mov dl, ah
        add dl, 30h
        mov ah, 2
        int 21h
        jmp pt



        

ex:
        mov ah, 4ch
        int 21h
        end main
```
