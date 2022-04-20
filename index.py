from flask import Flask, render_template, request, redirect, url_for, flash
from flask_mysqldb import MySQL


app = Flask(__name__)
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'bell_cms'

mysql = MySQL(app)

app.secret_key = 'mysecretkey'

'''

@app.route('/')
def principal(): return "Bienvenido a mi WebSite"

@app.route('/contacto')
def contacto(): return "Esta es la pagina de Contacto"
'''

@app.route('/inicio')
def principal(): return render_template('index.html');

@app.route('/servicios')
def servicios(): return render_template('servicios.html');


@app.route('/agregar', methods=['POST'])
def agregar(): 
    if request.method == 'POST':nombre = request.form['nombre']
    apellido = request.form['apellido']
    cedula = request.form['cedula']
    telefono = request.form['telefono']
    email = request.form['email1']
    referidopor = request.form['referidopor']
    creadopor = request.form['creadopor']
    cur = mysql.connection.cursor()
    cur.execute('INSERT INTO ref_usuario (cedula_usuario, nombre_usuario, apellido_usuario, telefono_usuario, email_usuario, referidopor_usuario, creadopor_usuario ) VALUES (%s, %s, %s, %s, %s, %s, %s)',
    (cedula,nombre, apellido, telefono, email, referidopor, creadopor))
    mysql.connection.commit()
    flash('Referido Agregado Correctamente')
    #return render_template('agregado.html',mensaje='Referido Agregado Correctamente')
    return redirect(url_for('principal'))


@app.route('/mostrar')
def mostrarListado(): 
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM ref_usuario')
    data = cur.fetchall()
    #print(data)
    return render_template('mostrar.html', contactos = data);


@app.route('/lenguajes')
def mostrarLenguajes(): 
    misLenguajes = ("PHP", "Python","Java", "Csharp", "Javascript")
    return render_template('lenguajes.html', lenguajes=misLenguajes);


@app.route('/editar/<id>')
def obtener_contacto(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM ref_usuario WHERE id_usuario = {0}' .format(id))
    data = cur.fetchall()
    return render_template('editar.html', usuario=data[0])
    #return render_template('mostrar.html', contactos = data);

@app.route('/actualizar/<id>', methods=['POST'])
def actualizar_contacto(id):
    if request.method == 'POST':nombre = request.form['nombre']
    apellido = request.form['apellido']
    telefono = request.form['telefono']
    email = request.form['email1']
    cedula = request.form['cedula']
    referidopor = request.form['referidopor']
    actualizadopor = request.form['actualizadopor']
    cur = mysql.connection.cursor()
    cur.execute("""
    UPDATE ref_usuario
    SET nombre_usuario = %s,
    apellido_usuario = %s,
    cedula_usuario = %s,
    telefono_usuario = %s,
    email_usuario = %s,
    referidopor_usuario = %s,
    actualizadopor_usuario = %s
    WHERE id_usuario = %s
    """, (nombre, apellido, cedula, telefono, email, referidopor, actualizadopor, id))
    mysql.connection.commit()
    flash('Contacto Editado Correctamente')
    return redirect(url_for('mostrarListado'))


@app.route('/eliminar/<string:id>')
def eliminar_contacto(id): 
    cur = mysql.connection.cursor()
    cur.execute('DELETE FROM ref_usuario WHERE id_usuario={0}'.format(id))
    mysql.connection.commit()
    flash('Contacto Eliminado Correctamente')
    return redirect(url_for('mostrarListado'))
    #return render_template('mostrar.html')


@app.route('/agregarserv', methods=['POST'])
def agregarservicio(): 
    if request.method == 'POST':cedula = request.form['cedula']
    fecha = request.form['fecha']
    monto = request.form['monto']
    tipo = request.form['tipo']
    vez = "0"
    porcentajeher = request.form['porcentajeher']
    creadopor = request.form['creadopor']
#    print(cedula + " " + fecha + " " + monto + " " + tipo + " " + vez + " " + porcentajeher + " " + creadopor)
    cur = mysql.connection.cursor()
    #cur.execute('(INSERT INTO ref_servicio (cedula_servicio, fecha_servicio, monto_servicio, vez_servicio, porcentajeher_servicio, creadopor_servicio) VALUES (%s, %s, %s, %s, %s, %s, %s)',
    #(cedula, fecha, monto, vez, porcentajeher, creadopor))
    #mysql.connection.commit()
    cur.execute('INSERT INTO ref_servicio (cedula_servicio, fecha_servicio, monto_servicio, vez_servicio, porcentajeher_servicio, creadopor_servicio) VALUES (%s, %s, %s, %s, %s, %s)',
    (cedula,fecha,monto,vez,porcentajeher,creadopor))
    mysql.connection.commit()
    flash('Servicio Agregado Correctamente')
    #return render_template('agregado.html',mensaje='Referido Agregado Correctamente')
    return redirect(url_for('principal'))

@app.route('/agregartipos', methods=['POST'])
def agregartiposervicio(): 
    if request.method == 'POST':nombre_servicio = request.form['nombreservicio']
    cur = mysql.connection.cursor()
    cur.execute('''
    INSERT INTO ref_tipo_servicio (nombre_servicio ) 
    VALUES (%s)
    ''',
    (nombre_servicio))
    mysql.connection.commit()
    flash('Tipo de Servicio Agregado Correctamente')
    #return render_template('agregado.html',mensaje='Referido Agregado Correctamente')
    return redirect(url_for('servicios'))

@app.route('/agregardscto', methods=['POST'])
def agregardescuento(): 
    if request.method == 'POST':cedula = request.form['ceduladscto']
    porcentaje = request.form['porcentajedscto']
    monto = request.form['montopromedio']
    creadopor = request.form['creadopor']
    cur = mysql.connection.cursor()
   #'''cur.execute(INSERT INTO ref_descuento (cedula_descuento, porcentaje_descuento, monto,promedio_descuento, creadopor_descuento ) VALUES (%s, %s, %s, %s, %s, %s),(cedula, porcentaje, monto, creadopor))mysql.connection.commit()flash(Servicio Agregado Correctamente)'''
    #return render_template('agregado.html',mensaje='Referido Agregado Correctamente')
    return redirect(url_for('principal'))

#if __name__ == '__main__': app.run(debug=True, port=5017 ) 
if __name__ == '__main__': app.run(debug=False, port=5017 ) 