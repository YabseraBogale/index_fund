from flask import Flask,jsonify,render_template
import sqlite3

app = Flask(__name__)
db = sqlite3.connect("database.db",check_same_thread=False)
pointer = db.cursor()

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

@app.route("/posbd/<name>/<starting_date>/ending_date")
def perctange_of_stock_between_data(name,starting_date,ending_date):
    statment="""
        SELECT 
        (SUM(CASE WHEN Name = '?' THEN Volume * ClosePrice ELSE 0 END) 
         / NULLIF(SUM(Volume * ClosePrice), 0)) * 100 AS AppPercentageShare
        FROM TranscationtHistory
        WHERE DatePrice BETWEEN '?' AND '?';
    """
    pointer.execute(statment,(name,starting_date,ending_date))
    result=pointer.fetchone()
    return jsonify(result)

@app.route("/price_proportional_distribution")
def price_proportional_distribution():
    return render_template("price_proportional_distribution.html") 

if __name__=="__main__":
    app.run(debug=True)
