test_cmp:       
        printc '1'

        mov ah, 0xff        
        
        cmp ah, ah
        jnz .fail
        jne .fail
        jg  .fail
        ja  .fail
        jnp .fail
        jl  .fail
        jo  .fail
        js  .fail

        printc '2'

        mov ax, 0x1000
        mov bx, 0x2001

        cmp ax, bx
        jz  .fail
        je  .fail
        jg  .fail
        ja  .fail
        jnl .fail
        jns .fail
        jo  .fail

        mov ax, 1
        ret

.fail:  mov ax, 0
        ret
