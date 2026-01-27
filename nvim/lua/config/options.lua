local options = {
    autoindent = true,
    background = "dark",
    backspace = "indent,eol,start",
    backup = false,
    completeopt = "menuone,noselect",
    cursorline = true,
    expandtab = true,
    hlsearch = false,
    ignorecase = true,
    incsearch = true,
    number = true,
    relativenumber = false,
    scrolloff = 8,
    shiftwidth = 2,
    sidescrolloff = 8,
    signcolumn = "yes",
    smartcase = true,
    smartindent = true,
    splitbelow = true,
    splitright = true,
    swapfile = false,
    tabstop = 2,
    termguicolors = true,
    undofile = true,
    updatetime = 50,
    wrap = false,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- Clipboard
vim.opt.clipboard:append("unnamedplus")

-- Make number column background transparent
vim.cmd("highlight clear LineNr")
vim.cmd("highlight clear SignColumn")

-- Whitespace: Strip trailing spaces on save
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
