#coding:utf8

import tornado.web
import urllib

import frontik.handler
from frontik.doc import Doc
from frontik import etree

frontik_import('handler')

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
        
        handler.do_pagedata(self)
        
        data = self.config.data[self.request.host]
        
        self.doc.put(Doc('h1').put(data['h1']))
        self.doc.put(Doc('h2').put(data['h2']))
        self.doc.put(Doc('h3').put(data['h3']))
        self.doc.put(Doc('h4').put(data['h4']))
        
        tabs = Doc('tabs')
        self.doc.put(tabs)
        
        def put_block(id, name, query):
            block = Doc('tab')

            block.put(Doc('name').put(name))
            block.put(Doc('text').put(urllib.quote(query['text'].encode('utf-8'))))
            if 'salary' in query:
              block.put(Doc('salary').put(urllib.quote(query['salary'].encode('utf-8'))))
            if 'onlysalary' in query:
              block.put(Doc('onlysalary').put(urllib.quote(query['onlysalary'].encode('utf-8'))))
            if 'region' in query:
              block.put(Doc('region').put(urllib.quote(query['region'].encode('utf-8'))))
            if 'field' in query:
              block.put(Doc('field').put(urllib.quote(query['field'].encode('utf-8'))))
            if 'specialization' in query:
                for specialization in query['specialization']:
                    block.put(Doc('specialization').put(urllib.quote(specialization.encode('utf-8'))))
            block.put(Doc('last').put(self.get_url_retry(self.config.api_host + '/1/xml/vacancy/search/', query)))

            def put_median(m):
                median_block = Doc('median')
                median_block.put(str(m))
                block.put(median_block)
                
            def count_median_cb(xml, response):
                if xml:
                    m = count_median(xml)
                    if m:
                        #storage.store_today(id, m)
                        put_median(m)

            #if storage.has_today(id):
            #    self.log.debug('show median using cached value')
            #    put_median(storage.get_today(id))
            #else:
            query['items']='40'
            query['order']='0'
            query['onlysalary']='true'
            self.log.debug('make search request to count median')
            self.get_url_retry(self.config.api_host + '/1/xml/vacancy/search/', query, callback=count_median_cb)
            
            tabs.put(block)
        
        for query in self.config.data[self.request.host]['queries']:
          put_block(query['name'], query['text'], query['query'])
 
        for employer in self.config.data[self.request.host]['employers']:
          self.doc.put(Doc('employer').put(self.get_url_retry(self.config.api_host + '/1/xml/employer/' + employer + '/')))
