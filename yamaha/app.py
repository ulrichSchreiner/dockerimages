#!/usr/bin/python

import rxv
import os
import time
import sys

rx = rxv.RXV(os.environ["RX600"])

def off ():
  rx.on = False

def onWithBookmark (num):
  rx.on = True
  time.sleep(2)
  rx.input = "NET RADIO"
  time.sleep(1)
  rx.volume = -80
  rx.menu_jump_line(1)
  rx.menu_sel()
  time.sleep(2)
  rx.menu_jump_line(1)
  rx.menu_sel()
  time.sleep(2)
  rx.menu_jump_line(num)
  rx.menu_sel()
  time.sleep(2)
  rx.volume_fade(-65)

if __name__ == "__main__":
  if len(sys.argv) == 1:
    onWithBookmark(1)
    sys.exit(0) 
  cmd = sys.argv[1]
  if cmd == "bookmark":
    bm = int(sys.argv[2])
    onWithBookmark(bm)
    sys.exit(0)
  if cmd == "off":
    off ()
    sys.exit(0)
