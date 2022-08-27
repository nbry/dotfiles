-- :help options

-- stylua: ignore
local myOptions = {
  autoindent = true,
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 1,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  cursorline = true,                       -- highlight the current line
  expandtab = false,                        -- convert tabs to spaces
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  mouse = "a",                             -- allow the mouse to be used in neovim
  number = true,                           -- set numbered lines
  numberwidth = 2,                         -- set number column width to 2 {default 4}
  pumheight = 10,                          -- pop up menu height
  -- relativenumber = true,                   -- set relative numbered lines
  scrolloff = 8,
  shiftwidth = 4,                          -- the number of spaces inserted for each indentation
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  -- showtabline = 2,                         -- always show tabline at top
  sidescrolloff = 8,
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  smartcase = true,                        -- smart case
  -- smartindent = true,
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  tabstop = 4,                             -- number of spaces to insert for a tab
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 1000,                       -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  wrap = false,                            -- display lines as one long line
  writebackup = false                      -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
}

-- Set all options
for k, v in pairs(myOptions) do
	vim.opt[k] = v
end

-- Vimscript
vim.cmd([[
  autocmd BufWritePre * :call StripTrailingWhitespaces()

  function! StripTrailingWhitespaces()
      let _s=@/
      let l = line('.')
      let c = col('.')
      %s/\s\+$//e
      let @/=_s
      call cursor(l, c)
  endfunction
]])
