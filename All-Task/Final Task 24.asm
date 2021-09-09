.model small
.stack 100h
.data
    mas1 db "Enter three number : $"
    mas2 db 0ah,0dh,"Minimum number is : $"
    mas3 db 0ah,0dh,"Maximum number is : $"
    c db ?
    
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
        
        mov ah,1
        int 21h
        
        mov c,al
        
        mov ah,9
        lea dx,mas3
        int 21h
        
        cmp bl,cl
        jg maxisa_
        
        cmp cl,c
        jg maxisb_
        
        MaxisC_:
        mov ah,2
        mov dl , c
        int 21h
        jmp sndp_
        
        MaxisB_:
        mov ah,2
        mov dl , cl
        int 21h
        jmp sndp_
        
        MaxisA_:
        cmp bl,c
        jl maxisc_
        
        mov ah,2
        mov dl , bl
        int 21h 
        
        
        Sndp_:
        mov ah,9
        lea dx,mas2
        int 21h
        
        cmp bl,cl
        jl minisa_
        
        cmp cl,c
        jl minisb_
        
        MinisC_:
        mov ah,2
        mov dl , c
        int 21h
        jmp exit
        
        MinisB_:
        mov ah,2
        mov dl , cl
        int 21h
        jmp exit
        
        MinisA_:
        cmp bl,c
        jg maxisc_
        
        mov ah,2
        mov dl , bl
        int 21h
        
           
    Exit:
    mov ah,4ch
    int 21h
        
    endp akbar
    end akbar  