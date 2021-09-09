include "emu8086.inc"
.model small
.stack 100h
.data
    mas1 db "Input two character : $"
    mas3 db 0ah,0dh,"The character that comes first in character sequence : $"
    
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
        
        mov ah,1
        int 21h
        
        mov cl,al 
        
        mov ah,9
        lea dx,mas3
        int 21h
        
        cmp bl,cl
        mov ah,2
        jg BL_
               
        ;mov ah,2       
        CL_:        
        mov dl,bl
        int 21h
        mov dl,cl
        int 21h 
        jmp exit
        
        BL_:
        mov dl,cl
        int 21h
        mov dl,bl
        int 21h
          
    Exit:
    mov ah,4ch
    int 21h
        
    endp akbar
    end akbar  