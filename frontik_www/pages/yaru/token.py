#coding:utf8

import frontik.handler
from frontik.doc import Doc

import tornado.web

frontik_import('handler')

class Page(frontik.handler.PageHandler):
    def get_page(self):
      
      def get_token(data, response):
        self.set_cookie('yaru_token', data['access_token']);
        self.clear_cookie('yaru_vacancy');
        self.redirect('/yaru/vacancy?id=' + str(self.get_cookie('yaru_vacancy')))
      
      self.post_url(self.config.yaru_token_host, {
        'code':self.get_argument('code', ''),
        'client_id':self.config.yaru_client_id,
        'redirect_uri':self.config.yaru_redirect_uri,
        'grant_type':'authorization_code'},
        callback = get_token)