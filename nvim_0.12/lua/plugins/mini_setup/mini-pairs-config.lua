local ok, mini_pairs = pcall(require, "mini.pairs")
if not ok then
  vim.notify("Unable to load mini.pairs")
  return {}
end

mini_pairs.setup()
