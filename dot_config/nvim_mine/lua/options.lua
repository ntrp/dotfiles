vim.opt.compatible = false          -- Disable compatibility to old-time vi
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.hidden = true               -- Hide unused buffers
vim.opt.cc = "80"                   -- Set an 80 column boarder for good coding style
vim.opt.ttyfast = true              -- Speed up scrolling in neovim
vim.opt.clipboard = "unnamedplus"   -- Use same clipboard between neovim and system
vim.opt.spell = false               -- Disable spelling checking
vim.opt.ignorecase = true           -- Case insensitive matching
vim.opt.hlsearch = false            -- Do not highlight search results
vim.opt.tabstop=2                   -- Bumber of columns occupied by a tab character
vim.opt.shiftwidth=2                -- Width for autoidnents
vim.opt.softtabstop=2               -- How far cursor travels by pressing tab
vim.opt.expandtab = true            -- Converts tab to whitespace
vim.opt.autoindent = true           -- Indent a new line the same amound as the line before it
vim.opt.foldlevelstart = 99         -- Start completely unfolded
vim.opt.signcolumn = "yes"
vim.opt.relativenumber = true       -- Show relative line number (hybrid)
vim.opt.number = true 		          -- Show absolute line number (hybtif)
vim.opt.showmode = false

vim.wo.scrolloff=8                  -- minimal # of lines to keep above/below the cursor

vim.o.termguicolors = true          -- Enable true colors if avaliable
vim.o.timeoutlen = 300              -- timeout for the leader key

