import bottle_session
import bottle
import db
import json, os
from utils import *

def r_docs(app, config, db, my, cursor):

    @app.route('/docs/<did:int>/<deid:int>/0', method='GET', name='new_doc')
    def new_doc(did, deid, session):
        user_name = check_session(app, session)
        assert isinstance(did, int)
        deal = db.get_deals(cursor, did)
        d = db.get_devis(cursor, deid)
        devis = d[0]
        docs_types = db.get_docs_types(cursor)
        print (devis)
        return bottle.template('new_doc', app=app, user_name=user_name, config=config, devis=devis, docs_types=docs_types, did=did, deid=deid)

    @app.route('/docs/<did:int>/<deid:int>/0', method='POST', name='new_doc_post')
    def new_doc_post(did, deid, session):
        doc_type   = bottle.request.forms.get('doc_type')
        upload     = bottle.request.files.get('upload')
        name, ext  = os.path.splitext(upload.filename)
        if ext not in ('.pdf', '.png','.jpg','.jpeg'):
            return 'File extension not allowed.'
        save_path = doc_path(did, deid)
        if not os.path.exists(save_path):
            os.makedirs(save_path)
        try:
            upload.save(save_path)
        except IOError as ioe:
            print(ioe)
            return (str(save_path) + str(upload.filename) + ': ' + str(ioe))
        db.insert_doc(my, cursor, did, deid, upload.filename, doc_type)    
        bottle.redirect("/devis/%s/%s" % (did, deid))

    def doc_path(did, deid):
        return ("static/docs/%s/%s/" % (did, deid))
