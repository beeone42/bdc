import bottle_session
import bottle
import db
import json
from utils import *

def r_devis(app, config, db, my, cursor):

    @app.route('/devis/<did:int>/<deid:int>', name='devis')
    def devis(did, deid, session):
        user_name = check_session(app, session)
        assert isinstance(did, int)
        deal = db.get_deals(cursor, did)
        devis_states = db.get_devis_states(cursor)
        contractors = db.get_contractors(cursor)
        devis = {
            'description': deal[0]['description'],
            'contractor_id': 0, \
            'issuer': '', \
            'contact_name': '', \
            'amount':'', \
            'currency': deal[0]['currency'], \
            'd_received':'', \
            'state':'' }
        if (deid > 0):
            d = db.get_devis(cursor, did, deid)
            if (len(d) > 0):
                devis = d[0]
                print (devis)
        docs = db.get_docs(cursor, 0, did, deid)
        print (docs)
        return bottle.template('devis', app=app, user_name=user_name, config=config, devis_states=devis_states, devis=devis, contractors=contractors, did=did, deid=deid, docs=docs);
