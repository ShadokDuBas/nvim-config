Source :
[reddit](https://www.reddit.com/r/neovim/comments/13ski66/neovim_configuration_for_godot_4_lsp_as_simple_as/)


There are so many inaccurate,
or entirely too cumbersome guides on how to get Godot 4's LSP server to connect with Neovim.
I hope this post can be used to help anyone clear any confusion on how to connect
to Godot 4's LSP with Neovim's LSP client. As far as I can tell, this is as simple as it gets.
This avoids starting Neovim with any additional flags like several blogs and posts say is required,
and also avoids any unnecessary plugins.

Create the file nvim/after/ftplugin/gdscript.lua with the following contents:

``` lua
local port = os.getenv('GDScript_Port') or '6005'
local cmd = vim.lsp.rpc.connect('127.0.0.1', port)
local pipe = '/path/to/godot.pipe' -- I use /tmp/godot.pipe

vim.lsp.start({
  name = 'Godot',
  cmd = cmd,
  root_dir = vim.fs.dirname(vim.fs.find({ 'project.godot', '.git' }, { upward = true })[1]),
  on_attach = function(client, bufnr)
    vim.api.nvim_command('echo serverstart("' .. pipe .. '")')
  end
})
```

Once this is set up, Godot's External Editor settings need to be updated to use Neovim with the following settings:

```
Use External Editor: On
Exec Path: nvim
Exec Flags: --server /tmp/godot.pipe --remote-send "<esc>:n {file}<CR>:call cursor({line},{col})<CR>"
```

Restart Godot, open your Godot project in Neovim, and open any of the .gd files. 
You should now be connected to the language server, and double clicking script files in the editor should open them in Neovim.

Happy game dev-ing
