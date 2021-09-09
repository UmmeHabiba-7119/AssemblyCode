include "emu8086.inc"
.model small
.stack 100h
.data
    mas1 db "Enter a Character[A-Z/a-z] : $"
    mas2 db 0ah,0dh,"The output is $"
    
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
        
        mov ah,9
        lea dx,mas2
        int 21h
        
        cmp bl,61h
        jge Small_
        
        cmp bl,41h
        jge Capital_
        
        Error_:
        print "not an alphabet."
        jmp exit
        
        Small_:
        cmp bl,7Ah        
        jg Error_ 
        
        print ": Small."
        jmp exit
        
        Capital_:
        cmp bl,5Ah        
        jg Error_ 
        
        print ": Capital."
           
    Exit:
    mov ah,4ch
    int 21h
        
    endp akbar
    end akbar  