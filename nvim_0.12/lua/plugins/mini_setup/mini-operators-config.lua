local ok, mini_operators = pcall(require, "mini.operators")
if not ok then
  vim.notify("Unable to load mini.operators")
  return {}
end

mini_operators.setup()
