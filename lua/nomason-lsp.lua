-- vim.lsp.enable({'veridian-personal'})
vim.lsp.enable({'slang-server'})
-- if using MINGW64 on MSYS2, enable the special clangd config
local pathVal = os.getenv("PATH")
if (type(pathVal) == "string" and string.find(pathVal, "C:\\msys64\\mingw64\\bin")) then
    vim.lsp.enable({'windows-clangd'})
end
