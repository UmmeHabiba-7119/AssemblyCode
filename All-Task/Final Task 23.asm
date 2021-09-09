include "emu8086.inc"
.model small
.stack 100h
.data
    mas1 db "Enter the line : $"
    mas2 db 0ah,0dh,"The number of 1 is : $"
    mas3 db 0ah,0dh,"The number of 0 is : $"
    1count dw 0
    0count dw 0
    
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
        
        
        Loop_: 
        mov ah,1
        int 21h
         
        cmp al,30h
        je zero_
        
        cmp al,31h
        je one_
        
        cmp al,0Dh
        je exit
        
        jmp go_
        
        One_:
        inc 1count
        jmp Go_ 
        
        
        Zero_:
        inc 0count
        
        Go_:   
        inc cx        
        loop Loop_ 
          
    Exit:
    mov ah,9
    lea dx,mas2
    int 21h
    
    mov ax,1count
    call print_num
    
    mov ah,9
    lea dx,mas3
    int 21h
    
    mov ax,0count
    call print_num
    
    mov ah,4ch
    int 21h
        
    endp akbar
    end akbar  