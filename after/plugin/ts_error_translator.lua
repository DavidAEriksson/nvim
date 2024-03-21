local ok, translator = pcall(require, 'ts-error-translator')

if not ok then
  return
end

translator.setup()
