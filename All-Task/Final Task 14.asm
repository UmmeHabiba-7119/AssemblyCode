include "emu8086.inc"
.model small
.stack 100h
.data
    mas1 db "Enter a hexa-decimal digit[10-15] : $"
    mas2 db 0ah,0dh,"In alphabet it is : $"
    
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
        
        mov ah,9
        lea dx,mas2
        int 21h
                
        
        cmp cx,10
        mov al,"A"
        je print
        
        cmp cx,11
        mov ax,"B"
        je print
        
        cmp cx,12
        mov ax,"C"
        je print 
        
        cmp cx,13
        mov ax,"D"
        je print
        
        cmp cx,14
        mov ax,"E"
        je print
        
        cmp cx,15
        mov ax,"F"
        
        Print:
        mov ah,2
        mov dl,al
        int 21h        
         
    
    mov ah,4ch
    int 21h
        
    endp akbar
    end akbar  