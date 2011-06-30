#coding:utf8

import frontik.handler
from frontik.doc import Doc

import tornado.web

frontik_import('handler')

class Page(frontik.handler.PageHandler):
    def get_page(self):
        self.set_xsl('vacancy.xsl')
        
        handler.do_pagedata(self)
        data = self.config.data[self.request.host]
        self.doc.put(Doc('partner').put(data['partner']))
        
        self.doc.put(self.get_url_retry(self.config.api_host + '/1/xml/vacancy/' + self.get_argument('id', None) + '/'))

