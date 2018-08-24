test_add: printc '1'
          mov al, 0xff

          add al, 0x07

          JUMP_FAIL jl
          JUMP_FAIL jng
          JUMP_FAIL jnp
          JUMP_FAIL jnc
          JUMP_FAIL ja
          JUMP_FAIL jz
          JUMP_FAIL js

          mov ax, 1
          ret

.fail:    mov ax, 0
          ret
