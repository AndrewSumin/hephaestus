#coding:utf8

import frontik.handler
from frontik.doc import Doc

import tornado.web

frontik_import('handler')

class Page(frontik.handler.PageHandler):
    def get_page(self):
      self.set_cookie('yaru_vacancy', self.get_argument('vacancy', None));
      self.redirect('{host}?client_id={id}&response_type={type}'.format(
                                    host = self.config.yaru_authorize_host,
                                    id = self.config.yaru_client_id,
                                    type = 'code'
                                    ))