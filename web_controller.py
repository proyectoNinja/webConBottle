# -*- coding: utf-8 -*-

from bottle import run, get, request, response, route, post,template,static_file
import urllib2, urllib
import hashlib
import os
import json
import time
import sys
import shutil
sys.path.append("..")
from meanSerpentForestSRC import src

CLIENT_ID     = "1022856304800-ph8iuqc3rra0s7iac6ln81m083dcuvdv.apps.googleusercontent.com"
CLIENT_SECRET = "P1juZRvd3EkQUz-hX9nkAJa6"
REDIRECT_URI  = "http://mifulo.dacya.ucm.es/token"
DISCOVERY_DOC = "https://accounts.google.com/.well-known/openid-configuration"
TOKEN_VALIDATION_ENDPOINT = "https://www.googleapis.com/oauth2/v4/token"

@post('/uploader')
def uploader():
    email = request.forms.get('email')
    upload = request.files.get('uploadedfile')
    algo = request.forms.get('algo')
    nucleos = request.forms.get('nucleos')
    if not upload is None:
        dirName="archivos/"+email+"/"+str(time.time())
        os.makedirs("../"+dirName)
        upload.save("../"+dirName+"/csv.txt")
        clientIP=request.environ.get('REMOTE_ADDR')
        current=os.getcwd()
        os.chdir("../"+dirName)
        file=open("ip.txt","w")
        file.write(clientIP)
        file.close()
        os.chdir(current)
        try:
            src.mainWeb("/home/tfg/main/"+dirName+"/",metodo=algo,nucleos=nucleos)
            return template('view/file_uploaded.tpl',user=email.split('@')[0],filename=upload.filename,pdf="/"+dirName+"/informe.pdf")
        except Exception as ex:
            #shutil.rmtree("../"+dirName)
            file=open("error.txt","w")
            file.write(str(type(ex)))
            file.write(str(exp.args))
            file.write("/home/tfg/main/"+dirName+"/")
            file.write(algo)
            file.write(nucleos)
            path=os.getcwd()
            file.write(path)
            return template('view/uploader.tpl',user=email,msg="Posible error de formato")
    else:
        return template('view/uploader.tpl',user=email,msg="Por favor seleccione un archivo")

@route('/')
def login_google():
    state = hashlib.sha256(os.urandom(1024)).hexdigest()
    response.set_cookie('state', state)
    p = "https://accounts.google.com/o/oauth2/v2/auth?client_id="+CLIENT_ID+"&response_type=code&scope=openid%20email&redirect_uri="+REDIRECT_URI+"&state="+state
    return template('view/google_login.tpl',enlace=p)

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
	return template('view/uploader.tpl',user=p['email'],msg='')
    else:
        return template('view/error_login.tpl')

@route('/static/<filepath:path>')
def server_static(filepath):
    return static_file(filepath,root="static")

@route('/archivos/<filepath:path>')
def serve_static(filepath):
    return static_file(filepath,root='../archivos')

if __name__ == "__main__":
    run(host='147.96.80.194',port=80,debug=False)
