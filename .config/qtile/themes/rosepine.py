base = '#232136'
surface = '#2a273f'
overlay = '#393552'
muted = '#6e6a86'
subtle = '#908caa'
text = '#e0def4'
love = '#eb6f92'
gold = '#f6c177'
rose = '#ea9a97'
pine = '#3e8fb0'
foam = '#9ccfd9'
iris = '#c4a7e7'
highlight_low = '#2a283e'
highlight_med = '#44415a'
highlight_high = '#56526e'

def colors_init():
  return  [[base, base],  # panel background
          [base, highlight_med],  # background for current screen tab
          [love, rose],           # font color for group names
          [rose, rose],         # border line color for current tab
          [pine,pine],      # border line color for other tab and odd widgets
          [iris, iris],             # color for the even widgets
          [gold, gold]]             # window name


