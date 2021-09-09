include "emu8086.inc"
.model small
.stack 100h
.data
    mas1 db "Enter a hexa-decimal digit[A-F] : $"
    mas2 db 0ah,0dh,"In decimal : $"
    
.code 

    akbar proc
        mov ax,@data
        mov ds,ax
        
        define_print_num
        define_print_num_uns 
        
        mov ah,9
        lea dx,mas1
        int 21h
        
        mov ah,1
        int 21h 
        mov bl,al
        
        mov ah,9
        lea dx,mas2
        int 21h
                
        
        cmp bl,41h
        mov ax,10
        je print
        
        cmp bl,42h
        mov ax,11
        je print
        
        cmp bl,43h
        mov ax,12
        je print 
        
        cmp bl,44h
        mov ax,13
        je print
        
        cmp bl,45h
        mov ax,14
        je print
        
        cmp bl,46h
        mov ax,15
        
        Print:
        call print_num        
         
    
    mov ah,4ch
    int 21h
        
    endp akbar
    end akbar  