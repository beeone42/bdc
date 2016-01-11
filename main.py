from bottle import Bottle, route, run, template, static_file

@route('/')
def hello():
    return template('index');

@route('/static/<filepath:path>')
def server_static(filepath):
    return static_file(filepath, root='/var/www/bdc.42.fr/static/')

run(host='0.0.0.0', port=8042, debug=True, reloader=True)
