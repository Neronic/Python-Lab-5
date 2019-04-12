"""
Routes and views for the bottle application.
"""
from operator import itemgetter
from bottle import route, view, post, redirect, get, request
from datetime import datetime
from connection import connection

@route('/')
@route('/<sort_key>')
@route('/home')
@view('index')
def home(sort_key = "breweryName"):

    beer_cursor = connection.coll.find(
        {},
        {"_id":False,
        "ibu":False, "abv":False,
        "lastTappedOn":False, "breweryId":False}
        ).sort([[sort_key, 1], ['name', 1]])


    #Renders the home page
    return dict(
        year=datetime.now().year,
        beer_list = list(beer_cursor)
    )

@route('/update/<ID:int>')
@view('update')
def update_beer_info(ID):
    beer_info = connection.coll.find_one(
        {"id":ID},
        {"_id":False,"breweryName":False,
        "ibu":False,
        "abv":False, "lastTappedOn":False,
        "breweryId":False})
    return dict(
        beer = beer_info,
        year=datetime.now().year)
@post('/update')
def update_beer():
    ID = request.forms.get('txtID')
    name = request.forms.get('txtName')
    activelyBrewed = request.forms.get('selActive')
    flavors = str(request.forms.get('txtFlavors')).split(',')
    result = connection.coll.update_one(
        {"id": int(ID)},
        {"$set": {"name": name, "activelyBrewed": activelyBrewed, "flavors": flavors}})
    redirect('/')