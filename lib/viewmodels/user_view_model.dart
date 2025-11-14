import 'package:flutter/material.dart';
import '../models/user.dart';

/// ViewModel que maneja la lógica de la lista de usuarios.
/// Extiende ChangeNotifier para notificar a la UI cuando hay cambios.
class UserViewModel extends ChangeNotifier {
  // Lista privada donde se almacenan todos los usuarios
  final List<User> _usuarios = [];

  /// Getter público para obtener la lista completa de usuarios
  List<User> get usuarios => _usuarios;

  /// Getter que retorna solo los usuarios activos
  /// (filtrando la lista original)
  List<User> get usuariosActivos =>
      _usuarios.where((u) => u.activo).toList(); // Nuevo getter

  /// Agregar un nuevo usuario a la lista
  void agregarUsuario(User usuario) {
    _usuarios.add(usuario); // Se añade el usuario
    notifyListeners(); // Notifica a la UI para refrescarse
  }

  /// Reemplazar un usuario existente en la lista
  void editarUsuario(int index, User usuario) {
    _usuarios[index] = usuario; // Se actualizan los datos
    notifyListeners(); // Notifica a la UI
  }

  /// Eliminar un usuario según su índice
  void eliminarUsuario(int index) {
    _usuarios.removeAt(index); // Se elimina el usuario
    notifyListeners(); // Notifica a la UI
  }
}
