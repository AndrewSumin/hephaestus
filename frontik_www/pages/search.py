#coding:utf8

import frontik.handler
from frontik.doc import Doc

import tornado.web

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
                                 'text': self.get_argument('text', None),
                                 'page': self.get_argument('page', None),
                                 'salary': self.get_argument('salary', None),
                                 'field': self.get_argument('field', self.config.data[self.request.host]['field']),
                                 'onlysalary': self.get_argument('onlysalary', None),
                                 'region': self.get_argument('region', '1'),
                                 'items': '20',
                                 'metro': self.get_argument('metro', None),
                                 'specialization': self.get_argument('specialization', None),
                                 'employment': self.get_argument('employment', None),
                                 'order': self.get_argument('order', None),
                                 'clusters': 'true'
                                })
        )
        self.doc.put(search)

