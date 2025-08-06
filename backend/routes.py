from flask import Blueprint

api = Blueprint('api', __name__)

@api.route('/api/employees')
def get_employees():
    return {'employees': []}
