local ok, mini_icons = pcall(require, "mini.icons")
if not ok then
  vim.notify("Unable to load mini.icons")
  return {}
end

mini_icons.setup()
