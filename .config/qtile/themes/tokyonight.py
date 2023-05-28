
pink = '#f7768e'
orange = '#ff9e64'
yellow = '#e0af68'
lime_green = '#9ece6a'
teal = '#73daca'
light_teal = '#b4f9f8'
aqua = '#2ac3de'
light_blue = '#7dcfff'
blue = '#7aa2f7'
lavendar = '#bb9af7'
offwhite = '#c0caf5'
eggshell = '#a9b1d6'
light_purple = '#9aa5ce'
light_yellow = '#cfc9c2'
grey = '#565f89'
terminal_black = '#414868'
storm_black = '#24283b'
night_black = '#1a1b26'

def colors_init():
  return  [[storm_black, storm_black],  # panel background
          [night_black, storm_black ],  # background for current screen tab
          [lime_green, teal],           # font color for group names
          [lavendar, lavendar],         # border line color for current tab
          [lime_green,lime_green],      # border line color for other tab and odd widgets
          [yellow, yellow],             # color for the even widgets
          [orange, orange]]             # window name

