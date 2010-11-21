#coding:utf8
import os

api_host = 'http://api.hh.ru'

XSL_root = os.path.normpath(os.path.join(os.path.dirname(__file__), "../xsl"))
XML_root = os.path.normpath(os.path.join(os.path.dirname(__file__), "../xml"))
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
        {'name': 'director', 'text': u'Управление', 'query': {'text': u'Директор OR Начальник OR Руководитель', 'items': '5', 'order':'0', 'region':'1', 'field':'17', 'salary':'150000', 'onlysalary':'true'}},
        {'name': 'b2b', 'text': u'Услуги для бизнеса', 'query': {'text': u'(NOT (Директор OR Начальник OR Руководитель)) AND (по продажам OR sales) AND ("продажа услуг" OR "продажа рекламы" OR b2b)', 'items': '5', 'order':'0', 'region':'1', 'field':'17', 'salary':'70000', 'onlysalary':'true'}},
        {'name': 'fmcg', 'text': u'FMCG', 'query': {'text': u'(NOT (Директор OR Начальник OR Руководитель)) AND (по продажам OR sales) AND (FMCG OR "товары народного потребления")', 'items': '5', 'order':'0', 'region':'1', 'field':'17', 'salary':'70000', 'onlysalary':'true'}},
        {'name': 'gsm', 'text': u'Нефть, бензин ...', 'query': {'text': u'(NOT (Директор OR Начальник OR Руководитель)) AND (по продажам OR sales) AND (нефть OR Металлопрокат OR Станки OR "промышленное оборудование" OR "производственное оборудование" OR "вентиляционное оборудование" OR "автомобильные масла" OR "строительные материалы" OR "металлоконструкции" OR "сварочные" OR "продажа ГСМ" OR "производство ГСМ")', 'items': '5', 'order':'0', 'region':'1', 'field':'17', 'salary':'70000', 'onlysalary':'true'}},
        {'name': 'trade', 'text': u'Торговые представители', 'query': {'text': u'(NOT (Директор OR руководство OR супервайзер OR Управляющий OR Начальник OR Руководитель)) AND (Торговый представитель)', 'items': '5', 'order':'0', 'region':'1', 'field':'17', 'salary':'60000', 'onlysalary':'true'}},
        {'name': 'cunsalt', 'text': u'Консультанты', 'query': {'text': u'Продавец консультант', 'items': '5', 'order':'0', 'region':'1', 'field':'17', 'salary':'35000', 'onlysalary':'true'}}
      ],
      'field':'17',
      'employers':['2381', '49', '27812', '84297', '143372', '14894', '3592', '2528', '13520', '533', '556716', '129770']
    },
    'med.hh.ru': {
      'h4': u'Работа для врачей в Москве',
      'h1': u'Работа для врачей',
      'h2': u'Вакансии врачей',
      'h3': u'Вакансии медсестер',
      'queries':[
        {'name': 'doctor', 'text': u'Врачи', 'query': {'text': u'NOT Представитель', 'items': '5', 'order':'0', 'region':'1', 'field':'13', 'specialization':['131']}},
        {'name': 'scrubs', 'text': u'Младший и средний медперсонал', 'query': {'text': u'NOT Представитель', 'items': '5', 'order':'0', 'region':'1', 'field':'13', 'specialization':['155']}},
        {'name': 'veterinary', 'text': u'Ветеринария', 'query': {'text': u'', 'items': '5', 'order':'0', 'region':'1', 'field':'13', 'specialization':['49']}},
        {'name': 'manufacture', 'text': u'Производство', 'query': {'text': u'NOT (Представитель OR Продажи)', 'items': '5', 'order':'0', 'region':'1', 'field':'13', 'specialization':['432']}},
        {'name': 'provizor', 'text': u'Провизоры, Фармацевты', 'query': {'text': u'(Провизор OR Фармацевт) NOT (Представитель)', 'items': '5', 'order':'0', 'region':'1', 'field':'13', 'specialization':['220']}},
        {'name': 'sales', 'text': u'Продажи', 'query': {'text': u'', 'items': '5', 'order':'0', 'region':'1', 'field':'13', 'specialization':['227']}}
      ],
      'field':'13',
      'employers':['24', '45333', '13819', '346', '6860', '1982', '4793', '1180', '4943', '81892', '132656', '5786', '106571']
    },
    'neftegaz.hh.ru': {
      'h4': u'Работа в нефтегазовой промышленности',
      'h1': u'Работа в нефтяной промышленности',
      'h2': u'Работа в энергетике',
      'h3': u'Работа в металлургии',
      'queries':[
        {'name': 'neftepererabotka', 'text': u'Нефтепереработка', 'query': {'text': u'', 'items': '5', 'order':'0', 'region':'113', 'field':'18', 'specialization':['190']}},
        {'name': 'electro', 'text': u'Электроэнергетика', 'query': {'text': u'NOT Представитель', 'items': '5', 'order':'0', 'region':'113', 'field':'18', 'specialization':['360', '361']}},
        {'name': 'neftandgas', 'text': u'Добыча нефти и газа', 'query': {'text': u'', 'items': '5', 'order':'0', 'region':'113', 'field':'10', 'specialization':['472', '191']}},
        {'name': 'syrie-spy', 'text': u'Добыча сырья – геологоразведка', 'query': {'text': u'', 'items': '5', 'order':'0', 'region':'113', 'field':'10', 'specialization':['54']}},
        {'name': 'syrie-manage', 'text': u'Добыча сырья – управление', 'query': {'text': u'', 'items': '5', 'order':'0', 'region':'113', 'field':'10', 'specialization':['323']}},
        {'name': 'syrie-boss', 'text': u'Добыча сырья  - высший менеджмент', 'query': {'text': u'', 'items': '5', 'order':'0', 'region':'113', 'field':'9', 'specialization':['67']}}
      ],
      'field':'18',
      'employers':['39305', '21672', '2676', '3809', '2791', '72525', '6025', '53011', '19570', '1808', '1671', '14868', '6041']
    },
    'stroi.hh.ru': {
      'h4': u'Работа для строителей',
      'h1': u'Работа для строителей',
      'h2': u'Вакансии строителей',
      'h3': u'Вакансии архитекторов',
      'queries':[
        {'name': 'prorab', 'text': u'Прораб, Начальник участка', 'query': {'text': u'прораб OR Начальник участка', 'items': '5', 'order':'0', 'field':'20', 'specialization':['387']}},
        {'name': 'architecture', 'text': u'Проектирование, Архитектура', 'query': {'text': u'Инженер OR Архитектор', 'items': '5', 'order':'0', 'field':'20', 'specialization':['233']}},
        {'name': 'water', 'text': u'Системы отопления, кондиционирования, водоснабжения и канализации', 'query': {'text': u'', 'items': '5', 'order':'0', 'field':'20', 'specialization':['528', '527']}},
        {'name': 'build', 'text': u'Строительство / Недвижимость. Управление.', 'query': {'text': u'', 'items': '5', 'order':'0', 'field':'9', 'specialization':['289']}},
        {'name': 'work', 'text': u'Рабочие строительных специальностей', 'query': {'text': u'NOT (Начальник OR администратор OR директор OR руководитель OR прораб OR АХО OR продаж OR риелтор)', 'items': '5', 'order':'0', 'field':'20', 'specialization':['490']}},
        {'name': 'sales', 'text': u'Продажи недвижимости', 'query': {'text': u'продаж', 'items': '5', 'order':'0', 'field':'20', 'specialization':['70', '189']}}
      ],
      'field':'20',
      'employers':['5306', '6563', '45223', '12550', '92010', '23330', '42453', '961', '132173', '2825', '148074', '113825', '27084', '3545', '93550']
    }

}

data['test.sales.jsx.ru'] = data['sales.hh.ru']
data['test.med.jsx.ru'] = data['med.hh.ru']
data['neftegaz.jsx.ru'] = data['neftegaz.hh.ru']
data['stroi.jsx.ru'] = data['stroi.hh.ru']
