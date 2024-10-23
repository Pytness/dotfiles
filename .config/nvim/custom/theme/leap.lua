local colors = require 'custom.theme.colors'

return {
  LeapBackdrop = { link = 'Comment' },
  LeapMatch = {
    fg = colors.white,
    bold = true,
    nocombine = true,
  },
  LeapLabelPrimary = {
    bg = colors.black,
    fg = colors.leap_primary_label,
    bold = false,
    nocombine = true,
  },
  LeapLabelSecondary = {
    bg = colors.black,
    fg = colors.leap_secondary_label,
    bold = false,
    nocombine = true,
  },
}
