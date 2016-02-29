import bottle_session
import bottle
import db
import json

def read_config(confname):
    with open(confname) as json_data_file:
        data = json.load(json_data_file)
        return (data)

app = bottle.app()
plugin = bottle_session.SessionPlugin(cookie_lifetime=600)
app.install(plugin)
config = read_config("config.json")
print config
my, cursor = db.connect(config['mysql']['host'],config['mysql']['user'],config['mysql']['pass'],config['mysql']['db'])

@app.route('/', name='index')
def index(session):
    valid_session = session.get('valid')
    user_name = session.get('name')
    if valid_session:
        deals = db.get_deals(cursor)
        print deals
        return bottle.template('main', app=app, user_name=user_name, deals=deals);
    else:
        bottle.redirect("/login")

@app.route('/api/deals', method='GET')
def api_deals(session):
    return dict(data=db.get_deals(cursor))

@app.route('/login', method='GET')
def login(session):
    return bottle.template('login', app=app, user_name='login')

@app.route('/login', method='POST')
def do_login(session):
    username = bottle.request.forms.get('username')
    password = bottle.request.forms.get('password')
    session.regenerate()
    session['valid']=True
    session['name']=username
#    return bottle.template('main', app=app, user_name=username);
    bottle.redirect("/")

@app.route('/logout', name='logout')
def logout(session):
    session['valid']=False
    session['name']=None
    session.destroy()
    return bottle.template('logout', app=app, user_name='logout');

@app.route('/static/<filepath:path>')
def server_static(filepath):
    return bottle.static_file(filepath, root='./static/')

app.run(host='0.0.0.0', port=8042, debug=True, reloader=True)
