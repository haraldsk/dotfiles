-- Auto-detect Python virtual environment
local function get_python_path(workspace)
  -- Check common venv locations in order
  local venv_patterns = {
    workspace .. "/.venv/bin/python",
    workspace .. "/venv/bin/python",
    workspace .. "/.virtualenv/bin/python",
    workspace .. "/env/bin/python",
  }

  for _, path in ipairs(venv_patterns) do
    if vim.fn.filereadable(path) == 1 then
      return path
    end
  end

  -- Fallback to system Python or pyenv
  return vim.fn.exepath("python3") or vim.fn.exepath("python")
end

return {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic", -- off, basic, strict
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "workspace",
      },
    },
  },
  -- Auto-detect Python interpreter from virtual environment
  before_init = function(_, config)
    local python_path = get_python_path(config.root_dir)
    config.settings.python.pythonPath = python_path
  end,
  on_new_config = function(config, root_dir)
    local python_path = get_python_path(root_dir)
    config.settings.python.pythonPath = python_path
  end,
}