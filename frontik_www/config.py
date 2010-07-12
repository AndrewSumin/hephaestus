#coding:utf8
import os

api_host = 'http://api.hh.ru'

XSL_root = os.path.normpath(os.path.join(os.path.dirname(__file__), "../xsl"))
XML_root = os.path.normpath(os.path.join(os.path.dirname(__file__), "../xml" ))
apply_xsl = True

db_filename = os.path.join(os.path.normpath(os.path.join(os.path.dirname(__file__), "..")),
                           'median_salaries.db')

data = {
    'sales.hh.ru': {
      'h4': u'Работа для продавцов в Москве',
      'h1': u'Менеджер по продажам',
      'h2': u'Продавец-консультант',
      'h3': u'Торговый представитель',
      'queries':[
        {'name': 'director', 'text': u'Управление', 'query': {'text': u'Директор OR Начальник OR Руководитель', 'items': '5', 'order':'0',  'area':'1', 'field':'17', 'salary':'150000','onlysalary':'true'}},
        {'name': 'b2b', 'text': u'Услуги для бизнеса', 'query': {'text': u'(NOT (Директор OR Начальник OR Руководитель)) AND (по продажам OR sales) AND ("продажа услуг" OR "продажа рекламы" OR b2b)', 'items': '5', 'order':'0',  'area':'1', 'field':'17', 'salary':'70000', 'onlysalary':'true'}},
        {'name': 'fmcg', 'text': u'FMCG', 'query': {'text': u'(NOT (Директор OR Начальник OR Руководитель)) AND (по продажам OR sales) AND (FMCG OR "товары народного потребления")', 'items': '5', 'order':'0',  'area':'1', 'field':'17', 'salary':'70000', 'onlysalary':'true'}},
        {'name': 'gsm', 'text': u'Нефть, бензин ...', 'query': {'text': u'(NOT (Директор OR Начальник OR Руководитель)) AND (по продажам OR sales) AND (нефть OR Металлопрокат OR Станки OR "промышленное оборудование" OR "производственное оборудование" OR "вентиляционное оборудование" OR "автомобильные масла" OR "строительные материалы" OR "металлоконструкции" OR "сварочные" OR "продажа ГСМ" OR "производство ГСМ")', 'items': '5', 'order':'0',  'area':'1', 'field':'17', 'salary':'70000', 'onlysalary':'true'}},
        {'name': 'trade', 'text': u'Торговые представители', 'query': {'text': u'(NOT (Директор OR руководство OR супервайзер OR Управляющий OR Начальник OR Руководитель)) AND (Торговый представитель)', 'items': '5', 'order':'0',  'area':'1', 'field':'17', 'salary':'60000', 'onlysalary':'true'}},
        {'name': 'cunsalt', 'text': u'Консультанты', 'query': {'text': u'Продавец консультант', 'items': '5', 'order':'0',  'area':'1', 'field':'17', 'salary':'35000', 'onlysalary':'true'}}
      ],
      'field':'17',
      'employers':['2381', '49', '27812', '84297', '143372', '14894', '3592', '2528', '13520', '533', '556716', '129770']
    },
    'med.hh.ru': {
      'h4': u'Работа для фармацевтов в Москве',
      'h1': u'Менеджер по продажам',
      'h2': u'Продавец-консультант',
      'h3': u'Торговый представитель',
      'queries':[
        {'name': 'doctor', 'text': u'Врачи', 'query': {'text': u'NOT Представитель', 'items': '5', 'order':'0',  'area':'1', 'field':'13', 'specialization':'131'}},
        {'name': 'scrubs', 'text': u'Медперсонал', 'query': {'text': u'NOT Представитель', 'items': '5', 'order':'0',  'area':'1', 'field':'13', 'specialization':'155'}},
        {'name': 'veterinary', 'text': u'Ветеринария', 'query': {'text': u'', 'items': '5', 'order':'0',  'area':'1', 'field':'13', 'specialization':'49'}},
        {'name': 'manufacture', 'text': u'Производство', 'query': {'text': u'NOT (Представитель OR Продажи)', 'items': '5', 'order':'0',  'area':'1', 'field':'13', 'specialization':'432'}},
        {'name': 'provizor', 'text': u'Провизоры, Фармацевты', 'query': {'text': u'(Провизор OR Фармацевт) NOT (Представитель)', 'items': '5', 'order':'0',  'area':'1', 'field':'13', 'specialization':'220'}},
        {'name': 'sales', 'text': u'Продажи', 'query': {'text': u'', 'items': '5', 'order':'0',  'area':'1', 'field':'13', 'specialization':'227'}}
      ],
      'field':'13',
      'employers':['24', '45333', '13819', '346', '6860', '1982', '4793', '1180', '4943', '81892', '132656', '5786', '106571']
    }
}
