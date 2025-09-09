-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.winbar = "%=%m %f"

-- Use the system clipboard for all yanks/deletes/puts
-- Works on Linux, macOS, and (via provider below) WSL
vim.opt.clipboard = "unnamedplus"

-- Better default when pasting/code editing: do not continue comments automatically
vim.opt.formatoptions:remove({ "c", "r", "o" })

-- WSL clipboard provider: use win32yank if available; fallback to clip.exe + powershell
if vim.fn.has("wsl") == 1 then
  if vim.fn.executable("win32yank.exe") == 1 then
    vim.g.clipboard = {
      name = "win32yank-wsl",
      copy = {
        ["+"] = "win32yank.exe -i --crlf",
        ["*"] = "win32yank.exe -i --crlf",
      },
      paste = {
        ["+"] = "win32yank.exe -o --lf",
        ["*"] = "win32yank.exe -o --lf",
      },
      cache_enabled = 0,
    }
  else
    -- Fallback works if clip.exe and powershell.exe are on PATH (typical in WSL)
    vim.g.clipboard = {
      name = "wsl-clip",
      copy = {
        ["+"] = "clip.exe",
        ["*"] = "clip.exe",
      },
      paste = {
        ["+"] = 'powershell.exe -NoProfile -Command Get-Clipboard | tr -d "\\r"',
        ["*"] = 'powershell.exe -NoProfile -Command Get-Clipboard | tr -d "\\r"',
      },
      cache_enabled = 0,
    }
  end
end
