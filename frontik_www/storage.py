import bsddb3.db
import datetime
import logging

log = logging.getLogger('storage')

def keyname(spec, date):
    return '{0}-{1}'.format(spec, date.isoformat())

class MedianSalaryStorage(object):
    def __init__(self, filename):
        self.db = bsddb3.db.DB()
        log.debug('opening %s as median storage', filename)
        self.db.open(filename, dbtype=bsddb3.db.DB_HASH, flags=bsddb3.db.DB_CREATE)

    def has_today(self, spec):
        return self.db.get(keyname(spec, datetime.date.today())) is not None

    def store_today(self, spec, salary, handler):
        today = datetime.date.today()
        handler.log.debug(str(salary))
        self.db.put(keyname(spec, today), str(salary))

    def get_today(self, spec):
        return int(self.db.get(keyname(spec, datetime.date.today())))

    def get_last_week_salaries(self, spec):
        today = datetime.date.today()
        res = []
        
        for i in range(7):
            v = self.db.get(keyname(spec, today - datetime.timedelta(days = 6 - i)))
            if v:
                res.append(int(v))
            else:
                res.append(None)
                
        return res
