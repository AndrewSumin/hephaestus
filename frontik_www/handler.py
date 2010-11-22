# coding: utf-8

import frontik.doc
from frontik import etree

def do_query_dump(handler):
    request = etree.Element("request")

    for name, values in handler.request.arguments.iteritems():
        for value in values:
            try:
                param = etree.Element("param", name=name)
                param.text = value.decode('utf-8')
                request.append(param)
            except:
                continue
    
    return request


def do_cookies_dump(handler):
    cookies = etree.Element("cookies")

    for name in handler.cookies:
        try:
            param = etree.Element("param", name=name)
            param.text = handler.cookies[name].value
            cookies.append(param)
        except:
            continue
        try:
            param2 = etree.Element(name)
        except: #Если негодяи хотят имя куки вида vresp#29199f0B300709
            pass
        else:
            param2.text = handler.cookies[name].value
            cookies.append(param2)

    return cookies


def do_protocol_dump(handler):
    protocol = etree.Element("protocol")
    
    def put_param_string(name, text):
        param = etree.Element("param",  name=name)
        param.text = text
        protocol.append(param)
        
        try:
            param2 = etree.Element(name)
        except:
            pass
        else:
            param2.text = text
            protocol.append(param2)

    put_param_string("path", handler.request.path)
    put_param_string("query", handler.request.query)
    put_param_string("uri", handler.request.path + "?" + handler.request.query)
    put_param_string("originaluri", handler.request.path + "?" + handler.request.query)
    put_param_string("originalurl", "{0}://{1}{2}".format(handler.request.protocol, handler.request.host, handler.request.uri))
    put_param_string("host", handler.request.host)
    put_param_string("originalhost", handler.request.host)
    put_param_string("realpath", "") # TODO
    put_param_string("secure", "no" if handler.request.protocol == "http" else "yes")
    put_param_string("bot", "no") #TODO
    put_param_string("method", handler.request.method)
    put_param_string("remote_ip", handler.request.remote_ip)

    return protocol 


def do_pagedata(handler):
    pagedata = frontik.doc.Doc('pagedata')
    pagedata.put(handler.xml_from_file('pagedata.xml'))
    pagedata.put(do_query_dump(handler))
    pagedata.put(do_cookies_dump(handler))
    pagedata.put(do_protocol_dump(handler))
    
    
    
    handler.doc.put(pagedata)
    