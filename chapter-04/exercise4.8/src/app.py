import os
from flask import Flask, request

app = Flask(__name__)

# Feature Flag: Dark Mode
DARK_MODE_ENABLED = os.environ.get('DARK_MODE_ENABLED', 'false').lower() == 'true'

def get_theme(user_preference):
    if DARK_MODE_ENABLED and user_preference == 'dark':
        return 'dark-theme.css'
    return 'light-theme.css'

@app.route('/')
def index():
    user_pref = request.args.get('theme', 'light')
    theme = get_theme(user_pref)
    return f"""
    <h1>Guestbook</h1>
    <p>Current theme: {theme}</p>
    <p>Dark Mode Feature Flag: {DARK_MODE_ENABLED}</p>
    <p><a href="/?theme=dark">Try Dark Mode</a></p>
    """

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
