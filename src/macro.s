;;; Helper macros

%ifndef _macro_s_
%define _macro_s_

%include "const.s"

%macro EMBED_TEST 1
%push __%??__
%%begin:
%defstr %$name %{1}.s
%include %{$name}
times FLOPPY_SECTOR_SIZE-($ - %%begin) db 0
%endmacro

;;; Creates a local instance of a macro to save space on repeated calls
;;; Parameters:
;;;     1: Function name
;;;     2: Macro
;;;     3: Parameters
%macro MAKE_LOCAL 3+
%1: %2 %3
    ret
%endmacro

%macro JUMP_FAIL 1
mov si, %{1}_msg
%1 .fail        
%endmacro        
        
%endif
