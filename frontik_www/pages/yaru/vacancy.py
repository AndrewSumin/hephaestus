#coding:utf8

import urllib
import frontik.handler
from frontik.doc import Doc
from xml.sax.saxutils import escape

import tornado.web

frontik_import('handler')

class Page(frontik.handler.PageHandler):
    def get_page(self):
        self.set_xsl('yaru/vacancy.xsl')
        
        handler.do_pagedata(self)
        
        self.doc.put(self.get_url_retry(self.config.api_host + '/1/xml/vacancy/' + self.get_argument('id', None) + '/'))
        self.doc.put(self.get_url_retry('%s/me/' % self.config.yaru_api_host, headers={'Authorization': 'OAuth %s' % self.get_cookie('yaru_token')}))

    def post_page(self):
        def cb(xml, response):
          if xml is None:
            self.redirect('/vacancy/' + self.get_argument('id') + '/?yaru_error')
          else:
            self.redirect('/vacancy/' + self.get_argument('id') + '/?yaru_post=' + urllib.quote_plus(xml.xpath('//atom:link[@rel="alternate"]/@href', namespaces = self.config.yaru_namespace)[0]))
          
        data = '<?xml version="1.0" encoding="utf-8"?><entry xmlns:y="' + self.config.yaru_namespace['y'] + '" xmlns="http://www.w3.org/2005/Atom"><title>{title}</title><y:access>public</y:access><category scheme="urn:ya.ru:posttypes" term="text"/><content>{text}</content></entry>'.format(
                                     title = self.get_argument('title', '').encode('utf-8', 'xmlcharrefreplace'),
                                     text = escape(self.get_argument('text', '').encode('utf-8')))
        self.doc.put(self.post_url(self.get_argument('post', None),
                                   data = data,
                                   headers={
                                            'Authorization': 'OAuth %s' % self.get_cookie('yaru_token'),
                                            'Content-Type': 'application/atom+xml; type=entry; charset=utf-8'
                                            },
                                   callback = cb))