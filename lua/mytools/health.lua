local health = vim.health or require("health")

local function check_tool(tool, install_cmd)
  if vim.fn.executable(tool) == 1 then
    health.ok(tool .. " is installed")
  else
    health.error(tool .. " is missing", "Install with: " .. install_cmd)
  end
end

local M = {}
M.check = function()
  health.start("my tools report")
  check_tool("cpplint", "pip install cpplint || sudo apt install cpplint")
  check_tool("pylint", "pip install pylint")
  check_tool("black", "pip install black")
  check_tool("isort", "pip install isort")
  check_tool("debugpy", "pip install debugpy || sudo apt install python3-debugpy")
  check_tool("shfmt", "sudo apt install shfmt || sudo dnf install shfmt || brew install shfmt")
  check_tool("shellcheck", "sudo apt install shellcheck || sudo dnf install shellcheck || brew install shellcheck")
  check_tool("clang-format", "sudo apt install clang-format || sudo dnf install clang-tools-extra || brew install clang-format")
end
return M

