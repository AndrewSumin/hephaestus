#coding:utf8

import frontik.handler
from frontik.doc import Doc

import tornado.web

frontik_import('utils')
frontik_import('handler')

class Page(frontik.handler.PageHandler):
    def get_page(self):
        self.set_xsl('search.xsl')
        
        handler.do_pagedata(self)
        
        if (self.get_argument('salary', None)):
          salary = 'true'
        else:
          salary = None
        
        search = Doc('search')
        search.put(self.get_url_retry(self.config.api_host + '/1/xml/vacancy/search/',
                                {
                                 'text': utils.parse_text(self.get_argument('text', None)),
                                 'page': self.get_argument('page', None),
                                 'salary': self.get_argument('salary', None),
                                 'field': '1',
                                 'onlysalary': self.get_argument('onlysalary', None),
                                 'area':'1',
                                 'items': '20',
                                 'metro': self.get_argument('metro', None),
                                 'specialization': self.get_argument('specialization', None),
                                 'employment': self.get_argument('employment', None),
                                 'order': self.get_argument('order', None),
                                 'clusters': 'true'
                                })
        )
        self.doc.put(search)

