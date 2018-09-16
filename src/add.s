test_add: printc '1'

          mov al, 0xff
          add al, 0x01

          JUMP_FAIL jo
          JUMP_FAIL jl
          JUMP_FAIL jg
          JUMP_FAIL jnp
          JUMP_FAIL jnc
          JUMP_FAIL ja
          JUMP_FAIL jnz
          JUMP_FAIL js

          printc '2'

          mov ax, 0x10
          add ax, 0x40

          JUMP_FAIL jo
          JUMP_FAIL jl
          JUMP_FAIL jng
          JUMP_FAIL jnp
          JUMP_FAIL jc
          JUMP_FAIL jna
          JUMP_FAIL jz
          JUMP_FAIL js

          printc '3'

          mov bx, 0xfff0
          add bx, 0xf000

          JUMP_FAIL jo
          JUMP_FAIL jg
          JUMP_FAIL jnp
          JUMP_FAIL jnc
          JUMP_FAIL ja
          JUMP_FAIL jz
          JUMP_FAIL jns

          mov ax, 1
          ret

.fail:    mov ax, 0
          ret
