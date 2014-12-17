#!/usr/bin/python

import rxv
import os
import time

rx = rxv.RXV(os.environ["RX600"])

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

onWithBookmark(1) 
