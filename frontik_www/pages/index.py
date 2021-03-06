#coding:utf8

import tornado.web
import urllib

import frontik.handler
from frontik.doc import Doc
from frontik import etree

frontik_import('storage')
frontik_import('utils')

def count_median(vacancies_xml):
    salaries = []

    for salary_xml in vacancies_xml.findall('{http://hh.ru/api}vacancies/{http://hh.ru/api}vacancy/{http://hh.ru/api}salary'):
        from_txt = salary_xml.findtext('{http://hh.ru/api}from')
        to_txt = salary_xml.findtext('{http://hh.ru/api}to')

        if (from_txt is not None) and (to_txt is not None):
            salaries.append((int(from_txt) + int(to_txt)) / 2)
        elif from_txt is not None:
            salaries.append(int(int(from_txt)*1.15))
        elif to_txt is not None:
            salaries.append(int(int(to_txt)*0.85))

    if len(salaries) > 0:
        salaries.sort()
        return salaries[len(salaries) / 2]
    else:
        return None


class Page(frontik.handler.PageHandler):
    def get_page(self):
        self.set_xsl('index.xsl')
        
        #median_storage = storage.MedianSalaryStorage(self.config.db_filename)
        
        tabs = Doc('tabs')
        self.doc.put(tabs)
        
        verstka_query = u'.verstka '
        
        def put_block(id, name, query_suffix=''):
            text = verstka_query + query_suffix;
            block = Doc('tab')

            block.put(Doc('name').put(name))
            block.put(Doc('text').put(urllib.quote(text.encode('utf-8'))))
            block.put(Doc('last').put(self.get_url_retry(self.config.api_host + '/1/xml/vacancy/search/', {'text': utils.parse_text(text), 'items': '5', 'order':'0',  'area':'1', 'professionalAreaId':'1'})))

            def put_median(m):
                median_block = Doc('median')
                median_block.put(str(m))
                block.put(median_block)
                
            def count_median_cb(xml, response):
                if xml is not None:
                    m = count_median(xml)
                    if m:
                        #median_storage.store_today(id, m, self)
                        put_median(m)
                        
            
#            self.log.debug('+++++++++++++++++++++++++++++++++++++++')
#            self.log.debug(storage.get_last_week_salaries(id))
            # if median_storage.has_today(id):
            #     self.log.debug('show median using cached value')
            #     put_median(storage.get_today(id))
            # else:
            self.log.debug('make search request to count median')
            self.get_url_retry(self.config.api_host + '/1/xml/vacancy/search/', {'text': utils.parse_text(text), 'order':'0', 'notWithoutSalary': 'true', 'items': '40', 'area':'1', 'professionalAreaId':'1'}, callback=count_median_cb)
            
            tabs.put(block)
        
        put_block('htmlcss', u'HTML и CSS')
        put_block('javascript', u'Javascript', u'javascript')
        put_block('jquery', u'jQuery', u'jquery')
        put_block('xslt', u'XSLT', u'xslt')
        put_block('php', u'PHP', u'php')
        put_block('perl', u'Perl', u'perl')

        for employer_id in ['1455', '1740', '15478', '43612', '8620', '1057',
                            '301', '4236', '6421', '2180']:
            self.doc.put(Doc('employer').put(self.get_url_retry(self.config.api_host + '/1/xml/employer/{0}/'.format(employer_id))))


