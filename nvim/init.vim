" Color
set background=dark
colors peaksea

" Solve conda env problem
if has('nvim') && !empty($CONDA_PREFIX)
  let g:python_host_prog = $CONDA_PREFIX . '/bin/python'
  let g:python3_host_prog = $CONDA_PREFIX . '/bin/python'
endif

" Basic
lua require('basic')

" Packer
lua require('plugins')

" Plugins configuration
lua require('configuration')

" Plugins keybindings
lua require('keybindings')
