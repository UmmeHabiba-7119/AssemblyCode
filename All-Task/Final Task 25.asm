include "emu8086.inc"
.model small
.stack 100h
.data
    mas1 db ?
    mas2 db ? 
    a dw ?
    b dw ?
    c dw ?
    d dw ?
    
.code

    akbar proc
        mov ax,@data
        mov ds,ax
        
        define_scan_num
        define_print_num
        define_print_num_uns
        
        call scan_num
        mov a,cx   
        mov ax,a
        
        call scan_num
        mov b,cx
        mov bx,b
        
        call scan_num
        mov c,cx
        mov cx,c
        
        call scan_num
        mov d,cx 
        
        cmp ax,bx
        jl dis10_
        
        cmp ax,cx
        jl dis11_
        
        
        Else_:
        
        mov ax,a
        mov cx,d
        
        cmp ax,cx
        jl elseif_
        
        ElseElse_:
        
        ;putting -1 in dx
        
        jmp exit
        
        ElseIf_:
        
        ;putting 1 in cx
        jmp exit
        
        If_:
        
        ;putting 0 in ax
        jmp exit
                
        
        Dis10_:
         
        cmp bx,cx
        jl if_:
        
        Dis11_:
        mov ax,d
        
        cmp bx,ax
        jl if_
        
        
        
        
        
        
    exit:    
    mov ah,4ch
    int 21h
        
    endp akbar
    end akbar  