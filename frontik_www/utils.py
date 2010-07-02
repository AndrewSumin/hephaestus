# coding: utf-8

import re

def parse_text(text):
  if not text or not re.search(".verstka", text):
    return text
  p = re.compile(".verstka")
  return p.sub(u'("html css" OR "html и css" OR верстальщик OR верстка OR "разработчик интерфейсов")', text)