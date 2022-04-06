call ddc#custom#patch_global('completionMenu', 'pum.vim')
call ddc#custom#patch_global('sources', [
 \ 'around',
 \ 'vim-lsp',
 \ 'file'
 \ ])
call ddc#custom#patch_global('sourceOptions', {
 \ '_': {
 \   'matchers': ['matcher_head'],
 \   'sorters': ['sorter_rank'],
 \   'converters': ['converter_remove_overlap'],
 \ },
 \ 'around': {'mark': 'Around'},
 \ 'vim-lsp': {
 \   'mark': 'LSP', 
 \   'matchers': ['matcher_head'],
 \   'forceCompletionPattern': '\.|:|->|"\w+/*'
 \ },
 \ 'file': {
 \   'mark': 'file',
 \   'isVolatile': v:true, 
 \   'forceCompletionPattern': '\S/\S*'
 \ }})
call ddc#enable()
inoremap <Tab> <Cmd>call pum#map#insert_relative(+1)<CR>
inoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>

" call ddc#custom#patch_global('sources', ['around', 'vim-lsp', 'file'])
" call ddc#custom#patch_global('completionMenu', 'pum.vim')

" inoremap <C-n>   <Cmd>call pum#map#insert_relative(+1)<CR>
" inoremap <C-p>   <Cmd>call pum#map#insert_relative(+1)<CR>
" inoremap <Tab>   <Cmd>call pum#map#confirm()<CR>

" call ddc#custom#patch_global('sourceOptions', {
"     \ '_': {
"     \     'mathcers': ['mathcer_head'],
"     \     'sorters': ['sorter_rank'],
"     \     'converters': ['converter_remove_overlap'],
"     \ },
"     \ 'around': {'mark': 'Around', 'maxItems': 6,},
"     \ 'vim-lsp': {
"     \     'mark': 'LSP',
"     \     'mathcers': ['mathcer_head'],
"     \     'forceCompletionPattern': '\.|:|->|"\w+/*'
"     \ },
"     \ 'file': {
"     \     'mark': 'F',
"     \     'isVolatile': v:true,
"     \     'forceCompletionPattern': '\S/\S*',
"     \ }
"     \})

" call ddc#custom#patch_filetype(
"     \ ['ps1', 'dosbatch', 'autohotkey', 'registry'], {
"     \ 'sourceOptions': {
"     \   'file': {
"     \     'forceCompletionPattern': '\S\\\S*',
"     \   },
"     \ },
"     \ 'sourceParams': {
"     \   'file': {
"     \     'mode': 'win32',
"     \   },
"     \ }})

" call ddc#enable()
