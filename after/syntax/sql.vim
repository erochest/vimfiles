
syntax include @Python syntax/python.vim
syntax region pythonCode matchgroup=String start=+"<<!PYTHON:+ end=+:PYTHON!>>"+  contains=@Python
syntax region pythonCode matchgroup=String start=+'<<!PYTHON:+ end=+:PYTHON!>>'+  contains=@Python

