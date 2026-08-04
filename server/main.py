from flask import Flask,jsonify
import sqlite3

app = Flask(__name__)
db = sqlite3.connect("database.db",check_same_thread=False)
pointer = db.cursor()

@app.route("/<starting_date>/<end_date>")
def search_all(starting_date,end_date):
    statment="""    
    SELECT Name,ClosePrice,SUM(Volume) AS TotalDailyVolume
    FROM TranscationtHistory
    WHERE DatePrice = '?' AND '?'
    GROUP BY Name, DatePrice;
    """
    pointer.execute(statment,(starting_date,end_date))
    result=pointer.fetchall()
    return jsonify(result)

@app.route("/<name>/<starting_date>/<end_date>")
def search_name(name,starting_date,end_date):
    statment="""
       SELECT Sum(Volume) 
       FROM TranscationtHistory
       WHERE Name = '?'
       AND DatePrice BETWEEN '?' AND '?';
    """
    pointer.execute(statment,(name,starting_date,end_date))
    result=pointer.fetchall()
    return jsonify(result)

@app.route("/total_transcation")
def total_transcation():
    statment="""
        SELECT SUM(Volume * ClosePrice)
        FROM TranscationtHistory
    """
    pointer.execute(statment)
    result=pointer.fetchone()
    return jsonify(result)

@app.route("/total_transcation/<starting_date>/<ending_date>")
def total_transcation_between_date(starting_date,ending_date):
    statment="""      
        SELECT SUM(Volume * ClosePrice)
        FROM TranscationtHistory
        WHERE DatePrice BETWEEN '?' AND '?';
    """
    pointer.execute(statment,(starting_date,ending_date))
    result=pointer.fetchone()
    return jsonify(result)

if __name__=="__main__":
    app.run(debug=True)
