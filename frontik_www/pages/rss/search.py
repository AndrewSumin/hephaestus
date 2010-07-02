#coding:utf8

import frontik.handler
from frontik.doc import Doc

from frontik_www import config as config

import frontik_www.handler as handler

import tornado.web

import frontik_www.utils as utils

class Page(frontik.handler.PageHandler):
    def get_page(self):
        self.set_header('Content-Type', 'application/rss+xml; charset=UTF-8')
        self.set_xsl('rss/search.xsl')
        
        handler.do_pagedata(self)
        
        if (self.get_argument('salary', None)):
          salary = 'true'
        else:
          salary = None
        
        search = Doc('search')
        search.put(self.get_url_retry(config.api_host + '/1/xml/vacancy/search/',
                                {
                                 'text': utils.parse_text(self.get_argument('text', None)),
                                 'salary': self.get_argument('salary', None),
                                 'field': '1',
                                 'onlysalary': self.get_argument('onlysalary', None),
                                 'area':'1',
                                 'items': '20',
                                 'metro': self.get_argument('metro', None),
                                 'specialization': self.get_argument('specialization', None),
                                 'employment': self.get_argument('employment', None),
                                 'order': self.get_argument('order', None),
                                })
        )
        self.doc.put(search)

