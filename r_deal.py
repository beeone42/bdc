import bottle_session
import bottle
import db
import json
from utils import *

def r_deal(app, config, db, my, cursor):
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
        users = db.get_users(cursor)
        deal_states = db.get_deal_states(cursor)
        sites = db.get_sites(cursor)
        print (users, deal_states, sites)
        d = { 'description': '', 'bdcid':db.find_next_bdcid(cursor, sites[0]['id']), \
              'site_name': sites[0]['name'], 'site_pic':sites[0]['pic'], 'site_id':sites[0]['id'], \
              'creator_id':users[0]['id'], 'creator_name':users[0]['fullname'], \
              'validator_id':users[0]['id'], 'validator_name':users[0]['fullname'], \
              'state':deal_states[0] }
        devis = 0
        if (did > 0):
            deals = db.get_deals(cursor, did)
            devis = db.get_devis(cursor, did)
            print (deals, devis)
            d = deals[0]
        return bottle.template('deal', app=app, user_name=user_name, deal=d, devis=devis, users=users, config=config, did=did, deal_states=deal_states, sites=sites);
