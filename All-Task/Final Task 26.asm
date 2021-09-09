include "emu8086.inc"
.model small
.stack 100h
.data
    mas1 db "How many terms?: $"
    mas2 db 0ah,0dh,"Enter number $"
    mas3 db ": $"
    mas4 db 0ah,0dh,"The sum is : $"
    con dw ?
    result dw 0
    
.code

    akbar proc
        mov ax,@data
        mov ds,ax
        
        define_scan_num
        define_print_num
        define_print_num_uns
        
        mov ah,9
        lea dx,mas1
        int 21h
        
        call scan_num
        
        mov bx,0
        
        Loop_:
        mov con,cx 
        
        
        inc bx
        
        mov ah,9
        lea dx,mas2
        int 21h
        
        mov ax,bx
        call print_num
        
        mov ah,9
        lea dx,mas3
        int 21h
        
        call scan_num
        add result,cx
        
        
        mov cx,con
        loop Loop_
        
        mov ah,9
        lea dx,mas4
        int 21h
        
        mov ax,result
        
        call print_num
           
    
    mov ah,4ch
    int 21h
        
    endp akbar
    end akbar  