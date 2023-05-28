from libqtile import bar, layout, widget, hook
# from ..themes.tokyonight import colors_init

##### COLORS #####
# colors = [["#282a36", "#282a36"],  # panel background
#           ["#434758", "#434758"],  # background for current screen tab
#           ["#ffffff", "#ffffff"],  # font color for group names
#           ["#ff5555", "#ff5555"],  # border line color for current tab
#           ["#8d62a9", "#8d62a9"],  # border line color for other tab and odd widgets
#           ["#668bd7", "#668bd7"],  # color for the even widgets
#           ["#e1acff", "#e1acff"]]  # window name
# colors = colors_init()

def init_bar(colors,prompt):
    return [
        widget.Sep(
            linewidth=0,
            padding=6,
            foreground=colors[2],
            background=colors[2]
        ),
        widget.GroupBox(
            font="Ubuntu Bold",
            fontsize=9,
            margin_y=3,
            margin_x=0,
            padding_y=5,
            padding_x=5,
            borderwidth=3,
            active=colors[2],
            inactive=colors[2],
            rounded=False,
            highlight_color=colors[1],
            highlight_method="line",
            this_current_screen_border=colors[3],
            this_screen_border=colors[4],
            other_current_screen_border=colors[0],
            other_screen_border=colors[0],
            foreground=colors[2],
            background=colors[0]
        ),
        widget.Prompt(
            prompt=prompt,
            font="Ubuntu Mono",
            padding=10,
            foreground=colors[3],
            background=colors[0]
        ),
        widget.Sep(
            linewidth=0,
            padding=40,
            foreground=colors[2],
            background=colors[0]
        ),
        widget.WindowName(
            foreground=colors[6],
            background=colors[0],
            padding=0
        ),
        widget.TextBox(
            text=" 🌡",
            padding=2,
            foreground=colors[2],
            background=colors[0],
            fontsize=11
        ),
        widget.ThermalSensor(
            foreground=colors[2],
            background=colors[0],
            padding=5
        ),
        widget.TextBox(
            text=" ⟳",
            padding=2,
            foreground=colors[4],
            background=colors[0],
            fontsize=14
        ),
        widget.TextBox(
            text="Updates",
            padding=5,
            foreground=colors[4],
            background=colors[0]
        ),
        widget.TextBox(
            text=" 🖬",
            foreground=colors[3],
            background=colors[0],
            padding=0,
            fontsize=14
        ),
        widget.Memory(
            background=colors[0],
            foreground=colors[5],
            padding=5
        ),
        widget.Net(
            interface="wlp9s0",
            format='{down} ↓↑ {up}',
            foreground=colors[5],
            background=colors[0],
            padding=5
        ),
        widget.TextBox(
            foreground=colors[3],
            text=" Vol:",
            background=colors[0],
            padding=0
        ),
        widget.Volume(
            foreground=colors[3],
            background=colors[0],
            padding=5
        ),
        widget.CurrentLayout(
            foreground=colors[4],
            background=colors[0],
            padding=5
        ),
        widget.Clock(
            foreground=colors[2],
            background=colors[0],
            format="%A, %B %d  [ %H:%M ]"
        ),
        widget.Sep(
            linewidth=0,
            padding=10,
            foreground=colors[2],
            background=colors[0]
        ),
        widget.Systray(
            background=colors[0],
            padding=5
        ),
    ]

