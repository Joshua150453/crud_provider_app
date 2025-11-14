// Modelo que representa a un usuario del sistema
class User {
  String nombre;
  String genero; // 'Masculino' o 'Femenino'
  bool activo;
  int edad; // Nueva propiedad edad
  String correo; // Nueva propiedad correo electrónico

  User({
    required this.nombre,
    required this.genero,
    required this.activo,
    required this.edad,
    required this.correo,
  });
}
