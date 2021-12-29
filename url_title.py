#!/usr/bin/env python3
import os
import sys
from html.parser import HTMLParser


class GetTitle(HTMLParser):
    _process = True
    name = ''

    def handle_starttag(self, tag, attrs):
        if tag == 'title':
            self._process = True

    def handle_data(self, data):
        if self._process:
            self.name = data

    def handle_endtag(self, tag):
        self._process = False


def get_title(archivo):
    name = ''
    try:
        with open(archivo) as f:
            content = f.readlines()
        title = GetTitle()
        title.feed(content[0])
        name = title.name.split(' - ')[1]
        name = name.replace(' ', '_')
        name = name.replace('/', '_')
    except:
        pass

    if name:
        print(name.lower())
    else:
        print(os.path.basename(archivo[0:archivo.find('.')]))


if  __name__ =='__main__':
    for K in sys.argv[1:]:
        get_title(K)
