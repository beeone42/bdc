import pymysql

def connect(host, user, passwd, base):
    conn = pymysql.connect(host=host,user=user,passwd=passwd, database=base, cursorclass=pymysql.cursors.DictCursor)
    cursor = conn.cursor()
    return (conn, cursor)

def query(cursor, query):
    cursor.execute(query)

def fetchall(cursor, query):
    cursor.execute(query)
    return (cursor.fetchall())
    
def close(conn):
    conn.close()

def get_deals(cursor, id = 0):
    q = """
SELECT
    deals.id,
    deals.bdcid,
    deals.state,
    deals.description,
    deals.creator AS creator_id,
    users1.fullname AS creator_name,
    deals.validator AS validator_id,
    users2.fullname AS validator_name,
    sites.name AS site_name,
    sites.pic AS site_pic
FROM deals
LEFT JOIN users AS users1 ON users1.id = deals.creator
LEFT JOIN users AS users2 ON users2.id = deals.validator
LEFT JOIN sites ON sites.id = deals.site
    """
    if (id > 0):
        q = q + " WHERE deals.id = '" + str(id) + "'"
    return (fetchall(cursor, q))

def get_devis(cursor, did = 0, id = 0):
    q = """
SELECT
    devis.id,
    devis.deal_id,
    devis.issuer,
    devis.amount,
    DATE_FORMAT(devis.date_received, '%Y-%m-%d %H:%i') AS d_received,
    DATE_FORMAT(devis.date_proceed, '%Y-%m-%d %H:%i') AS d_proceed,
    devis.state,
    deals.bdcid,
    sites.name AS site_name,
    sites.id AS site_id
FROM devis
LEFT JOIN deals ON deals.id = devis.deal_id
LEFT JOIN sites ON sites.id = deals.site
    """
    if (did > 0):
        q = q + " WHERE devis.deal_id = '" + str(did) + "'"
        if (id > 0):
            q = q + " AND devis.id = '" + str(id) + "'"
    else:
        if (id > 0):
            q = q + " WHERE devis.id = '" + str(id) + "'"
    return (fetchall(cursor, q))

def get_users(cursor, id = 0):
    q = """
SELECT
    users.id,
    users.login,
    users.fullname
FROM users
    """
    if (id > 0):
        q = q + " WHERE users.id = '" + str(id) + "'"
    return (fetchall(cursor, q))

def get_deal_states(cursor):
    q = "SHOW COLUMNS FROM deals WHERE Field = 'state';"
    cursor.execute(q)
    tmp = cursor.fetchall()[0]['Type']
    return (tmp)


def find_next_bdcid(cursor, prefix):
    q = """
SELECT
    deals.bdcid,
FROM deals
WHERE deals.bdcid LIKE %s
    """
    cursor.execute(q, [prefix + '%'])
    return (cursor.fetchall())
