# README

## Prueba de Desarrollador José María Luque Ortiz

__IMPORTANTE__ - Prueba desarrollada en Linux Mint 19

A tener en cuenta:

* Ruby 5.2.3

* Vuejs 2.5.2

* Mongoid 7.0.5

## Pasos a seguir tras la descarga para iniciar el proyecto:

1. Acceder a la carpeta raiz del proyecto mediante la terminal y ejecutar el comando _bundle install_ para asegurarse de que todas las gemas utilizadas sean instaladas.

2. Acceder a la carpeta __prueba-desarrollador-frontend__ y ejecutar el comando _yarn install_ para que todos los paquetes y dependencias necesarias de Vue queden instaladas.

3. Abrir una terminal e iniciar el servicio __mongodb__ para comenzar a tener acceso a la base de datos. Se realizará ejecutando el comando  _sudo service mongodb start_

4. En la misma terminal accedemos a la carpeta raíz del proyecto e insertamos el comando _ _rails s_ _ para iniciar la API

5. Abrimos otra terminal, y accedemos a la carpeta __prueba-desarrollador-frontend__ contenida en la carpeta raíz del proyecto. Insertamos el comando _yarn dev_  para iniciar el frontend

Una vez realizados estos pasos, el proyecto estará iniciado

## Acceso y uso del proyecto

1. Al ser ejecutado en local, debemos abrir un navegador y acceder mediante _localhost:8080_
2. Nos encontramos en la página de inicio de sesión. Antes de iniciar sesión, se debe registrar un usuario en la web. Accedemos mediante el enlace _Registrate_
3. Rellenamos el formulario con los datos necesarios y pulsamos el botón _Registrarse_
4. Tras registrarse, accederemos directamente a la web. Es conveniente recargar la página una vez accedemos. Encontramos que no hay ninguna sala creada, por lo que habrá que pulsar en el botón _Añadir Sala_. Una vez escrito el nombre de la sala, pulsamos el botón _Añadir Sala_ y ésta quedará creada.
5. Accedemos a la sala y comenzamos a escribir los mensajes deseados.
6. Para poder utilizar en chat como tal, será necesario abrir una ventana privada en el navegador. Será necesario crear un nuevo usuario, por lo que repetiremos los pasos 1,2 y 3.
7. Accedemos a la sala y escribimos mensajes en ambas ventanas para comprobar que funciona bien el chat.
8. Antes de abandonar la página, __importante cerrar sesión__

## Realización de tests

1. Mediante una terminal, accedemos a la carpeta raíz del proyecto, y ejecutamos _rspec_ para realizar todos los tests disponibles.
