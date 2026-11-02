#!/usr/bin/python
import sys

for line in sys.stdin:
    data = line.strip().split("\t")

    if len(data) != 6:
        continue

    date, time, city, item, cost, payment = data

    fields = [
        ("date", date),
        ("time", time),
        ("city", city),
        ("item", item),
        ("payment", payment)
    ]

    for field, value in fields:
        print("{0}:{1}\t1".format(field, value))

    try:
        cost = float(cost)
        print("cost:total\t{0}".format(cost))
    except ValueError:
        continue


