import os
import psycopg2
from flask import Flask, jsonify

app = Flask(__name__)

DB_HOST = os.environ["DB_HOST"]
DB_NAME = os.environ["DB_NAME"]
DB_USER = os.environ["DB_USER"]
DB_PASS = os.environ["DB_PASS"]

def get_conn():
    return psycopg2.connect(
        host=DB_HOST,
        dbname=DB_NAME,
        user=DB_USER,
        password=DB_PASS,
    )

@app.route("/api/hello")
def hello():
    conn = get_conn()
    cur = conn.cursor()
    cur.execute("SELECT text FROM messages LIMIT 1;")
    text = cur.fetchone()[0]
    cur.close()
    conn.close()
    return jsonify({"text": text})

@app.route("/health")
def health():
    return "ok", 200
