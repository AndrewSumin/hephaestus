#coding:utf8

import frontik.handler
from frontik.doc import Doc
from frontik import etree

import tornado.web

class Page(frontik.handler.PageHandler):
    @tornado.web.asynchronous
    def get(self):
        self.set_xsl('index.xsl')
        
        htmlcss = Doc('htmlcss')
        htmlcss.put(Doc('last').put(self.get_url('http://api.hh.ru/1/xml/vacancy/search/', {'text': u'html css', 'items': '5', 'area':'1'})))
        htmlcss.put(Doc('relevant').put(self.get_url('http://api.hh.ru/1/xml/vacancy/search/', {'text': u'html css', 'order':'0', 'notWithoutSalary': 'true', 'items': '40', 'area':'1'})))
        self.doc.put(htmlcss)
        javascript = Doc('javascript')
        javascript.put(Doc('last').put(self.get_url('http://api.hh.ru/1/xml/vacancy/search/', {'text': u'javascript', 'items': '5', 'area':'1'})))
        javascript.put(Doc('relevant').put(self.get_url('http://api.hh.ru/1/xml/vacancy/search/', {'text': u'javascript', 'order':'0', 'notWithoutSalary': 'true', 'items': '40', 'area':'1'})))
        self.doc.put(javascript)
        xsl = Doc('xsl')
        xsl.put(Doc('last').put(self.get_url('http://api.hh.ru/1/xml/vacancy/search/', {'text': u'(xsl OR xslt)', 'items': '5', 'area':'1'})))
        xsl.put(Doc('relevant').put(self.get_url('http://api.hh.ru/1/xml/vacancy/search/', {'text': u'(xsl OR xslt)', 'order':'0', 'notWithoutSalary': 'true', 'items': '40', 'area':'1'})))
        self.doc.put(xsl)
        
        self.doc.put(Doc('headhunter').put(self.get_url('http://api.hh.ru/1/xml/employer/1455/')))
        self.doc.put(Doc('yandex').put(self.get_url('http://api.hh.ru/1/xml/employer/1740/')))
        self.doc.put(Doc('mail').put(self.get_url('http://api.hh.ru/1/xml/employer/15478/')))
        self.doc.put(Doc('rambler').put(self.get_url('http://api.hh.ru/1/xml/employer/8620/')))
        self.doc.put(Doc('kaspersky').put(self.get_url('http://api.hh.ru/1/xml/employer/1057/')))
        self.doc.put(Doc('abbyy').put(self.get_url('http://api.hh.ru/1/xml/employer/301/')))
        
        self.finish_page()

