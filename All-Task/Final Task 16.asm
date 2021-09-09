include "emu8086.inc"
.model small
.stack 100h
.data
    mas1 db "How many lines : $"
    mas2 db 0ah,0dh,"$"
    c dw 0
    
.code

    akbar proc
        mov ax,@data
        mov ds,ax
        
        mov ah,9
        lea dx,mas1
        int 21h
        
        define_scan_num
        
        call scan_num
        
        mov bx,cx
        
        
        mov ah,9
        lea dx, mas2
        int 21h
        
        Loop_: 
        mov bx,0
        inc c
        
            Loop2_:
            
            mov ah,2
            mov dl,"*"
            int 21h            
            inc bx
            
            cmp bx,c
            jl Loop2_
             
        mov ah,9
        lea dx, mas2
        int 21h               
        
        loop Loop_  
    
    mov ah,4ch
    int 21h
        
    endp akbar
    end akbar  