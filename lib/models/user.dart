class User {
  String nombre;
  String genero; // 'Masculino' o 'Femenino'
  int edad;
  String correo;
  bool activo;

  User({
    required this.nombre,
    required this.genero,
    required this.edad,
    required this.correo,
    required this.activo,
  });
}
