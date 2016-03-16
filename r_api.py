import bottle_session
import bottle
import db
import json
from utils import *

def r_api(app, config, db, cursor):
    @app.route('/api/devis', method='GET', name='devis')
    @app.route('/api/devis/', method='GET', name='devis')
    def api_devis(session):
        check_session(app, session)
        devis = db.get_devis(cursor)
        print devis
        return dict(data=devis)

    @app.route('/api/devis/<did:int>', method='GET')
    def api_devis(did, session):
        assert isinstance(did, int)
        check_session(app, session)
        devis = db.get_devis(cursor, did)
        return dict(data=devis)

    @app.route('/api/deals', method='GET', name='deals')
    @app.route('/api/deals/', method='GET', name='deals')
    def api_deals(session):
        check_session(app, session)
        deals = db.get_deals(cursor)
        print deals
        return dict(data=deals)

    @app.route('/api/deals/<did:int>', method='GET')
    def api_deals(did, session):
        assert isinstance(did, int)
        check_session(app, session)
        deals = db.get_deals(cursor, did)
        return dict(data=deals)

