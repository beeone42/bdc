import bottle_session
import bottle
import db
import json
from utils import *

def r_deal(app, config, db, cursor):
    @app.route('/deals', name='deals')
    def deals(session):
        user_name = check_session(app, session)
        return bottle.template('deals', app=app, user_name=user_name, config=config, did='');

    @app.route('/deals/<did:int>', name='deal')
    def deal(did, session):
        user_name = check_session(app, session)
        return bottle.template('deals', app=app, user_name=user_name, deals=deals, config=config, did=did);

    @app.route('/deal/<did:int>', name='deal')
    def deal(did, session):
        user_name = check_session(app, session)
        assert isinstance(did, int)
        deals = db.get_deals(cursor, did)
        devis = db.get_devis(cursor, did)
        users = db.get_users(cursor)
        deal_states = db.get_deal_states(cursor)
        sites = db.get_sites(cursor)
        print deals
        print devis
        print users
        print deal_states
        print sites
        return bottle.template('deal', app=app, user_name=user_name, deal=deals[0], devis=devis, users=users, config=config, did=did, deal_states=deal_states, sites=sites);
