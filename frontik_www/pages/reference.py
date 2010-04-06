import frontik.handler
from frontik import etree

import tornado.web

class Page(frontik.handler.PageHandler):
    @tornado.web.asynchronous
    def get(self):
        self.doc.put(self.get_url('http://hh.ru/rss/searchvacancy.xml?areaId=1&text=javascript'))
	self.finish_page()

