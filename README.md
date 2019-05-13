# README

* Versiones

    ruby '2.5.3'
    rails '5.2.3'
    git '2.20.1'
    postgreSQL 10

* Inicio

    Una vez estando en la carpeta Master del proyecto es necesario correr los siguientes comandos.
    * bundle install --- Para Instalar las gemas utilizadas en el proyecto.
    * rake db:create --- Para la creacion de la base de datos, para esto debe asegurarce que el archivo database.yml                            contenga su usuario y contraseña de postgreSQL.
    * rake db:migrate --- Para la ejecucion de las migraciones correspondiente.
    * rails c --- Para poblar la base de datos con los grupos que se encuentran mas abajo.
    * rails s --- Una vez ya asegurado que esta todo lo necesario creado, se puede correr el servidor en cual estara                     corriendo en localhost:3000

#Scaffold

rails g scaffold Atraccion nombre_atc:string descripcion_atc:text imagen_atc:string capacidad_atc:integer

# Creacion de Grupos

group = Group.new
group.id = 1
group.kind = "cliente"
group.save

supervisor = Group.new
supervisor.id = 2
supervisor.kind = "supervisor"
supervisor.save

admin = Group.new
admin.id = 3
admin.kind = "admin"
admin.save

gestor = Group.new
gestor.id = 4
gestor.kind = "gestor"
gestor.save

superu = Group.new
superu.id = 5
superu.kind = "super"
superu.save

encolado = Estado.new
encolado.id = 1
encolado.descripcion_est = "Encolado"
encolado.save

enservicio = Estado.new
enservicio.id = 2
enservicio.descripcion_est = "En Servicio"
enservicio.save

servido = Estado.new
servido.id = 3
servido.descripcion_est = "Servido"
servido.save

omitido = Estado.new
omitido.id = 4
omitido.descripcion_est = "Omitido"
omitido.save

abortado = Estado.new
abortado.id = 5
abortado.descripcion_est = "Abortado"
abortado.save


