#coding:utf8

import frontik.handler
from frontik.doc import Doc
from frontik import etree

from frontik_www import config as config

import tornado.web

class Page(frontik.handler.PageHandler):
    @tornado.web.asynchronous
    def get(self):
        self.set_xsl('index.xsl')
        
        text = u'html css';
        htmlcss = Doc('htmlcss')
        htmlcss.put(Doc('text').put(text))
        htmlcss.put(Doc('last').put(self.get_url(config.api_host + '/1/xml/vacancy/search/', {'text': text, 'items': '5', 'area':'1', 'professionalAreaId':'1'})))
        htmlcss.put(Doc('relevant').put(self.get_url(config.api_host + '/1/xml/vacancy/search/', {'text': text, 'order':'0', 'notWithoutSalary': 'true', 'items': '40', 'area':'1', 'professionalAreaId':'1'})))
        self.doc.put(htmlcss)
        
        text = u'javascript'
        javascript = Doc('javascript')
        javascript.put(Doc('text').put(text))
        javascript.put(Doc('last').put(self.get_url(config.api_host + '/1/xml/vacancy/search/', {'text': text, 'items': '5', 'area':'1', 'professionalAreaId':'1'})))
        javascript.put(Doc('relevant').put(self.get_url(config.api_host + '/1/xml/vacancy/search/', {'text': text, 'order':'0', 'notWithoutSalary': 'true', 'items': '40', 'area':'1', 'professionalAreaId':'1'})))
        self.doc.put(javascript)
        
        text = u'(xsl OR xslt)'
        xsl = Doc('xsl')
        xsl.put(Doc('text').put(text))
        xsl.put(Doc('last').put(self.get_url(config.api_host + '/1/xml/vacancy/search/', {'text': text, 'items': '5', 'area':'1', 'professionalAreaId':'1'})))
        xsl.put(Doc('relevant').put(self.get_url(config.api_host + '/1/xml/vacancy/search/', {'text': text, 'order':'0', 'notWithoutSalary': 'true', 'items': '40', 'area':'1', 'professionalAreaId':'1'})))
        self.doc.put(xsl)
        
        self.doc.put(Doc('headhunter').put(self.get_url(config.api_host + '/1/xml/employer/1455/')))
        self.doc.put(Doc('yandex').put(self.get_url(config.api_host + '/1/xml/employer/1740/')))
        self.doc.put(Doc('mail').put(self.get_url(config.api_host + '/1/xml/employer/15478/')))
        self.doc.put(Doc('rambler').put(self.get_url(config.api_host + '/1/xml/employer/8620/')))
        self.doc.put(Doc('kaspersky').put(self.get_url(config.api_host + '/1/xml/employer/1057/')))
        self.doc.put(Doc('abbyy').put(self.get_url(config.api_host + '/1/xml/employer/301/')))
        
        self.finish_page()

