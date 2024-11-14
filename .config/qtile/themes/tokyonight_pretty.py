# pink = "#f7768e"
# orange = "#ff9e64"
# yellow = "#e0af68"
# lime_green = "#9ece6a"
# teal = "#73daca"
# light_teal = "#b4f9f8"
# aqua = "#2ac3de"
# light_blue = "#7dcfff"
# blue = "#7aa2f7"
# lavendar = "#bb9af7"
# offwhite = "#c0caf5"
# eggshell = "#a9b1d6"
# light_purple = "#9aa5ce"
# light_yellow = "#cfc9c2"
# grey = "#565f89"
# terminal_black = "#414868"
# storm_black = "#24283b"
# night_black = "#1a1b26"


white = "#CBE0F0"  # white
black = "#011423"  # black
lime_green = "#47FF9C"  # lime green
dark_blue = "#033259"  # dark blue

blue = "#214969"  # blue
red = "#E52E2E"  # red
green = "#44FFB1"  # green
yellow = "#FFE073"  # yellow
purple = "#A277FF"  # purple
cyan = "#24EAF7"  # cyan


def colors_init():
    return [
        [black, black],  # panel background
        [blue, blue],  # background for current screen tab
        [purple, cyan],  # font color for group names
        [dark_blue, lime_green],  # border line color for current tab
        [lime_green, lime_green],  # border line color for other tab and odd widgets
        [yellow, yellow],  # color for the even widgets
        [green, green],  # window name
    ]
