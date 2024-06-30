vim.g.mapleader = " "

vim.cmd("set nu")             --  Enable line numbers
vim.cmd("set expandtab")      --  On pressing tab, insert 4 spaces
vim.cmd("set tabstop=2")      --  Show existing tab with 4 spaces width
vim.cmd("set softtabstop=2")  --  Show existing tab with 4 spaces width
vim.cmd("set shiftwidth=2")   --  When indenting with '>', use 4 spaces width
vim.cmd("set smarttab")       --  insert tabs on the start of a line according to shiftwidth
vim.cmd("set smartindent")    --  Automatically inserts one extra level of indentation in some cases
vim.cmd("set hidden")         --  Hides the current buffer when a new file is openned
vim.cmd("set incsearch")      --  Incremental search
vim.cmd("set ignorecase")     --  Ingore case in search
vim.cmd("set smartcase")      --  Consider case if there is a upper case character
vim.cmd("set scrolloff=8")    --  Minimum number of lines to keep above and below the cursor
vim.cmd("set colorcolumn=80") --  Draws a line at the given line to keep aware of the line size
vim.cmd("set signcolumn=yes") --  Add a column on the left. Useful for linting
vim.cmd("set cmdheight=1")    --  Give more space for displaying messages
vim.cmd("set updatetime=100") --  Time in miliseconds to consider the changes
vim.cmd("set encoding=utf-8") --  The encoding should be utf-8 to activate the font icons
vim.cmd("set nobackup")       --  No backup files
vim.cmd("set nowritebackup")  --  No backup files
vim.cmd("set splitright")     --  Create the vertical splits to the right
vim.cmd("set splitbelow")     --  Create the horizontal splits below
vim.cmd("set autoread")       --  Update vim after file update from outside
vim.cmd("set mouse=a")        --  Enable mouse support
vim.cmd("set list")           --  Show special characters
-- vim.cmd("set listchars=eol:↲,tab:»-,trail:~,extends:>,precedes:<,space:·") --  Show special characters

-- vim.opt.spell = true
-- TODO: Migrar para arquivo de markdown, pensar em uma pasta de linguagens talvez... 
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"md", "markdown", "txt", "text"},
  callback = function()
    vim.cmd([[ set nospell ]])
    vim.cmd([[ set spelllang=pt ]])
  end
})--  Enable spell check


return {}

