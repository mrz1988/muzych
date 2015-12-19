import json
from muzych import app
from flask import g

# Converters
# TODO: Move these to proper converters

def serialize_rows(rows):
    output_rows = []
    for row in rows:
        output_rows.append(compose_row(row))
    return json.dumps(output_rows)

def serialize_row(row):
    return json.dumps(compose_row(row))

def compose_row(row):
    keys = row.keys()
    obj = {}
    for i in range(len(row)):
        obj[keys[i]] = row[i]
    return obj



# Routes

@app.route('/artists')
def artists():
    with g.lib.transaction() as tx:
        rows = tx.query("SELECT DISTINCT albumartist FROM albums")
    all_artists = [row[0] for row in rows]
    return json.dumps(all_artists)

@app.route('/albums/byartist/<artistjson>')
def artist_album_ids(artistjson):
    artist = json.loads(artistjson)['artist']
    query = "SELECT id FROM albums WHERE albumartist = '%s'" % artist
    with g.lib.transaction() as tx:
        #rows = tx.query("SELECT DISTINCT albumartist FROM albums")[0][0]
        rows = tx.query(query)
    return serialize_rows(rows)

@app.route('/albums/byids/<ids>')
def albums(ids):
    ids = json.loads(ids)
    results = []
    for id in ids:
        row = g.lib.get_album(id)
        results.append(serialize_row(row))
    return json.dumps(results)