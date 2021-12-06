print('khascripts loaded.')

local nvcom = vim.api.nvim_command
local nexec = vim.api.nvim_exec
local nsvar = vim.api.nvim_buf_set_var

nvcom('command! -nargs=1 Tnpm lua npm_cmd("tabnew", <f-args>)')
nvcom('command! -nargs=1 Snpm lua npm_cmd("vsp", <f-args>)')

function _G.npm_cmd(buffer, args)
  nvcom(buffer)
  nvcom('term zsh -c "npm ' .. args .. '"')
end

function npm_cmd_experimental()
  -- WIP lua version in floating buffer
  local npm_command = 'npm ' .. args
  local npm_buf = vim.api.nvim_create_buf(false, false)
  local npm_win = vim.api.nvim_open_win(npm_buf, true,
    {
      relative='win',
      row=60,
      col=30,
      width=40,
      height=40,
      style='minimal',
      border='double'
    })
  local npm_term = vim.api.nvim_open_term(npm_buf, {})
  -- vim.api.nvim_chan_send(npm_term, 'whoami')
  -- vim.api.nvim_chan_send(npm_term, npm_command)
  -- print(npm_output)
end

