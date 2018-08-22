test_add: printc '1'
          mov al, 0xff

          add al, 0x07
          jl  .fail
          jng .fail
          jnp .fail
          jnc .fail
          ja  .fail
          jz  .fail
          js  .fail

          mov ax, 1
          ret

.fail:    mov ax, 0
          ret
