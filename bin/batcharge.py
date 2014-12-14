#!/usr/bin/env python
# coding=UTF-8

import math, subprocess

p = subprocess.Popen(["ioreg", "-rc", "AppleSmartBattery"], stdout=subprocess.PIPE)
output = p.communicate()[0]

o_max = [l for l in output.splitlines() if 'MaxCapacity' in l][0]
o_cur = [l for l in output.splitlines() if 'CurrentCapacity' in l][0]

o_plugged = [l for l in output.splitlines() if 'ExternalChargeCapable' in l][0]

b_max = float(o_max.rpartition('=')[-1].strip())
b_cur = float(o_cur.rpartition('=')[-1].strip())
b_plugged = o_plugged.rpartition('=')[-1].strip() == 'Yes'

charge = b_cur / b_max
charge_threshold = int(math.ceil(10 * charge))

# Output
filled_char = u'●'
empty_char = u'○'

total_slots, slots = 10, []
filled = int(math.ceil(charge_threshold * (total_slots / 10.0))) * filled_char
empty = (total_slots - len(filled)) * empty_char

out = (filled + empty).encode('utf-8')
import sys

color_green = '%{[32m%}'
color_yellow = '%{[1;33m%}'
color_red = '%{[31m%}'
color_reset = '%{[00m%}'
bg_white = '%{[47m%}'
bg_reset = '%{[49m%}'
color_out = (
    color_green if len(filled) > 6
    else color_yellow if len(filled) > 4
    else color_red
)

out = color_out + out + color_reset

try:
    flag = sys.argv[1]
    print flag
except IndexError, e:
    flag = None

if b_plugged:
    out += color_green + " P" + color_reset;
else:
    out += color_red + " B" + color_reset;

sys.stdout.write(out)