
" These switch between spec files and source files.
" The files have to use these patterns (convention over configuration):
"
" * src/...\.clj
" * spec/..._spec.clj
"
" Then,
" ,s => src
" ,S => spec
nmap <leader>s :execute "e " . fnameescape(substitute(expand("%"), 'spec\(.*\)_spec\.clj', 'src\1.clj', ''))<cr>
nmap <leader>S :execute "e " . fnameescape(substitute(expand("%"), 'src\(.*\)\.clj', 'spec\1_spec.clj', ''))<cr>

" On the top line of a form, execute this, and it will send that form to the
" currently targeted tmux pane.
nmap <leader>f V^%,tmux

" This calls (doc word) in the targeted tmux.
nmap <leader>d yaw:call Send_to_Tmux("(doc " . getreg('"') . ")\n")<cr>

