#coding:utf8

import frontik.handler
from frontik.doc import Doc

from frontik_www import config as config

import frontik_www.handler as handler

import tornado.web

class Page(frontik.handler.PageHandler):
    def get_page(self):
        self.set_xsl('search.xsl')
        
        handler.do_pagedata(self)
        
        if (self.get_argument('salary', None)):
          salary = 'true'
        else:
          salary = None
        
        search = Doc('search')
        search.put(self.get_url(config.api_host + '/1/xml/vacancy/search/',
                                {
                                 'text': self.get_argument('text', None),
                                 'page': self.get_argument('page', None),
                                 'salary': self.get_argument('salary', None),
                                 'notWithoutSalary': salary,
                                 'area':'1',
                                 'items': '20',
                                 'professionalAreaId':'1',
                                 'items': '20',
                                })
        )
        self.doc.put(search)

