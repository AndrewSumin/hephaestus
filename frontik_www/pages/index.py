#coding:utf8

import frontik.handler
from frontik.doc import Doc
from frontik import etree

import tornado.web

class Page(frontik.handler.PageHandler):
    @tornado.web.asynchronous
    def get(self):
        self.set_xsl('index.xsl')
        
        self.doc.put(Doc("htmlcss").put(self.get_url('http://api.chernenko.pyn.ru/1/xml/vacancy/search/?text=sales')))
        self.doc.put(Doc("javascript").put(self.get_url('http://api.chernenko.pyn.ru/1/xml/vacancy/search/?text=manager')))
        self.doc.put(Doc("xsl").put(self.get_url('http://api.chernenko.pyn.ru/1/xml/vacancy/search/')))
        
        self.doc.put(Doc("headhunter").put(self.get_url('http://api.chernenko.pyn.ru/1/xml/vacancy/employer/1455/')))
        self.doc.put(Doc("yandex").put(self.get_url('http://api.chernenko.pyn.ru/1/xml/vacancy/employer/1740/')))
        
        self.finish_page()

