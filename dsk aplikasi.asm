.MODEL LARGE
.STACK 1000H
.DATA

;OUTPUT
a1    db 10,13,10,13,'==         Selamat Datang di Toko Celana          ==$'
aa    db 10,13,'        *******************************************$'
a2    db 10,13,'        **        1. Celana Jeans Panjang        **$' 
a3    db 10,13,'        **        2. Celana Jeans Pendek         **$' 
a4    db 10,13,'        **        3. Celana bahan Panjang        **$'
a5    db 10,13,'        **        4. Celana Bahan Pendek         **$' 
ab    db 10,13,'        *******************************************$' 

xx    db 10,13,10,13,'Masukkan pilihan anda $'

sej   db 10,13,10,13,' $'
   
a6    db 10,13,'Pilih Jenis Celana : $'  

ac    db 10,13,10,13,'pilih Celana anda dalam menu$' 

bb    db 10,13,'$' 

bc    db 10,13,'*$' 
    
bd    db 10,13,'*$' 

be    db 10,13,'*$' 
   
;celana jeans panjang
a7     db 10,13,'**        1. CARDINAL                     600k  **$'
a8     db 10,13,'**        2. AMIGOS DENIM                 600k  **$'
a9     db 10,13,'**        3. LEVI`S                       500k  **$'
a10    db 10,13,'**        4. LEA                          600k  **$'
a11    db 10,13,'**        5. ZARA                         500k  **$'
    
;celana jeans pendek
a12    db 10,13,'**        1. CARDINAL                     300k  **$'
a13    db 10,13,'**        2. AMIGOS DENIM                 400k  **$'
a14    db 10,13,'**        3. LEVI`S                       200k  **$'
a15    db 10,13,'**        4. LEA                          300k  **$'
a16    db 10,13,'**        5. ZARA                         200k  **$' 
                                                        
;celana bahan panjang
a17    db 10,13,'**        1. CORDUROY                     300k  **$'
a18    db 10,13,'**        2. MALLVOSE                     400k  **$'
a19    db 10,13,'**        3. GOODTHICS                    400k  **$'
a20    db 10,13,'**        4. CARGO                        400k  **$'
a21    db 10,13,'**        5. ZZUITER                      500k  **$' 
    
;celana bahan pendek
a22    db 10,13,'**        1. HOOLIGANSA                   100k  **$'
a23    db 10,13,'**        2. MOTHBLESS                    100k  **$'
a24    db 10,13,'**        3. CUTOFF                       200k  **$'
a25    db 10,13,'**        4. HRSTUFF                      100k  **$'
a26    db 10,13,'**        5. BAPIN                        100k  **$' 
    
;invalid
a27    db 10,13,'*** Invalid Entry ***$'
a28    db 10,13,'** Try Again **$'
    
a29    db 10,13,'**        Pilih Orderan :       $'
a30    db 10,13,'**        jumlah        :       $'
a31    db 10,13,'**        Total Harga   :       $'   
    
a32    db 10,13,'** 1. Back to Main Menu **$'
a33    db 10,13,'** 2. Exit **$'
    
