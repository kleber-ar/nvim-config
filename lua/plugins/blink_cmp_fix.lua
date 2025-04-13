return {
  'jackMort/blink.cmp',
  opts = function(_, opts)
    opts.cmdline = nil -- remove o campo que está causando erro
  end,
}
