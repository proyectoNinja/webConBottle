# -*- coding: utf-8 -*-

from bottle import run, get, request, response, route, post,template
import urllib2, urllib
import hashlib
import os
import json
import time

CLIENT_ID     = "1022856304800-ph8iuqc3rra0s7iac6ln81m083dcuvdv.apps.googleusercontent.com"
CLIENT_SECRET = "P1juZRvd3EkQUz-hX9nkAJa6"
REDIRECT_URI  = "http://mifulo.dacya.ucm.es/token"
DISCOVERY_DOC = "https://accounts.google.com/.well-known/openid-configuration"
TOKEN_VALIDATION_ENDPOINT = "https://www.googleapis.com/oauth2/v4/token"

@post('/uploader')
def uploader():
    email = request.forms.get('email')
    print email
    upload = request.files.get('uploadedfile')
    dirName="../archivos"+email+"/"+str(time.time())
    if not os.path.exists(dirName):
        os.makedirs(dirName)
    upload.save(dirName+upload.filename)
    return template('file_uploaded.tpl',user=email,filename=upload.filename)

@route('/')
def login_google():
    state = hashlib.sha256(os.urandom(1024)).hexdigest()
    response.set_cookie('state', state)
    p = "https://accounts.google.com/o/oauth2/v2/auth?client_id="+CLIENT_ID+"&response_type=code&scope=openid%20email&redirect_uri="+REDIRECT_URI+"&state="+state
    return template('google_login.tpl',enlace=p)

@get('/token')
def token():
    if request.cookies.get('state') == request.params.get('state'):
        code = request.params.get('code')
        params = {"code":code,"client_id":CLIENT_ID,"client_secret":CLIENT_SECRET,"grant_type":"authorization_code","redirect_uri":REDIRECT_URI}
        params = urllib.urlencode(params)
        m = urllib2.urlopen(TOKEN_VALIDATION_ENDPOINT, params)
        m = json.loads(m.read())
        p = urllib2.urlopen("https://www.googleapis.com/oauth2/v3/tokeninfo?id_token="+m['id_token'])
        p = json.loads(p.read())
	return template('uploader.tpl',user=p['email'])
    else:
        return template('error_login.tpl')

if __name__ == "__main__":
    run(host='147.96.80.194',port=80,debug=False)
