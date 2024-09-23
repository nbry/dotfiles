-- :help options

local o = vim.opt

local space_holywar = {
	spaces = 2,
	expand = true,
}

o.autoindent = true
o.clipboard = "unnamedplus"               -- allows neovim to access the system clipboar
o.cmdheight = 0                           -- neovim command line height
o.completeopt = { "menuone", "noselect" } -- mostly just for cmp
o.conceallevel = 0                        -- so that `` is visible in markdown files
o.cursorline = true                       -- highlight the current line
o.expandtab = space_holywar.expand        -- convert tabs to spaces
o.fileencoding = "utf-8"                  -- the encoding written to a file
o.hlsearch = true                         -- highlight all matches on previous search pattern
o.ignorecase = true                       -- ignore case in search patterns
o.mouse = "a"                             -- allow the mouse to be used in neovim
o.number = true
o.numberwidth = 2                         -- set number column width to 2 {default 4}
o.pumheight = 10                          -- pop up menu height
o.scrolloff = 8
o.shiftwidth = space_holywar.spaces       -- the number of spaces inserted for each indentation
o.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
-- o.showtabline = 2                         -- always show tabline at top
o.sidescrolloff = 8
o.signcolumn = "yes"                      -- always show the sign column otherwise it would shift the text each time
o.smartcase = true
o.smartindent = true
o.spelllang = "en"
o.spellsuggest = "best 10"
o.splitbelow = true                       -- force all horizontal splits to go below current window
o.splitright = true                       -- force all vertical splits to go to the right of current window
o.swapfile = false                        -- creates a swapfile
o.tabstop = space_holywar.spaces          -- number of spaces to insert for a tab
o.termguicolors = true
o.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete (in milliseconds)
o.undofile = true                         -- enable persistent undo
o.updatetime = 300                        -- faster completion (4000ms default)
o.wrap = false
o.writebackup = false                      -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited

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
