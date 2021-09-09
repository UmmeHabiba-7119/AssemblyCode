.model small
.stack 100h
.data
    mas1 db "Enter a character[A-Z/a-z] : $"
    mas2 db 0ah,0dh,"The output is : Vowel.$"
    mas3 db 0ah,0dh,"The output is : Consonant.$"
    
.code

    akbar proc
        mov ax,@data
        mov ds,ax
        
        mov ah,9
        lea dx,mas1
        int 21h
        
        mov ah,1
        int 21h
        
        mov bl,al
        

        cmp bl,41h
        je vowel
        
        cmp bl,45h
        je vowel
        
        cmp bl,49h
        je vowel
        
        cmp bl,4Fh
        je vowel
        
        cmp bl,55h
        je vowel
        
        cmp bl,61h
        je vowel 
        
        cmp bl,65h
        je vowel
        
        cmp bl,69h
        je vowel
        
        cmp bl,6Fh
        je vowel
        
        cmp bl,75h
        je vowel
        
        
        Consonant:
        mov ah,9
        lea dx,mas3
        int 21h
        jmp exit
        
        Vowel:
        mov ah,9
        lea dx,mas2
        int 21h
        
    Exit:
    mov ah,4ch
    int 21h
        
    endp akbar
    end akbar  