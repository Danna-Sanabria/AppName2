from flask import Flask, jsonify
import json
import random

app = Flask(__name__)

def cargar_nombres_desde_archivo():
    with open("./resources/persons.json", "r") as archivo:
        nombres = json.load(archivo)
    return nombres

nombres = cargar_nombres_desde_archivo()

@app.route('/random_name', methods=['GET'])
def random_name():
    objeto_nombre = random.choice(nombres)
    nombre = objeto_nombre["nombre"]
    return jsonify({"person": objeto_nombre})
#fadavzv
#dsgsd
if __name__ == '__main__':
    app.run(host='0.0.0.0', port="8088", debug=True)
    
