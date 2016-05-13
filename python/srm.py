#!/usr/bin/env python

import urllib2
import xmltodict

response = urllib2.urlopen('http://contests.acmicpc.info/contests.rss')
xml = response.read()

obj = xmltodict.parse(xml)
items = obj['rss']['channel']['item']
for item in items:
    if item['title'].find('SRM') == 0:
        print 'found!!!'


