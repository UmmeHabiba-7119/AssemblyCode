.model small
.stack 100h
.data
    mas1 db "Enter a uppercase Character[A-Z] : $"
    mas2 db 0ah,0dh,"In lowercase it : $"
    
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
        add bl,20h
        
        mov ah,9
        lea dx,mas2
        int 21h
        
        mov ah,2
        lea dl,bl
        int 21h
        
        mov ah,4ch
        int 21h
        
    endp akbar
    end akbar  