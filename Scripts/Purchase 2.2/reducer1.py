#!/usr/bin/python
import sys

oldKey = None
maxPayment = 0.0

for line in sys.stdin:
    data = line.strip().split("\t")
    if len(data) != 2:
        continue

    city, payment = data

    try:
        payment = float(payment)
    except ValueError:
        continue

    if oldKey is not None and oldKey != city:
        print("{0}\t{1}".format(oldKey, maxPayment))
        maxPayment = 0.0

    if oldKey != city:
        oldKey = city

    maxPayment = max(maxPayment, payment)

if oldKey is not None:
    print("{0}\t{1}".format(oldKey, maxPayment))

