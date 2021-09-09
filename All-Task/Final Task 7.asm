include "emu8086.inc"
.model small
.stack 100h
.data
    mas1 db "Input a character for BL : $"
    mas2 db 0ah,0dh,"Input a character for AL : $"
    mas3 db 0ah,0dh,"The character that comes first in character sequence in register is : $"
    
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
        
        mov ah,1
        int 21h
        
        mov cl,al 
        
        mov ah,9
        lea dx,mas3
        int 21h
        
        cmp bl,cl
        jg BL_
               
               
        CL_:        
        print "AL"
        jmp exit
        
        BL_:
        print "BL"
          
    Exit:
    mov ah,4ch
    int 21h
        
    endp akbar
    end akbar  