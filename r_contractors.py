import bottle_session
import bottle
import db
import json
from utils import *

def r_contractors(app, config, db, my, cursor):
    @app.route('/contractors', name='contractors')
    def contractors(session):
        user_name = check_session(app, session)
        return bottle.template('contractors', app=app, user_name=user_name, config=config);

    @app.route('/contractor/<cid:int>', name='contractor')
    def contractor(cid, session):
        user_name = check_session(app, session)
        assert isinstance(cid, int)
        c = { 'enterprise': '', \
              'contact_name':'', \
              'contact_tel':'', \
              'contact_mail':'' }
        if (cid > 0):
            contractors = db.get_contractors(cursor, cid)
            print (contractors)
            c = contractors[0]
        return bottle.template('contractor', app=app, user_name=user_name, config=config, contractor=c, cid=cid);
