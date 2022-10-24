augroup ultisnips_custom
    autocmd!
    autocmd BufNewFile ~/docs/notes/*.md silent! call snippet#InsertSkeleton()
augroup END

function! s:try_insert(skel)
    call feedkeys("i_skel\<C-r>=UltiSnips#ExpandSnippet()\<CR>", 'n')

    if g:ulti_expand_res == 0
        silent! undo
    endif

    return g:ulti_expand_res
endfunction

function! snippet#InsertSkeleton() abort
    let filename = expand('%')

    if !(line('$') == 1 && getline('$') == '') || filereadable(filename)
        return
    endif

    call s:try_insert('skel')
endfunction

function! snippet#Create(name) abort
    let filename = '~/docs/notes/' . join(split(tolower(a:name)), "-") . ".md"

    execute "edit " . l:filename
    call feedkeys(a:name . "\<C-r>=UltiSnips#JumpForwards()\<CR>", 'n')
endfunction
