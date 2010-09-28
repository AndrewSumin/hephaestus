#coding:utf8

import frontik.handler
from frontik.doc import Doc

import tornado.web

frontik_import('handler')

class Page(frontik.handler.PageHandler):
    def get_page(self):
      self.clear_cookie('yaru_vacancy');
      def get_token(data, response):
        self.set_cookie('yaru_token', data['access_token']);
        self.redirect('/yaru/vacancy?id=' + str(self.get_cookie('yaru_vacancy')))
      if self.get_argument('code', None):
        self.post_url(self.config.yaru_token_host, {
          'code':self.get_argument('code', ''),
          'client_id':self.config.yaru_client_id,
          'redirect_uri':self.config.yaru_redirect_uri,
          'grant_type':'authorization_code'},
          callback = get_token)
      elif self.get_argument('error', None) == 'access_denied':
        self.redirect('/vacancy/' + str(self.get_cookie('yaru_vacancy')) + '/?yaru_denied')
      else:
        self.redirect('/vacancy/' + str(self.get_cookie('yaru_vacancy')) + '/?yaru_error')