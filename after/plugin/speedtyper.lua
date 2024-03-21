local ok, speedtyper = pcall(require, 'speedtyper')

if not ok then
  return
end

speedtyper.setup({
  window = {
    height = 10, -- integer >= 5 | float in range (0, 1)
    width = 0.55, -- integer | float in range (0, 1)
    border = 'rounded', -- "none" | "single" | "double" | "rounded" | "shadow" | "solid"
  },
  language = 'en', -- "en" | "sr" currently only only supports English and Serbian
  sentence_mode = false, -- if true, whole sentences will be used
  custom_text_file = nil, -- provide a path to file that contains your custom text (if this is not nil, language option will be ignored)
  randomize = false, -- randomize words from custom_text_file
  game_modes = { -- prefered settings for different game modes
    -- type until time expires
    countdown = {
      time = 15,
    },
    -- type until you complete one page
    stopwatch = {
      hide_time = false, -- hide time while typing
    },
    -- NOTE: the window height will become the same as the window width
    rain = {
      initial_speed = 0.7, -- words fall down by one line every x seconds
      throttle = 7, -- increase speed every x seconds (set to -1 for constant speed)
      lives = 3,
    },
  },
  -- specify highlight group for each component
  highlights = {
    untyped_text = 'Comment',
    typo = 'ErrorMsg',
    clock = 'ErrorMsg',
    falling_word_typed = 'DiagnosticOk',
    falling_word = 'Normal',
    falling_word_warning1 = 'WarningMsg',
    falling_word_warning2 = 'ErrorMsg',
  },
  -- this values will be restored to your prefered settings after the game ends
  vim_opt = {
    -- only applies to insert mode, while playing the game
    guicursor = nil, -- "ver25" | "hor20" | "block" | nil means do not change
  },
})
