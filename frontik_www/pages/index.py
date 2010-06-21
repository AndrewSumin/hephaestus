#coding:utf8

import tornado.web
import urllib

import frontik.handler
from frontik.doc import Doc
from frontik import etree

import frontik_www.storage
from frontik_www import config as config

storage = frontik_www.storage.MedianSalaryStorage(config.db_filename)


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
        
        tabs = Doc('tabs')
        self.doc.put(tabs)
        
        verstka_query = u'sales '
        
        def put_block(id, name, query):
            block = Doc('tab')

            block.put(Doc('name').put(name))
            block.put(Doc('text').put(urllib.quote(query['text'].encode('utf-8'))))
            block.put(Doc('salary').put(urllib.quote(query['salary'].encode('utf-8'))))
            block.put(Doc('onlysalary').put(urllib.quote(query['onlysalary'].encode('utf-8'))))
            block.put(Doc('last').put(self.get_url_retry(config.api_host + '/1/xml/vacancy/search/', query)))

            def put_median(m):
                median_block = Doc('median')
                median_block.put(str(m))
                block.put(median_block)
                
            def count_median_cb(xml, response):
                if xml:
                    m = count_median(xml)
                    if m:
                        storage.store_today(id, m)
                        put_median(m)

            if storage.has_today(id):
                self.log.debug('show median using cached value')
                put_median(storage.get_today(id))
            else:
                query['items']='40'
                query['order']='0'
                query['onlysalary']='true'
                self.log.debug('make search request to count median')
                self.get_url_retry(config.api_host + '/1/xml/vacancy/search/', query, callback=count_median_cb)
            
            tabs.put(block)
        
        put_block('director', u'Управление', {'text': u'Директор OR Начальник OR Руководитель', 'items': '5', 'order':'0',  'area':'1', 'field':'17', 'salary':'150000','onlysalary':'true'})
        put_block('b2b', u'Услуги для бизнеса', {'text': u'(NOT (Директор OR Начальник OR Руководитель)) AND (по продажам OR sales) AND ("продажа услуг" OR "продажа рекламы" OR b2b)', 'items': '5', 'order':'0',  'area':'1', 'field':'17', 'salary':'70000', 'onlysalary':'true'})
        put_block('fmcg', u'FMCG', {'text': u'(NOT (Директор OR Начальник OR Руководитель)) AND (по продажам OR sales) AND (FMCG OR "товары народного потребления")', 'items': '5', 'order':'0',  'area':'1', 'field':'17', 'salary':'70000', 'onlysalary':'true'})
        put_block('gsm', u'Нефть, бензин ...', {'text': u'(NOT (Директор OR Начальник OR Руководитель)) AND (по продажам OR sales) AND (нефть OR Металлопрокат OR Станки OR "промышленное оборудование" OR "производственное оборудование" OR "вентиляционное оборудование" OR "автомобильные масла" OR "строительные материалы" OR "металлоконструкции" OR "сварочные" OR "продажа ГСМ" OR "производство ГСМ")', 'items': '5', 'order':'0',  'area':'1', 'field':'17', 'salary':'70000', 'onlysalary':'true'})
        put_block('trade', u'Торговые представители', {'text': u'(NOT (Директор OR руководство OR супервайзер OR Управляющий OR Начальник OR Руководитель)) AND (Торговый представитель)', 'items': '5', 'order':'0',  'area':'1', 'field':'17', 'salary':'60000', 'onlysalary':'true'})
        put_block('cunsalt', u'Консультанты', {'text': u'Продавец консультант', 'items': '5', 'order':'0',  'area':'1', 'field':'17', 'salary':'35000', 'onlysalary':'true'})

        self.doc.put(Doc('employer').put(self.get_url_retry(config.api_host + '/1/xml/employer/1455/')))
        self.doc.put(Doc('employer').put(self.get_url_retry(config.api_host + '/1/xml/employer/1740/')))
        self.doc.put(Doc('employer').put(self.get_url_retry(config.api_host + '/1/xml/employer/15478/')))
        self.doc.put(Doc('employer').put(self.get_url_retry(config.api_host + '/1/xml/employer/8620/')))
        self.doc.put(Doc('employer').put(self.get_url_retry(config.api_host + '/1/xml/employer/1057/')))
        self.doc.put(Doc('employer').put(self.get_url_retry(config.api_host + '/1/xml/employer/301/')))
        self.doc.put(Doc('employer').put(self.get_url_retry(config.api_host + '/1/xml/employer/563765/')))
        self.doc.put(Doc('employer').put(self.get_url_retry(config.api_host + '/1/xml/employer/4236/')))
        self.doc.put(Doc('employer').put(self.get_url_retry(config.api_host + '/1/xml/employer/6421/')))
        self.doc.put(Doc('employer').put(self.get_url_retry(config.api_host + '/1/xml/employer/2180/')))

