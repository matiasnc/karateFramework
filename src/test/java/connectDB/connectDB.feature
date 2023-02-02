Feature: Connect DB
  Background:
    # Conexion a base de datos mySQL y lectura de datos.
    * def config = {username: 'root' , password: '', url:'jdbc:mysQL://localhost:3306/nuevosregistros' , driverClassName:'com.mysql.cj.jdbc.Driver' }
    * def DBUtils = Java.type('connectDB.DbUtils')
    * def db = new DBUtils(config)

  Scenario: Leer un valor de la DB
    * def usuario = db.readRows('SELECT * FROM usuarios')
    Then print 'Datos de usuarios: ' , usuario
