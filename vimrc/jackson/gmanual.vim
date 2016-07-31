let g:scc = {}
" sample

let g:scc.refile = [
            \ ['> 文件历史>', ''],
            \ ['MRU', 'MRU'],
            \ ['GUndo', ':GundoToggle']]

let g:scc.file = [
            \ ['> 文件跳转>', ''],
            \ ['> File', 'Unite -no-split -buffer-name=files   -start-insert file_rec/async:!'],
            \ ['> NerdTree', ':NERDTreeToggle'],
            \ ['> Dir', 'Unite -no-split -buffer-name=files   -start-insert file']]

let g:scc.save = [
            \ ['> 保存操作>', ''],
            \ ['saveall', ':wall'],
            \ ['save', ':w']]

let g:scc.ag = [
            \ ['> ag搜索>', ''],
            \ ['ag', 'Ag -imp <cword> ']]

let g:scc.ack = [
            \ ['> ack搜索>', ''],
            \ ['ack', 'Ag -imp <cword> ']]

let g:scc.cscope = [
            \ ['> cscope跳转>', ''],
            \ ['> cscope goto definition', 'cs find g <cword>'],
            \ ['> cscope goto call function', 'cs find s <cword>']]

let g:scc.windows = [
            \ ['> 窗口操作>', ''],
            \ ['vsplit', ':vsplit'],
            \ ['split', ':split']]

let g:scc.buffers = [
            \ ['> buffers操作>', ''],
            \ ['buffers', 'Unite -no-split -buffer-name=buffer  buffer'],
            \ ['buffer jump', ':call TabQuickMove(input("Enter tabLabel: "))']]

let g:dict = {
            \ 'search':{}, 
            \ 'file':{}, 
            \ 'buffer':{}, 
            \ 'windows':{}}

let g:dict.search = ['ag', 'ack', 'cscope']

let g:dict.file = ['refile', 'save', 'file']

let g:dict.windows = ['windows']

let g:dict.buffer = ['buffers']

function! Gmanual()
    let a:viewlist = []
    let a:idx = 0
    let a:input = 0
    let a:slist = keys(g:dict)
    let a:head = ''
    while a:idx < len(a:slist)
        execute 'let a:head = printf("[%-' . strlen(len(a:slist)) . 's]", a:idx)'
        call add(a:viewlist, a:head . ' ' . a:slist[a:idx])
        let a:idx = a:idx + 1
    endwhile

    echo "\n"
    let a:input = inputlist(a:viewlist)
    echo "\n"

    let a:key = a:slist[a:input]
    let a:slist = get(g:dict, a:key, 'default')
    "unset variables
    let a:idx = 0
    let a:viewlist = []
    let a:head = ''

    while a:idx < len(get(g:dict, a:key, 'default'))
        execute 'let a:head = printf("[%-' . strlen(len(a:slist)) . 's]", a:idx)'
        call add(a:viewlist, a:head . ' ' . a:slist[a:idx])
        let a:idx = a:idx + 1
    endwhile

    echo "\n"
    let a:input = inputlist(a:viewlist)
    echo "\n"
    call SelectCmd(a:slist[a:input])
    echo "\n"
endfunction

function! SelectCmd(key)
    let a:viewlist = []
    let a:idx = 0
    let a:input = 0
    let a:slist = g:scc[a:key]
    let a:head = ''

    while a:idx < len(a:slist)
        if a:idx == 0
            call add(a:viewlist, a:slist[a:idx][0])
        else
            execute 'let a:head = printf("[%-' . strlen(len(a:slist)) . 's]", a:idx)'
            call add(a:viewlist, a:head . ' ' . a:slist[a:idx][0])
        endif
        let a:idx = a:idx + 1
    endwhile

    echo "\n"
    let a:input = inputlist(a:viewlist)
    echo "\n"

    if a:input < 1 || a:input > len(a:slist)
        echohl ErrorMsg
        echo 'Selected-Number('.a:input.') is range over.(0-' . (len(a:slist) - 1) . ')'
        echohl None
        return
    endif

    echohl MoreMsg
    echo '> ' . a:slist[a:input][1]
    echohl None

    execute a:slist[a:input][1]
endfunction

" command! -nargs=1 SelectCmd 
" \ call SelectCmd(<q-args>)
nnoremap <Leader>man :call Gmanual()<CR>
