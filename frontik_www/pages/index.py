#coding:utf8

import frontik.handler
from frontik.doc import Doc
from frontik import etree

import tornado.web

class Page(frontik.handler.PageHandler):
    @tornado.web.asynchronous
    def get(self):
        self.set_xsl('index.xsl')
        
        self.doc.put(Doc('htmlcss').put(self.get_url('http://api.chernenko.pyn.ru/1/xml/vacancy/search/?text=sales')))
        self.doc.put(Doc('javascript').put(self.get_url('http://api.chernenko.pyn.ru/1/xml/vacancy/search/', {'text': u'менеджер'})))
        self.doc.put(Doc('xsl').put(self.get_url('http://api.chernenko.pyn.ru/1/xml/vacancy/search/')))
        
        self.doc.put(Doc('headhunter').put(self.get_url('http://api.chernenko.pyn.ru/1/xml/employer/1455/')))
        self.doc.put(Doc('yandex').put(self.get_url('http://api.chernenko.pyn.ru/1/xml/employer/1740/')))
        self.doc.put(Doc('mail').put(self.get_url('http://api.chernenko.pyn.ru/1/xml/employer/15478/')))
        self.doc.put(Doc('rambler').put(self.get_url('http://api.chernenko.pyn.ru/1/xml/employer/8620/')))
        self.doc.put(Doc('kaspersky').put(self.get_url('http://api.chernenko.pyn.ru/1/xml/employer/1057/')))
        self.doc.put(Doc('abbyy').put(self.get_url('http://api.chernenko.pyn.ru/1/xml/employer/301/')))
        
        self.finish_page()

