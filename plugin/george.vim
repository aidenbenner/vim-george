if !(has("python"))
    finish
endif

let s:script = fnamemodify(resolve(expand("<sfile>:p")), ":h:h") . "/george.py"
let s:filename = fnameescape(expand("%"))

function! GeorgeCheck()
    new | execute "read! python " . fnameescape(s:script) . " " . fnameescape(s:filename)
    silent! g/^+-+-.*$/de
    silent! g/^\s*$/de
    silent! %s/^#.*/\r&/g
    setlocal buftype=nofile
    setlocal bufhidden=hide
    setlocal noswapfile
    setlocal filetype=george-output
endfunction
