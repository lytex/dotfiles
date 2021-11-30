#!/usr/bin/env/python

all = "qwertyuiopasdfghjklzxcvbnm"
exclude = "hjkl"
print(*[f'    bindsym {x} exec "i3-nagbar -m \'Unrecognized command, going back to default mode\'"; mode "default"' for x in all if x not in exclude], sep="\n")
