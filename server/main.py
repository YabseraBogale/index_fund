from os import name, stat_result

from flask import Flask,url_for,jsonify
import sqlite3

app = Flask(__name__)
db = sqlite3.connect("database.db",check_same_thread=False)
pointer = db.cursor()

@app.route("/<starting_date,end_date>")
def search_all(starting_date,end_date):
    statment="""    
    SELECT Name,ClosePrice,SUM(Volume) AS TotalDailyVolume
    FROM TranscationtHistory
    WHERE DatePrice = '?' BETWEEN '?'
    GROUP BY Name, DatePrice;
    """
    pointer.execute(statment,(starting_date,end_date))
    result=pointer.fetchall()
    return jsonify(result)

@app.route("/<name>")
def search_name(name):
    statment="""
        SELECT * 
        FROM TranscationtHistory
        WHERE Name = '?'
      AND DatePrice BETWEEN '?' AND '?';
    """
    pointer.execute(statment,(name))
    result=pointer.fetchall()
    return jsonify(result)

if __name__=="__main__":
    app.run(debug=True)
