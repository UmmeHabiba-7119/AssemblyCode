include "emu8086.inc"
.model small
.stack 100h
.data
    mas1 db "How many Star want to print : $"
    
.code 

    akbar proc
        mov ax,@data
        mov ds,ax
        
        mov ah,9
        lea dx,mas1
        int 21h
        
        define_scan_num
        
        call scan_num
        
        printn ''
        
        mov ah,2
        mov dl, "*"
        
        Loop_:
        int 21h
        
        loop Loop_
           
    
    mov ah,4ch
    int 21h
        
    endp akbar
    end akbar  