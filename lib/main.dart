/*
 * Actividad principal (Formulario)
 * Autor: Joshua David Ortiz Rosas
 * Fecha creación: 30/10/2025
 * Última modificación: 02/11/2025
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/user_view_model.dart';
import 'views/user_list_screen.dart';

void main() {
  // Se inicia la app usando Provider para manejar el estado global
  runApp(
    ChangeNotifierProvider(
      create: (_) => UserViewModel(), // Crea el ViewModel de usuarios
      child: const MyApp(),           // Widget raíz de la aplicación
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestión de Usuarios',
      theme: ThemeData(primarySwatch: Colors.indigo), // Tema principal
      home: const UserListScreen(), // Pantalla inicial de la app
    );
  }
}
