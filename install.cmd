@if not exist "%HOME%" @set HOME=%USERPROFILE%
mkdir %USERPROFILE%\.vim\bundle\vundle
git clone https://github.com/gmarik/vundle %USERPROFILE%\.vim\bundle\vundle
vim.exe +PlugUpgrade! +PlugInstall! +qall
