#!/usr/bin/python
import sys

old_key = None
total = 0.0

for line in sys.stdin:
    data = line.strip().split("\t")

    if len(data) != 2:
        continue

    key, value = data

    try:
        value = float(value)
    except ValueError:
        continue

    if old_key is not None and key != old_key:
        print("{0}\t{1:g}".format(old_key, total))
        total = 0.0

    old_key = key
    total += value

if old_key is not None:
    print("{0}\t{1:g}".format(old_key, total))

