import os
from bottle import view, route, request, app, post, get

from henet.rst.rst2html import rst2html
from henet.util import md5


@get("/preview")
def get_preview():
    return 'Loading...'


_CACHE = {}

@post("/preview")
def build_preview():
    rst = request.POST['rst']
    key = md5(rst)
    if key in _CACHE:
        return _CACHE[key]
    res = rst2html(rst, theme='acr')
    _CACHE[key] = res
    return res
