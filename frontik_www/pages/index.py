#coding:utf8

import urllib;
import frontik.handler
from frontik.doc import Doc
from frontik import etree

from frontik_www import config as config

import tornado.web

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
        
        verstka_query = u'("html css" OR "html и css" OR верстальщик OR верстка OR "разработчик интерфейсов") '
        
        def put_block(name, query_suffix=''):
            text = verstka_query + query_suffix;
            block = Doc(name)

            block.put(Doc('text').put(urllib.quote(text.encode('utf-8'))))
            block.put(Doc('last').put(self.get_url_retry(config.api_host + '/1/xml/vacancy/search/', {'text': text, 'items': '5', 'order':'0',  'area':'1', 'professionalAreaId':'1'})))

            def put_median(xml, response):
                if xml:
                    m = count_median(xml)
                    if m:
                        median_block = Doc('median')
                        median_block.put(str(m))
                        block.put(median_block)

            self.get_url_retry(config.api_host + '/1/xml/vacancy/search/', {'text': text, 'order':'0', 'notWithoutSalary': 'true', 'items': '40', 'area':'1', 'professionalAreaId':'1'}, callback=put_median)
            
            self.doc.put(block)
        
        put_block('htmlcss')
        put_block('php', u'php')
        put_block('jquery', u'jquery')
        put_block('perl', u'perl')
        put_block('javascript', u'javascript')
        put_block('xsl', u'xsl')

        self.doc.put(Doc('headhunter').put(self.get_url_retry(config.api_host + '/1/xml/employer/1455/')))
        self.doc.put(Doc('yandex').put(self.get_url_retry(config.api_host + '/1/xml/employer/1740/')))
        self.doc.put(Doc('mail').put(self.get_url_retry(config.api_host + '/1/xml/employer/15478/')))
        self.doc.put(Doc('rambler').put(self.get_url_retry(config.api_host + '/1/xml/employer/8620/')))
        self.doc.put(Doc('kaspersky').put(self.get_url_retry(config.api_host + '/1/xml/employer/1057/')))
        self.doc.put(Doc('abbyy').put(self.get_url_retry(config.api_host + '/1/xml/employer/301/')))
        self.doc.put(Doc('rbc').put(self.get_url_retry(config.api_host + '/1/xml/employer/563765/')))
        self.doc.put(Doc('actis').put(self.get_url_retry(config.api_host + '/1/xml/employer/4236/')))
        self.doc.put(Doc('rucenter').put(self.get_url_retry(config.api_host + '/1/xml/employer/6421/')))
        self.doc.put(Doc('ozon').put(self.get_url_retry(config.api_host + '/1/xml/employer/2180/')))

