import os

api_host = 'http://api.hh.ru'

XSL_root = os.path.normpath(os.path.join(os.path.dirname(__file__), "../xsl"))
XML_root = os.path.normpath(os.path.join(os.path.dirname(__file__), "../xml" ))
apply_xsl = True

db_filename = os.path.join(os.path.normpath(os.path.join(os.path.dirname(__file__), "..")),
                           'median_salaries.db')


hh_namespace = {'hh': 'http://hh.ru/api'}

yaru_client_id = 'a2f0bcc79dcb4e26af3475b16c40c4a0'
yaru_api_host = 'https://api-yaru.yandex.ru'
yaru_authorize_host = 'https://oauth.yandex.ru/authorize'
yaru_token_host = 'https://oauth.yandex.ru/token'
yaru_redirect_uri = 'http://beta.hh.jsx.ru/yaru/token'
yaru_namespace = {
  'atom':'http://www.w3.org/2005/Atom',
  'y': 'yandex:data'
}