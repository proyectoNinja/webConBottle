# -*- coding: utf-8 -*-

from bottle import run, get, request, response, route, post
import urllib2, urllib
import hashlib
import os
import json

CLIENT_ID     = "1022856304800-ph8iuqc3rra0s7iac6ln81m083dcuvdv.apps.googleusercontent.com "
CLIENT_SECRET = "jZ6AMAO7TltKpSUZmXDWxgd6"
REDIRECT_URI  = "http://147.96.80.194:8080/token"
DISCOVERY_DOC = "https://accounts.google.com/.well-known/openid-configuration"
TOKEN_VALIDATION_ENDPOINT = "https://www.googleapis.com/oauth2/v4/token"



STATE =""
@post('/uploader')
def uploader():
    email = request.forms.get('email')
    print email
    upload = request.files.get('uploadedfile')
    upload.save("../archivos/"+upload.filename)
    return "<b>"+"OK"+" </b>"

@route('/')
def login_google():
    state = hashlib.sha256(os.urandom(1024)).hexdigest()
    response.set_cookie('state', state)
    p = "https://accounts.google.com/o/oauth2/v2/auth?client_id="+CLIENT_ID+"&response_type=code&scope=openid%20email&redirect_uri="+REDIRECT_URI+"&state="+state
    return "<CENTER><a href="+ p +" ><button>Pulse aquí para autenticar con google </button></a></CENTER>"

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
        return "<b>Bienvenido "+p['email']+'''</b>
                <form enctype="multipart/form-data" action="uploader " method="POST">
                    <input name="uploadedfile" type="file" />
                    <input type="hidden" name ="email" type="text" value='''+p['email']+'''>
                    <input type="submit" value="Subir archivo" />
                </form> '''
#quitar HTML con template
    else:
        return "<b>ERROR</b>"

if __name__ == "__main__":
    # NO MODIFICAR LOS PARÁMETROS DE run()
    run(host='147.96.80.194',port=8080,debug=False)
