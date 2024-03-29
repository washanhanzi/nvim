" Better Navigation
nnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
xnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
nnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
xnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
nnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
xnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
nnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>
xnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>

" navigate buffer
nnoremap <silent> <S-h> :call VSCodeNotify('workbench.action.previousEditor')<CR>
nnoremap <silent> <S-l> :call VSCodeNotify('workbench.action.nextEditor')<CR>

" show hower info
" nnoremap <silent> <S-k> :call VSCodeNotify('editor.action.showHover')<CR>

" comment
xnoremap gc <Cmd>call VSCodeCall('editor.action.commentLine')<CR>

" go to implementation
nnoremap gI <Cmd>:call VSCodeNotify('editor.action.goToImplementation')<CR>

nnoremap <silent> <Space> :call VSCodeNotify('whichkey.show')<CR>
xnoremap <silent> <Space> :call VSCodeNotify('whichkey.show')<CR>

" ignore case
:set ignorecase smartcase
