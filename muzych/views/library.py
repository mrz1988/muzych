import json
from muzych import app

@app.route('/artists')
def artists():
    return json.dumps([
        'Pat Metheny',
        'ZZ Top',
        'Aerosmith',
        "Guns n' Roses",
        'Clifford Brown',
        'Electric Light Orchestra',
        'John Coltrane',
        'Kansas',
        'Lee Morgan',
        'Pearl Jam',
        'Rush',
        'Yes',
        'Weezer',
        'blink-182',
        'Eminem'])
