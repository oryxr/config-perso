imap ,l <esc>A
imap ,o <esc>o
"""""""""""""""""""""
" Autocomplétitions "
"""""""""""""""""""""
inoremap ( ()<left>
inoremap { {}<left>
inoremap [ []<left>
inoremap " ""<left>
"inoremap ' ''<left>
inoremap < <><left>
""""""""""""""
" Raccourcis "
""""""""""""""
" Déplacement dans les racourcis
imap ,m <esc>/<++><CR><C-n>cf>
" création d'une class
inoremap ,cl class :<CR>""" <++> """<CR>def __init__(self<++>):<CR><tab><++><esc>3k^f:i
" création d'une fonction
inoremap ,def def (self<++>):<CR><++><esc>k^f(i
" création du main
inoremap ,ma <esc>0iif __name__ == "__main__":<CR><tab>
