import bottle_session
import bottle

app = bottle.app()
plugin = bottle_session.SessionPlugin(cookie_lifetime=600)
app.install(plugin)

@app.route('/', name='index')
def index(session):
    valid_session = session.get('valid')
    user_name = session.get('name')
    if valid_session:
        return bottle.template('index', app=app, user_name=user_name);
    else:
        return bottle.template('login', app=app, user_name='login');

@app.route('/login', method='POST')
def login(session):
    username = bottle.request.forms.get('username')
    password = bottle.request.forms.get('password')
    session.regenerate()
    session['valid']=True
    session['name']=username
    return bottle.template('index', app=app, user_name=username);

@app.route('/logout', name='logout')
def logout(session):
    session['valid']=False
    session['name']=None
    session.destroy()
    return bottle.template('logout', app=app, user_name='logout');

@app.route('/static/<filepath:path>')
def server_static(filepath):
    return bottle.static_file(filepath, root='/var/www/bdc.42.fr/static/')

app.run(host='0.0.0.0', port=8042, debug=True, reloader=True)
