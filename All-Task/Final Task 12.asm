include "emu8086.inc"
.model small
.stack 100h
.data
    mas1 db "Enter anything you want : $"
    mas2 db 0ah,0dh,"Your input total character is : $"
    
.code

    akbar proc
        mov ax,@data
        mov ds,ax
        
        mov ah,9
        lea dx,mas1
        int 21h
        
        define_print_num
        define_print_num_uns
        
        mov cx,5
        mov bx,0
        
        
        Loop_: 
        mov ah,1
        int 21h
        
        cmp al,0Dh
        je exit
        
        inc bx   
        inc cx
        
        loop Loop_ 
          
    Exit:
    mov ah,9
    lea dx,mas2
    int 21h
    
    mov ax,bx
    call print_num
    
    mov ah,4ch
    int 21h
        
    endp akbar
    end akbar  