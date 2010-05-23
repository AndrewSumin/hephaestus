#coding:utf8

import frontik.handler
from frontik.doc import Doc

from frontik_www import config as config

import frontik_www.handler as handler

import tornado.web

class Page(frontik.handler.PageHandler):
    def get_page(self):
        self.set_xsl('employer.xsl')
        
        handler.do_pagedata(self)
        
        self.doc.put(self.get_url_retry(config.api_host + '/1/xml/employer/' + self.get_argument('id', None) + '/'))
        self.doc.put(self.get_url_retry('http://api.chernenko.pyn.ru/1/xml/vacancy/employer/' + self.get_argument('id', None) + '/'))
        #self.doc.put(self.get_url_retry(config.api_host + '/1/xml/vacancy/employer/' + self.get_argument('id', None) + '/'))

