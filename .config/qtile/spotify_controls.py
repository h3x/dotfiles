from subprocess import CompletedProcess, run
from typing import List

from libqtile.group import _Group
from libqtile.config import Screen

from libqtile.widget import base


class SpotifyControls(base.ThreadPoolText):
    """
    A widget to interact with spotify via dbus.
    """

    defaults = [
        ("control", "next", "choose between next or previous"),
        ("next_icon", "", "icon to display when music paused"),
        ("previous_icon", "", "icon to display when music paused"),
        ("update_interval", 0.5, "polling rate in seconds"),
        ("format", "{icon}", "Spotify display format"),
    ]

    def __init__(self, **config) -> None:
        base.ThreadPoolText.__init__(self, text="", **config)
        self.add_defaults(SpotifyControls.defaults)
        callback = self.next_song if self.control == 'next' else self.previous_song
        self.add_callbacks(
            {
                "Button1": callback,
            }
        )

    def _is_proc_running(self, proc_name: str) -> bool:
        # create regex pattern to search for to avoid similar named processes
        pattern = proc_name + "$"

        # pgrep will return a string of pids for matching processes
        proc_out = run(["pgrep", "-fli", pattern], capture_output=True).stdout.decode(
            "utf-8"
        )

        # empty string means nothing started
        is_running = proc_out != ""

        return is_running


    def poll(self) -> str:
        """Poll content for the text box"""
        vars = {}
        vars["icon"] = self.next_icon if self.control == 'next' else self.previous_icon
        return self.format.format(**vars)

    def next_song(self) -> None:
        run(
            "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next",
            shell=True,
        )

    def previous_song(self) -> None:
        run(
            "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous",
            shell=True,
        )
    def get_proc_output(self, proc: CompletedProcess) -> str:
        if proc.stderr.decode("utf-8") != "":
            return (
                ""
                if "org.mpris.MediaPlayer2.spotify" in proc.stderr.decode("utf-8")
                else proc.stderr.decode("utf-8")
            )

        output = proc.stdout.decode("utf-8").rstrip()
        return output

    @property
    def _meta(self) -> str:
        proc = run(
            "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata'",
            shell=True,
            capture_output=True,
        )

        output: str = proc.stdout.decode("utf-8").replace("'", "ʼ").rstrip()
        return "" if ("org.mpris.MediaPlayer2.spotify" in output) else output

    @property
    def playing(self) -> bool:
        play = run(
            "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'PlaybackStatus' | grep -o Playing",
            shell=True,
            capture_output=True,
        ).stdout.decode("utf-8")

        is_running = play != ""
        return is_running
