<table align="center">
    <thead>
        <tr>
            <td><img src="https://1.bp.blogspot.com/-3wALNMake70/XK-07VtIngI/AAAAAAABOrY/n3X_ZJV5fGEpTs8ppMQvKk_yic7BfyBYQCLcBGAs/s1600/universidad-la-salle-logo.jpg?raw=true" alt="EPIS" style="width:50%; height:auto"/></td>
            <th>
                <span style="font-weight:bold;">UNIVERSIDAD LA SALLE</span><br />
                <span style="font-weight:bold;">FACULTAD DE INGENIERÍA DE SOFTWARE</span><br />
            </th>
        </tr>
    </thead>
    <tbody>
        <tr><td colspan="3"><span style="font-weight:bold;">Formato</span>: Septimo Entregable</td></tr>
    </tbody>
</table>

<div align="center">
    <span style="font-weight:bold;">GUÍA DEL AVANCE</span><br />
</div>

<div>
    <table border="1" align="center">
        <thead>
            <tr><th colspan="3">INFORMACIÓN BÁSICA</th></tr>
        </thead>
        <tbody>
            <tr>
                <td colspan="2">
                    <table>
                        <tr><td>ASIGNATURA:</td><td>Programación para Dispositivos Moviles</td></tr>
                        <tr><td>TÍTULO DEL TRABAJO:</td><td> Tarea Evidencia 4</td></tr>
                        <tr>
                            <td>NÚMERO DEL TRABAJO:</td><td>09 - CRUD Provider</td>
                            <td>AÑO:</td><td>2025</td>
                            <td>NRO. SEMESTRE:</td><td>VI</td>
                        </tr>
                        <tr>
                            <td colspan="6">DOCENTE:
                                <ul>
                                    <li>Josue Miguel Flores Parra - jfloresp@ulasalle.edu.pe</li>
                                </ul>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">INTEGRANTE:
                                <ul>
                                    <li>Ortiz Rosas Joshua David</li>
                                </ul>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    </table>
                    <table>
                </td>
            </tr>
        </tbody>
    </table>
</div>

🔗 [Ubicacion de los archivos para la realizacion de la actividad](https://github.com/Joshua150453/crud_provider_app/tree/master/lib)
## CRUD Provider
### 1. Archivo main.dart
#### Propósito:
Este archivo es el punto de entrada de la aplicación. Aquí se configura el entorno inicial, se carga el modelo encargado de gestionar el estado y se define cuál será la primera pantalla que verá el usuario.

#### Explicación:
  - Utiliza Provider para administrar el estado global de la aplicación.
  - Se envuelve la aplicación dentro de un ChangeNotifierProvider. Esto permite que el ViewModel (UserViewModel) esté disponible en todo el árbol de widgets.
  - Define el widget raíz MyApp, el cual configura el tema de la aplicación y establece que la pantalla inicial será la lista de usuarios.

#### Rol en el proyecto:
  - Hacer accesible el ViewModel desde cualquier pantalla.
  - Cargar la interfaz principal.
  - Ejecutar la app.

🔗 [main_dart](https://github.com/Joshua150453/crud_provider_app/blob/master/lib/main.dart)

### 2. Archivo user_view_model.dart
#### Propósito:
Gestionar los datos del sistema: almacenar, modificar y eliminar usuarios.
Este archivo contiene la lógica de negocio del proyecto.
#### Explicación:
  - Mantiene una lista privada de usuarios que solo puede ser modificada por métodos internos.
  - Expone una lista pública de usuarios para que las pantallas puedan mostrarlos.
  - Añade un getter adicional que devuelve únicamente los usuarios activos.
  - Implementa métodos para:
     - Agregar usuario
     - Editar usuario
     - Eliminar usuario
  - Cada modificación ejecuta notifyListeners(), lo que obliga a las vistas a actualizarse automáticamente.

#### Rol en el proyecto:
  - Es el centro de administración del estado.
  - Separa la lógica del UI (buenas prácticas de arquitectura).
  - Permite que la aplicación funcione dinámicamente sin recargar pantallas.

🔗 [user_view_model.dart](https://github.com/Joshua150453/crud_provider_app/blob/master/lib/viewmodels/user_view_model.dart)

### 3. Archivo user_list_screen.dart
#### Propósito:
Mostrar la lista de usuarios en pantalla, permitir filtrarlos por usuarios activos, editar y eliminar registros.
#### Explicación:
  - Obtiene el ViewModel usando context.watch(), lo que hace que la vista se actualice cada vez que cambia la lista.
  - Permite filtrar usuarios mediante un switch que activa el modo "solo usuarios activos".
  - Utiliza una lista dinámica que permite:
     - Mostrar los datos del usuario (nombre, edad, género, correo y estado).
     - Editar un usuario abriendo el formulario con información precargada.
     - Eliminar directamente un usuario mediante un botón.
  - Incluye un FloatingActionButton para añadir nuevos usuarios.

#### Rol en el proyecto:
  - Es la pantalla principal del sistema.
  - Permite administrar usuarios fácilmente desde una interfaz clara.
  - Conecta la lógica del modelo con una presentación visual.

🔗 [user_list_screen.dart](https://github.com/Joshua150453/crud_provider_app/blob/master/lib/views/user_list_screen.dart)

### 4. Archivo user_form_screen.dart
#### Propósito:
Crear o editar un usuario mediante un formulario validado.
#### Explicación:
  - Puede funcionar en dos modos:
     - Agregar usuario → formulario vacío.
     - Editar usuario → formulario lleno con datos existentes.
  - Realiza validaciones como:
     - Nombre obligatorio
     - Edad mayor a cero
     - Correo con formato válido
  - Permite seleccionar género mediante botones tipo radio.
  - Permite activar o desactivar al usuario con un interruptor.
  - Al guardar, retorna un objeto User a la pantalla anterior mediante Navigator.pop().

#### Rol en el proyecto:
  - Centraliza la creación y edición de usuarios.
  - Mantiene la integridad de los datos asegurando validaciones.
  - Mejora la interacción al permitir modificar información fácilmente.

🔗 [user_form_screen.dart](https://github.com/Joshua150453/crud_provider_app/blob/master/lib/views/user_form_screen.dart)

### 5. user.dart
#### Propósito:
El archivo user.dart define la clase User, que es el modelo de datos del proyecto.
Este modelo representa a cada usuario que se agregará, editará o mostrará en la aplicación.
#### Explicación:
  - Se usa para crear nuevos usuarios desde el formulario.
  - Se usa para editar usuarios existentes cargando su información en la pantalla.
  - Se usa para mostrar la lista de usuarios, ya que cada elemento de la lista es un objeto User.
  - El ViewModel trabaja solo con objetos User, asegurando orden y consistencia.

#### Resumen:
user.dart define la estructura de un usuario.
Es la base de datos interna en memoria, y todas las pantallas trabajan con esta clase.

🔗 [user.dart](https://github.com/Joshua150453/crud_provider_app/blob/master/lib/models/user.dart)
