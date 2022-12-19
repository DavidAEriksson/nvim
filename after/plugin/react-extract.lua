local ok, extract = pcall(require, 'react-extract')
if not ok then
  return
end

extract.setup()
