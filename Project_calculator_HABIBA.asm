include "emu8086.inc"
.model small
.stack 100h
.data
  
   m1 db "          ***WeLcOmE tO mInI cAlcUlaToR***: $"
   m2 db 0ah,0dh,"Choose your option:-: $"
   m3 db 0ah,0dh,"Enter your optional key: $"
   m4 db 0ah,0dh,"For addition,press 1: $"
   m5 db 0ah,0dh,"For subtraction,press 2: $"
   m6 db 0ah,0dh,"For multiplication,press 3: $"
   m7 db 0ah,0dh,"For division,press 4: $"
   m8 db 0ah,0dh,"     Enter two valid numbers $" 
   m9 db 0ah,0dh,"Your result: $"
   m10 db 0ah,0dh,"In decimal: $"
   ;m11 db 0ah,0dh,"In hexadecimal: $"
   ;m12 db 0ah,0dh,"In binary: $"
   m13 db 0ah,0dh,"Invalid number: $"
   m14 db 0ah,0dh,"           ThAnK yOu....!!!: $" 
   m15 db 0ah,0dh,"$"  
   m16 db 0ah,0dh,"Enter 1st number: $"
   m17 db 0ah,0dh,"Enter 2nd number: $" 
   m18 db 0ah,0dh,"To continue press 1: $" 
   m19 db 0ah,0dh,"Reminder: $"
   A dw 0  
   B dw 0
   
.code

    habiba proc
    
          mov ax,@data
          mov ds,ax 
          
           
        define_scan_num
        define_print_num
        define_print_num_uns 
        
   
    
          mov ah,9
          lea dx,m1
          int 21h
    
          mov ah,9
          lea dx,m15
          int 21h 
    
     level1_:
        
              mov ah,9
              lea dx,m2
              int 21h
        
              mov ah,9
              lea dx,m15
              int 21h
        
              mov ah,9
              lea dx,m4
              int 21h
        
              mov ah,9
              lea dx,m5
              int 21h
        
              mov ah,9
              lea dx,m6
              int 21h
        
              mov ah,9
              lea dx,m7
              int 21h
        
              mov ah,9
              lea dx,m15
              int 21h 
        
  level2_:
  
        mov ah,9
        lea dx,m3
        int 21h
        
        call indec
        
        mov bx,ax
        
        cmp bx,1
        je addition_
        
        cmp bx,2
        je subtraction_
        
        cmp bx,3
        je multiplication_
        
        cmp bx,4
        je division_ 
        
        mov ah,2
        mov dl,m15
        int 21h 
              
        
         addition_: 
       
                 mov ah,9
                 lea dx,m8
                 int 21h
        
                 mov ah,9
                 lea dx,m16
                 int 21h
         
                 call indec
        
                 mov bx,ax 
        
                 mov ah,9
                 lea dx,m17
                 int 21h
        
                 call indec
                 mov cx,ax
        
                 mov ax,bx
        
                 add ax,cx 
                 mov A,ax
        
                 jmp result_ 
        
        
  subtraction_:
        
        mov ah,9
        lea dx,m8
        int 21h
        
        mov ah,9
        lea dx,m16
        int 21h
        
        call indec
        
        mov bx,ax 
        
        mov ah,9
        lea dx,m17
        int 21h
        
        call indec
        mov cx,ax
        
        mov ax,bx
        
        sub ax,cx 
        mov A,ax
        
        jmp result_ 
        
    
  
        
          multiplication_:
        
                  mov ah,9
                  lea dx,m8
                  int 21h
         
                  mov ah,9
                  lea dx,m16
                  int 21h
        
                  call indec
                  mov bx,ax
        
                  mov ah,9
                  lea dx,m17
                  int 21h
        
                  call indec
                  mov cx,ax
        
                  mov ax,bx
        
                  mul cx
        
                  mov A,ax
                  jmp result_
    
  division_:
        
        mov ah,9
        lea dx,m8
        int 21h
        
         
        mov ah,9
        lea dx,m16
        int 21h
        
        call scan_num
        mov bx,cx
        
        mov ah,9
        lea dx,m15
        int 21h 
        
        mov ah,9
        lea dx,m17
        int 21h                      
        
        call scan_num
         
        mov ah,9
        lea dx,m15
        int 21h
        
        mov ax,bx 
        
        xor dx,dx
        
        div cx   
        
        mov bx,ax
        mov B,dx 
        
        jmp result1_
        
            result_:
  
                   mov ah,9
                   lea dx,m9
                   int 21h 
         
                   mov ax,A
         
                   call outdec  
         
                   mov ah,9
                   lea dx,m18
                   int 21h
         
                   call indec
                   mov bx,ax
         
                   cmp bx,1
                   je level1_
                   
  result1_:
          mov ah,9
          lea dx,m9
          int 21h
          
          mov ax,bx
          call print_num 
          
          mov ah,9
          lea dx,m15
          int 21h
          
         ; mov ax,B 
          
          mov ah,9
          lea dx,m19
          int 21h
          
          mov ax,B 
          
          call print_num
          
          
          mov ah,9
          lea dx,m18
          int 21h
          
          call indec
          mov bx,ax
          
          cmp bx,1
          je level1_
         
          stop_: 
  
              mov ah,9
              lea dx,m14
              int 21h
       
          mov ah,4ch
          int 21h
       
        endp habiba 
       include indec.asm
       include outdec.asm
end habiba