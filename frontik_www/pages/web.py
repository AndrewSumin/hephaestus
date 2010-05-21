import frontik.handler
from frontik.doc import Doc
from frontik import etree

import tornado.web

class Page(frontik.handler.PageHandler):
    @tornado.web.asynchronous
    def get(self):
        self.set_xsl('web.xsl')
        
        self.finish_page()

