.model small                        
.stack 100h
.data
    mas1 db "Enter a two decimal number[0-9] : $"
    mas2 db 0ah,0dh,"The sum of $"
    mas3 db " and $"
    mas4 db " is $"
    b db ?
    
.code

    habiba proc 
        
        mov ax,@data
        mov ds,ax
        
        mov ah,9
        lea dx,mas1
        int 21h
        
        mov ah ,1
        int 21h
        
        mov bl,al
        
        mov ah,2
        mov dl," "
        int 21h
        
        mov ah ,1
        int 21h
        
        mov cl,al 
        
        mov b,bl
        
        add bl,cl    ; bl = bl + cl
        sub bl,30h
        
        mov ah,9
        lea dx,mas2
        int 21h 
        
        mov ah,2
        mov dl,b
        int 21h
        
        mov ah,9
        lea dx,mas3
        int 21h
        
        mov ah,2
        mov dl,cl
        int 21h
        
        mov ah,9
        lea dx,mas4
        int 21h
        
        mov ah,2
        mov dl,bl
        int 21h
           
    
    mov ah,4ch
    int 21h
        
    endp habiba
    end habiba  