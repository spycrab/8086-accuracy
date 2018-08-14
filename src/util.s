;;; Small helper that performs trivial tasks

;;; Prints a string
%macro prints 1
        mov ah, 0Eh
        mov si, %1        

%%loop:  lodsb
         cmp al, 0
         je %%done
         cmp al, 20
         jne %%print

         mov bh, 0h
         mov ah, 03h
         int 10h
         add dh, 1
         mov dl, 0h
         mov ah, 02h
         int 10h

         mov ah, 0Eh
         jmp %%loop
%%print:        
         int 10h
         jmp %%loop
%%done:
%endmacro

%macro printc 1
        mov ah, 0Eh
        mov al, %1
        int 10h
%endmacro
