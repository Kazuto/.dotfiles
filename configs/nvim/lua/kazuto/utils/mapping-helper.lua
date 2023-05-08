local function map(mode, bind, exec, desc)
  vim.keymap.set(mode, bind, exec, { desc = desc, noremap = true, silent = true})
end


function NMAP(bind, exec, desc)
  map('n', bind, exec, desc)
end

function TNMAP(bind, exec, desc)
  map({'t', 'n'}, bind, exec, desc)
end