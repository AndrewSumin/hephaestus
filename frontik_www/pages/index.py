#coding:utf8

import urllib;
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
        
        def put_block(name, query_suffix=''):
            text = verstka_query + query_suffix;
            block = Doc(name)
            block.put(Doc('text').put(urllib.quote(text.encode('utf-8'))))
            block.put(Doc('last').put(self.get_url_retry(config.api_host + '/1/xml/vacancy/search/', {'text': text, 'items': '5', 'order':'0',  'area':'1', 'professionalAreaId':'1'})))
            block.put(Doc('relevant').put(self.get_url_retry(config.api_host + '/1/xml/vacancy/search/', {'text': text, 'order':'0', 'notWithoutSalary': 'true', 'items': '40', 'area':'1', 'professionalAreaId':'1'})))
            self.doc.put(block)
        
        put_block('htmlcss')
        put_block('php', u'php')
        put_block('jquery', u'jquery')
        put_block('perl', u'perl')
        put_block('javascript', u'javascript')
        put_block('xsl', u'(xsl OR xslt)')
        
        self.doc.put(Doc('headhunter').put(self.get_url_retry(config.api_host + '/1/xml/employer/1455/')))
        self.doc.put(Doc('yandex').put(self.get_url_retry(config.api_host + '/1/xml/employer/1740/')))
        self.doc.put(Doc('mail').put(self.get_url_retry(config.api_host + '/1/xml/employer/15478/')))
        self.doc.put(Doc('rambler').put(self.get_url_retry(config.api_host + '/1/xml/employer/8620/')))
        self.doc.put(Doc('kaspersky').put(self.get_url_retry(config.api_host + '/1/xml/employer/1057/')))
        self.doc.put(Doc('abbyy').put(self.get_url_retry(config.api_host + '/1/xml/employer/301/')))
        self.doc.put(Doc('rbc').put(self.get_url_retry(config.api_host + '/1/xml/employer/563765/')))
        self.doc.put(Doc('actis').put(self.get_url_retry(config.api_host + '/1/xml/employer/4236/')))
        self.doc.put(Doc('rucenter').put(self.get_url_retry(config.api_host + '/1/xml/employer/6421/')))
        self.doc.put(Doc('ozon').put(self.get_url_retry(config.api_host + '/1/xml/employer/2180/')))
        
        self.finish_page()

