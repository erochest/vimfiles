
" Python commands that I've added specifically for work.

" insert mode commands
imap <buffer> <LocalLeader>#com #<space>COMMENT(<C-r>=$USERNAME<CR>,<space><C-r>=strftime("%Y%m%d")<CR>):<space>
imap <buffer> <LocalLeader>#todo #<space>TODO(<C-r>=$USERNAME<CR>,<space><C-r>=strftime("%Y%m%d")<CR>):<space>
imap <buffer> <LocalLeader>debug functions.addmessage('<C-r>=$USERNAME<CR>',<space>"")<ESC>hi
imap <buffer> <LocalLeader>trace import<space>trace;<space>open('/tmp/<C-r>=$USERNAME<CR>.log',<space>'a').write('inspect.trace():%s\n'<space>%<space>(inpect.trace(),))<CR>

" normal mode equivalents
nmap <buffer> <LocalLeader>#com o<LocalLeader>#com
nmap <buffer> <LocalLeader>#todo o<LocalLeader>#todo
nmap <buffer> <LocalLeader>debug o<LocalLeader>debug
nmap <buffer> <LocalLeader>trace o<LocalLeader>trace