.CODE
MAIN PROC
    mov ax,@data
    mov ds,ax 
    
    TOP:
    
    mov ah,9
    lea dx,a1
    int 21h
    
    mov ah,9
    lea dx,sej
    int 21h
    
     
    
    mov ah,9
    lea dx,aa
    int 21h
    
    mov ah,9
    lea dx,a2
    int 21h       
    
    mov ah,9
    lea dx,a3
    int 21h 
    
    mov ah,9
    lea dx,a4
    int 21h
    
    mov ah,9
    lea dx,a5
    int 21h
    
    mov ah,9
    lea dx,ab
    int 21h 
    
    mov ah,9
    lea dx,sej
    int 21h  
    
    
    
    mov ah,9
    lea dx,a6
    int 21h  
         
    mov ah,1
    int 21h
    mov bh,al
    sub bh,48
    
    cmp bh,1
    je BahanPanjang 
    
    cmp bh,2
    je JeansPanjang 
    
    cmp bh,3
    je BahanPendek
    
    cmp bh,4
    je JeansPendek 
                
    jmp invalid            

    
    BahanPanjang:
    
    mov ah,9     ;Bahan Panjang starts
    lea dx,ac
    int 21h    
    
    mov ah,9
    lea dx,sej
    int 21h      
    
    mov ah,9
    lea dx,bb
    int 21h
    
    
    mov ah,9
    lea dx,a7           ;1
    int 21h
    
    mov ah,9
    lea dx,a8           ;2
    int 21h
    
    mov ah,9            
    lea dx,a9           ;3
    int 21h  
    
    mov ah,9
    lea dx,a10          ;4
    int 21h
    
    mov ah,9
    lea dx,a11          ;5
    int 21h             
              
    mov ah,9
    lea dx,bb
    int 21h
              
   
    mov ah,9
    lea dx,a29
    int 21h
    
    mov ah,1
    int 21h
    mov bl,al
    sub bl,48  
    
    
    cmp bl,1
    je sixty
    
    cmp bl,2
    je sixty
    
    cmp bl,3
    je fifty
    
    cmp bl,4
    je sixty
    
    cmp bl,5
    je fifty
    
    jmp invalid 
    
    sixty:
    
    mov bl,6 
    mov ah,9
    lea dx,a30
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    
    mul bl
    aam
    
    mov cx,ax
    add ch,48
    add cl,48
    
    mov ah,9
    lea dx,a31 
    int 21h
    
    mov ah,2
    mov dl,ch
    int 21h
    
    mov dl,cl
    int 21h
    
    mov dl,'0'
    int 21h
    
    mov dl,'0'
    int 21h 
    
    ; print k
    
    mov dl,107
    int 21h   
    
    
    ; back to menu
    
    mov ah,9
    lea dx,a32
    int 21h
    
    mov ah,9
    lea dx,a33
    int 21h
    
    mov ah,9
    lea dx,xx
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    
    
    cmp al,1
    je top
    
    jmp exit
    
    onehundred:
    
    mov bl,1 
    mov ah,9
    lea dx,a30
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    
    mul bl
    aam
    
    mov cx,ax
    add ch,48
    add cl,48
    
    mov ah,9
    lea dx,a31 
    int 21h
    
    mov ah,2
    mov dl,ch
    int 21h
    
    mov dl,cl
    int 21h
    
    mov dl,'0'
    int 21h
    
    mov dl,'0'
    int 21h 
    
    ; print k
    
    mov dl,107
    int 21h   
    
    
    ; back to menu
    
    mov ah,9
    lea dx,a32
    int 21h
    
    mov ah,9
    lea dx,a33
    int 21h
    
    mov ah,9
    lea dx,xx
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    
    
    cmp al,1
    je top
    
    jmp exit 
    
    Twenty:
    
    
    mov bl,2 
    mov ah,9
    lea dx,a30
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    
    mul bl
    aam
    
    mov cx,ax
    add ch,48
    add cl,48
    
    mov ah,9
    lea dx,a31 
    int 21h
    
    mov ah,2
    mov dl,ch
    int 21h
    
    mov dl,cl
    int 21h
    
    mov dl,'0'
    int 21h
    
    mov dl,'0'
    int 21h 
    
    ; print k
    
    mov dl,107
    int 21h   
    
    
    ; back to menu
    
    mov ah,9
    lea dx,a32
    int 21h
    
    mov ah,9
    lea dx,a33
    int 21h
    
    mov ah,9
    lea dx,xx
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    
    
    cmp al,1
    je top
    
    jmp exit 
     
    
    fifty: 
    
    mov bl,5
    mov ah,9
    lea dx,a30              
    int 21h 
    
      
    mov ah,1
    int 21h
    sub al,48
     
       
    mul bl 
    aam 
 
    mov cx,ax 
    add ch,48
    add cl,48
    
    mov ah,9
    LEA dx,a31              
    INT 21h
    
    mov ah,2
    mov dl,ch
    int 21h
    
    
    mov dl,cl
    int 21h
    
    mov dl,'0'
    int 21h
    
    mov dl,'0'
    int 21h 
    
    ; print k
    
    mov dl,107
    int 21h
     
    
    ; back to menu
    
    mov ah,9
    lea dx,a32
    int 21h
    
    mov ah,9
    lea dx,a33
    int 21h
    
    mov ah,9
    lea dx,xx
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    
    
    cmp al,1
    je top
    
    jmp exit 
    
    jmp exit
             
             
    
    
    
    JeansPanjang:
    
    mov ah,9
    lea dx,ac
    int 21h
    
    mov ah,9
    lea dx,sej
    int 21h     
    
    
    mov ah,9
    lea dx,bd
    int 21h
    
    mov ah,9
    lea dx,a12            ;1
    int 21h
    
    mov ah,9
    lea dx,a13            ;2
    int 21h
    
    mov ah,9
    lea dx,a14            ;3
    int 21h
    
    mov ah,9
    lea dx,a15            ;4
    int 21h 
    
    mov ah,9
    lea dx,a16            ;5
    int 21h  
    
    mov ah,9
    lea dx,bd
    int 21h 
    
    mov ah,9
    lea dx,a29
    int 21h
    
    mov ah,1
    int 21h
    mov bl,al
    sub bl,48 
    
    cmp bl,1
    je fourty
    
    cmp bl,2
    je fourty
    
    cmp bl,3
    je fourty
    
    cmp bl,4
    je twenty
    
    cmp bl,5
    je twenty 
    
    jmp invalid 
    
    fourty:
    
    mov bl,4 
    mov ah,9
    lea dx,a30 
    int 21h 
    
    mov ah,1
    int 21h
    sub al,48  
    
    mul bl
    aam
    
    mov cx,ax
    add ch,48
    add cl,48
    
    mov ah,9
    lea dx,a31
    int 21h
    
    mov ah,2
    mov dl,ch
    int 21h
    
    mov dl,cl
    int 21h
    
    mov dl,'0'
    int 21h
    
    mov dl,'0'
    int 21h 
    
    ; print k
    
    mov dl,107
    int 21h
    
    ; back to menu 
    
    mov ah,9
    lea dx,a32
    int 21h
    
    mov ah,9
    lea dx,a33
    int 21h
    
    mov ah,9
    lea dx,xx
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    
    
    cmp al,1
    je top
    
    jmp exit 
     
    thrity:
    
    mov bl,7 
    mov ah,9
    lea dx,a30 
    int 21h 
    
    mov ah,1
    int 21h
    sub al,48  
    
    mul bl
    aam
    
    mov cx,ax
    add ch,48
    add cl,48
    
    mov ah,9
    lea dx,a31
    int 21h
    
    mov ah,2
    mov dl,ch
    int 21h
    
    mov dl,cl
    int 21h
    
    mov dl,'0'
    int 21h
    
    mov dl,'0'
    int 21h 
    
    ; print k
    
    mov dl,107
    int 21h
    
    ; back to menu 
    
    mov ah,9
    lea dx,a32
    int 21h
    
    mov ah,9
    lea dx,a33
    int 21h
    
    mov ah,9
    lea dx,xx
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    
    
    cmp al,1
    je top
    
    jmp exit 
     
    jmp exit
    
    
     
    
    BahanPendek:
    
    mov ah,9
    lea dx,ac
    int 21h
    
    mov ah,9
    lea dx,sej
    int 21h 
             
             
    mov ah,9
    lea dx,bc
    int 21h 
     
    mov ah,9
    lea dx,a17            ;1
    int 21h
    
    mov ah,9
    lea dx,a18            ;2
    int 21h
    
    mov ah,9
    lea dx,a19            ;3
    int 21h
    
    mov ah,9
    lea dx,a20            ;4
    int 21h 
    
    mov ah,9
    lea dx,a21            ;5
    int 21h 
    
    mov ah,9
    lea dx,bc
    int 21h
    
    mov ah,9
    lea dx,a29
    int 21h
    
    mov ah,1
    int 21h
    mov bl,al
    sub bl,48 
   
    cmp bl,1
    je sixty
    
    cmp bl,2
    je fourty
    
    cmp bl,3
    je fourty
    
    cmp bl,4
    je fourty
    
    cmp bl,5
    je fifty
    
    jmp invalid
    
    
    
    JeansPendek:
    
    mov ah,9
    lea dx,ac
    int 21h
    
    mov ah,9
    lea dx,sej
    int 21h    
    
    
    mov ah,9
    lea dx,be
    int 21h
    
    mov ah,9
    lea dx,a22            ;1
    int 21h
    
    mov ah,9
    lea dx,a23            ;2
    int 21h
    
    mov ah,9
    lea dx,a24            ;3
    int 21h
    
    mov ah,9
    lea dx,a25            ;4
    int 21h 
    
    mov ah,9
    lea dx,a26            ;5
    int 21h 
    
    mov ah,9
    lea dx,be
    int 21h
    
    mov ah,9
    lea dx,a29
    int 21h
    
    mov ah,1
    int 21h
    mov bl,al
    sub bl,48
    
    cmp bl,1
    je onehundred
    
    cmp bl,2
    je onehundred
    
    cmp bl,3
    je onehundred
    
    cmp bl,4
    je onehundred
    
    cmp bl,5
    je onehundred
    
    jmp invalid 
    
    
    invalid:
        
    mov ah,9    
    lea dx,a27
    int 21h 
    
    
    mov ah,9
    lea dx,a28 
    int 21h 
    
    
    
    jmp exit
    
    
          
    
     exit:
     
     mov ah,4ch
     int 21h
     main endp
END MAIN