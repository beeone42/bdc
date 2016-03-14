import mysql.connector

def connect(host, user, passwd, base):
    conn = mysql.connector.connect(host=host,user=user,password=passwd, database=base)
    cursor = conn.cursor(dictionary=True)
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
    users1.fullname AS creator_name,
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

def find_next_bdcid(cursor, prefix):
    q = """
SELECT
    deals.bdcid,
FROM deals
WHERE deals.bdcid LIKE %s
    """
    cursor.execute(q, [prefix + '%'])
    return (cursor.fetchall())
