from flask import Flask, render_template, jsonify, send_from_directory
import json
import os

app = Flask(__name__)

@app.route('/')
def home(): 
    return render_template('task1.html')

@app.route('/task1')
def task1():
    return render_template('task1.html')

@app.route('/task2')
def task2():
    return render_template('task2.html')

@app.route('/task3')
def task3():
    return render_template('task3.html')

@app.route('/task4')
def task4():
    return render_template('task4.html')

@app.route('/task5')
def task5():
    return render_template('task5.html')

@app.route('/task6')
def task6():
    return render_template('task6.html')

@app.route('/task7')
def task7():
    return render_template('task7.html')

@app.route('/supermarket')
def get_supermarkets():
    with open('supermarket.geojson') as f:
        data = json.load(f)
        return jsonify(data)

if __name__ == '__main__':
    app.run(debug=True) 