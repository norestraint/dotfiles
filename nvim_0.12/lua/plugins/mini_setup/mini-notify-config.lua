local ok, mini_notify = pcall(require, "mini.notify")
if not ok then
  vim.notify("Unable to load mini.notify")
  return {}
end

mini_notify.setup({})
