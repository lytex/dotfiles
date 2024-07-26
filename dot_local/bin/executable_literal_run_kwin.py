#!/usr/bin/env python3

import subprocess
from datetime import datetime
import sys


def run_kwin(script):
    datetime_now = datetime.now()

    reg_script_number = (
        subprocess.run(
            "dbus-send --print-reply --dest=org.kde.KWin \
                        /Scripting org.kde.kwin.Scripting.loadScript \
                        string:"
            + script
            + " | awk 'END {print $2}'",
            capture_output=True,
            shell=True,
        )
        .stdout.decode()
        .split("\n")[0]
    )

    subprocess.run(
        "dbus-send --print-reply --dest=org.kde.KWin /Scripting/Script"
        + reg_script_number
        + " org.kde.kwin.Script.run",
        shell=True,
        stdout=subprocess.DEVNULL,
    )
    subprocess.run(
        "dbus-send --print-reply --dest=org.kde.KWin /Scripting/Script"
        + reg_script_number
        + " org.kde.kwin.Script.stop",
        shell=True,
        stdout=subprocess.DEVNULL,
    )  # unregister number

    since = str(datetime_now)

    msg = (
        subprocess.run('journalctl _COMM=kwin_wayland -o cat --since "' + since + '"', capture_output=True, shell=True)
        .stdout.decode()
        .rstrip()
        .split("\n")
    )
    msg = filter(None, [el.lstrip("js: ") for el in msg])

    return "\n".join(msg)


if __name__ == "__main__":
    print(run_kwin(sys.argv[1]))
