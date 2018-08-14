;;; 8086-accuracy (c) spycrab0, 2018
;;; Licensed under the GNU GPL v3+. See LICENSE.

zero:   
jmp start
        
%include "util.s"

prints_main:
        prints si
        ret

%macro prints_local 1
        mov si, %1 
        call prints_main        
%endmacro
        
        
start:
        mov ax, 7C0h
        mov ds, ax
        
        prints_local welcome

        mov si, test_cmp_announce
        mov cl, 02h
        call load_test

        prints_local all_done
        
freeze: jmp freeze              ; Endless loop
        
;;; Loads a test from floppy
;;; Parameters:
;;; CL = Sector
;;; DS:SI = Test message
load_test:                

        push cx
        prints_local test_cmp_announce
        pop cx
        
        mov dl, 00h             ; Drive

        ;; CHS Address
        mov ch, 00h             ; Cylinder
        mov dh, 00h             ; Head

        mov bx, 0h
        mov es, bx
        mov bx, 500h

        mov al, 01h             ; Sectors to read
        mov ah, 02h
        int 13h                 ; 13h AH=02h - Read sector

        jnc .cont

        prints_local read_error
        ret
        
        .cont:
        mov cx, sp
        call 0h:500h            ; Call the sector we've just loaded
        cmp ax, 1h              ; See if the return code was 1 (sucesss)
        mov sp, cx
        
        jz .okay
        prints_local test_failed
        ret
.okay:  prints_local test_passed        
        ret
        
strings:
        welcome db '8086-accuracy (c) spycrab0, 2018.', 20, 20, 'This program is free software licensed under the GNU GPL v3+.' ,20, 'See the LICENSE file included with this program for more details.', 20, 20, 0
        test_passed db ' -> Test passed sucessfully.', 20, 0
        test_failed db ' -> Test failed!', 20, 20, 20, 20, 'wat', 0
        read_error db 'Read error occured.', 0
        all_done db 'Done. Hanging...', 0

        test_cmp_announce  db 'Testing CMP...', 0
        test_lods_announce db 'Testing LODSB / LODSBW...', 0
        test_sub_announce db 'Testing SUB...', 0
        
signature times 510-($-$$) db 0
dw 0xAA55
        
;;; Sector 2
%include 'cmp.s'
times 512-($-test_cmp) db 0

;;; Fill the remaining space with zeros
times 1474560-($-zero) db 0
