#!/bin/bash
telegram-desktop &
google-chrome --remote-debugging-port=9100 &
source /home/mrsin/Scripts/python/venv/bin/activate & 
python3 /home/mrsin/Scripts/python/play_ya_music.py &
gnome-terminal -- bash  -c "clear & cd /home/mrsin/WorkWorkWork;exec bash"
