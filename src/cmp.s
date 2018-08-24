test_cmp: printc '1'

          mov ah, 0xff

          cmp ah, ah
          JUMP_FAIL jnz
          JUMP_FAIL jne
          JUMP_FAIL jg
          JUMP_FAIL ja
          JUMP_FAIL jnp
          JUMP_FAIL jl
          JUMP_FAIL jo
          JUMP_FAIL js

          printc '2'

          mov ax, 0x1000
          mov bx, 0x2001

          cmp ax, bx
          JUMP_FAIL jz
          JUMP_FAIL je
          JUMP_FAIL jg
          JUMP_FAIL ja
          JUMP_FAIL jnl
          JUMP_FAIL jns
          JUMP_FAIL jo

          printc '3'

          mov ah, 0
          mov bl, 0xff

          cmp ah, bl
          JUMP_FAIL jz
          JUMP_FAIL jnc
          JUMP_FAIL je
          JUMP_FAIL jng
          JUMP_FAIL ja
          JUMP_FAIL jl
          JUMP_FAIL js
          JUMP_FAIL jo

          mov ax, 1
          ret

.fail:  mov ax, 0
        ret
