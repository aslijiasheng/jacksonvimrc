let g:scc = {}
" sample
let g:scc.file = [
	\ ['> 文件操作集合>', ''],
	\ ['> 打开过的历史文件', 'MRU'],
	\ ['> 保存', ':w'],
	\ ['> 保存全部', ':wall'],
	\ ['> File', 'Unite -no-split -buffer-name=files   -start-insert file_rec/async:!'],
	\ ['> Dir', 'Unite -no-split -buffer-name=files   -start-insert file']]

let g:scc.search = [
	\ ['> 搜索操作集合>', ''],
	\ ['> AG', 'Ag -imp <cword> '],
	\ ['> ACK', 'Ag -imp <cword> '],
	\ ['> gtags goto definition', 'Gtags <cword>'],
	\ ['> gtags goto call function', 'Gtags -r <cword>'],
	\ ['> cscope goto definition', 'cs find g <cword>'],
	\ ['> cscope goto call function', 'cs find s <cword>']]

function! Gmanual()
    echo 'this is manual tips'
    echo '[!]cmd [*]cmd [b]uffer [w]indows+ [f]ile+ [p]roject+ [c]opy/paste [g]it+ [s]earch+'
    let name = input("根据提示输入中括号中关键字:", '', 'event')
    if name == 'w'
        echo "\r\n" . '[v]split [s]plit [l]eft [r]ight [a]bove [b]ottom'
    endif
    if name == 'f'
        call SelectCmd('file')
        " echo "\r\n" . '[r]efile [f]ile [n]erdtree [s]ave [S]aveall [q]uit'
    endif
    if name == 'p'
        echo "\r\n" . '暂时不知道写啥'
    endif
    if name == 'c'
        echo "\r\n" . '[c]opy [p]aste [y]windows paste'
    endif
    if name == 'g'
        echo "\r\n" . '[l]og [s]tatus [c]ommit [b]ranth'
    endif
    if name == 's'
        call SelectCmd('search')
    endif
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
