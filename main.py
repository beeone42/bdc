import bottle_session
import bottle
import db
import json

def read_config(confname):
    with open(confname) as json_data_file:
        data = json.load(json_data_file)
        return (data)

app = bottle.app()
plugin = bottle_session.SessionPlugin(cookie_lifetime=3600*24*7)
app.install(plugin)
config = read_config("config.json")
print config
my, cursor = db.connect(config['mysql']['host'],config['mysql']['user'],config['mysql']['pass'],config['mysql']['db'])

def check_session(session):
    valid_session = session.get('valid')
    user_name = session.get('name')
    if valid_session:
        return user_name
    else:
        bottle.redirect(app.get_url('login'))
        
@app.route('/', name='index')
def index(session):
    user_name = check_session(session)
    deals = db.get_deals(cursor)
    print deals
    return bottle.template('main', app=app, user_name=user_name, deals=deals, config=config);

@app.route('/api/devis', method='GET', name='devis')
@app.route('/api/devis/', method='GET', name='devis')
def api_devis(session):
    devis = db.get_devis(cursor)
    print devis
    return dict(data=devis)

@app.route('/api/devis/<did:int>', method='GET')
def api_devis(did, session):
    assert isinstance(did, int)
    devis = db.get_devis(cursor, did)
    return dict(data=devis)

@app.route('/api/deals', method='GET', name='deals')
@app.route('/api/deals/', method='GET', name='deals')
def api_deals(session):
    deals = db.get_deals(cursor)
    print deals
    return dict(data=deals)

@app.route('/api/deals/<did:int>', method='GET')
def api_deals(did, session):
    assert isinstance(did, int)
    deals = db.get_deals(cursor, did)
    return dict(data=deals)

@app.route('/deals', name='deals')
def deals(session):
    user_name = check_session(session)
    return bottle.template('deals', app=app, user_name=user_name, config=config, did='');

@app.route('/deals/<did:int>', name='deal')
def deal(did, session):
    user_name = check_session(session)
    return bottle.template('deals', app=app, user_name=user_name, deals=deals, config=config, did=did);

@app.route('/deal/<did:int>', name='deal')
def deal(did, session):
    user_name = check_session(session)
    assert isinstance(did, int)
    deals = db.get_deals(cursor, did)
    print deals
    return bottle.template('deal', app=app, user_name=user_name, deal=deals[0], config=config, did=did);

@app.route('/login', method='GET', name='login')
def login(session):
    return bottle.template('login', app=app, user_name='login', config=config)

@app.route('/login', method='POST')
def do_login(session):
    username = bottle.request.forms.get('username')
    password = bottle.request.forms.get('password')
    session.regenerate()
    session['valid']=True
    session['name']=username
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
