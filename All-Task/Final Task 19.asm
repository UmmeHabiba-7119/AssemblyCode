.model small
.stack 100h
.data
    
    mas1 db "Enter a uppercase line[A-Z]: $"
    mas2 db 0ah,0dh,"In lowercase it is: $"
    arr1 db 50 dup(?)

.code

    akbar proc
        mov ax,@data
        mov ds,ax
        
        mov ah,9
        lea dx,mas1
        int 21h
        
        mov si , offset arr1        
        mov cx,0
       
        lop:
        
        mov ah,1
        int 21h
        
        cmp al,0dh
        je out_
        
        cmp al,41h
        jl noalpha_
        
        cmp al,5Ah
        jl alpha_ 
        
        
        NoAlpha_:        
        jmp go_
        
        Alpha_:
        add al,20h
             
        
        Go_:
        mov [si] , al
        inc si
        inc cx
        jmp lop
        
        
        
        
        out_:
        
        mov ah,9
        lea dx , mas2
        int 21h 
              
        mov ah,2
        mov si , offset arr1

        lop2:        
        
        mov dx,[si]
        int 21h
        
        inc si
        
        loop lop2  
        
        mov ah,4ch
        int 21h
        
    endp akbar
end akbar