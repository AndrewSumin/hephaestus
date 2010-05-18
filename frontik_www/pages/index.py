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
        
        verstka_query = u'("html css" OR "html и css" OR верстальщик OR верстка OR "разработчик интерфейсов") '
        
        text = verstka_query;
        htmlcss = Doc('htmlcss')
        htmlcss.put(Doc('text').put(text))
        htmlcss.put(Doc('last').put(self.get_url(config.api_host + '/1/xml/vacancy/search/', {'text': text, 'items': '5', 'area':'1', 'professionalAreaId':'1'})))
        htmlcss.put(Doc('relevant').put(self.get_url(config.api_host + '/1/xml/vacancy/search/', {'text': text, 'order':'0', 'notWithoutSalary': 'true', 'items': '40', 'area':'1', 'professionalAreaId':'1'})))
        self.doc.put(htmlcss)
        
        text = verstka_query + u'php';
        php = Doc('php')
        php.put(Doc('text').put(text))
        php.put(Doc('last').put(self.get_url(config.api_host + '/1/xml/vacancy/search/', {'text': text, 'items': '5', 'area':'1', 'professionalAreaId':'1'})))
        php.put(Doc('relevant').put(self.get_url(config.api_host + '/1/xml/vacancy/search/', {'text': text, 'order':'0', 'notWithoutSalary': 'true', 'items': '40', 'area':'1', 'professionalAreaId':'1'})))
        self.doc.put(php)
        
        text = verstka_query + u'python';
        python = Doc('python')
        python.put(Doc('text').put(text))
        python.put(Doc('last').put(self.get_url(config.api_host + '/1/xml/vacancy/search/', {'text': text, 'items': '5', 'area':'1', 'professionalAreaId':'1'})))
        python.put(Doc('relevant').put(self.get_url(config.api_host + '/1/xml/vacancy/search/', {'text': text, 'order':'0', 'notWithoutSalary': 'true', 'items': '40', 'area':'1', 'professionalAreaId':'1'})))
        self.doc.put(python)
        
        text = verstka_query + u'perl';
        perl = Doc('perl')
        perl.put(Doc('text').put(text))
        perl.put(Doc('last').put(self.get_url(config.api_host + '/1/xml/vacancy/search/', {'text': text, 'items': '5', 'area':'1', 'professionalAreaId':'1'})))
        perl.put(Doc('relevant').put(self.get_url(config.api_host + '/1/xml/vacancy/search/', {'text': text, 'order':'0', 'notWithoutSalary': 'true', 'items': '40', 'area':'1', 'professionalAreaId':'1'})))
        self.doc.put(perl)
        
        text = verstka_query + u'javascript'
        javascript = Doc('javascript')
        javascript.put(Doc('text').put(text))
        javascript.put(Doc('last').put(self.get_url(config.api_host + '/1/xml/vacancy/search/', {'text': text, 'items': '5', 'area':'1', 'professionalAreaId':'1'})))
        javascript.put(Doc('relevant').put(self.get_url(config.api_host + '/1/xml/vacancy/search/', {'text': text, 'order':'0', 'notWithoutSalary': 'true', 'items': '40', 'area':'1', 'professionalAreaId':'1'})))
        self.doc.put(javascript)
        
        text = verstka_query + u'(xsl OR xslt)'
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

