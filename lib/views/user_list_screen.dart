import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/user_view_model.dart';
import '../models/user.dart';
import 'user_form_screen.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  bool mostrarSoloActivos = false; // 🔹 Nuevo filtro

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<UserViewModel>();
    final usuarios = mostrarSoloActivos
        ? viewModel.usuariosActivos
        : viewModel.usuarios;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuarios'),
        actions: [
          Row(
            children: [
              const Text('Activos', style: TextStyle(fontSize: 16)),
              Switch(
                value: mostrarSoloActivos,
                onChanged: (valor) {
                  setState(() {
                    mostrarSoloActivos = valor;
                  });
                },
              ),
            ],
          ),
        ],
      ),
      body: usuarios.isEmpty
          ? const Center(child: Text('No hay usuarios registrados.'))
          : ListView.builder(
        itemCount: usuarios.length,
        itemBuilder: (context, index) {
          final user = usuarios[index];
          return Card(
            child: ListTile(
              title: Text(
                '${user.nombre} (${user.edad} años)',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                '${user.genero} - ${user.correo}\n${user.activo ? 'Activo' : 'Inactivo'}',
              ),
              isThreeLine: true,
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () async {
                      final actualizado = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => UserFormScreen(
                            usuario: user,
                            indice: index,
                          ),
                        ),
                      );
                      if (actualizado != null && actualizado is User) {
                        viewModel.editarUsuario(index, actualizado);
                      }
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () =>
                        viewModel.eliminarUsuario(index),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final nuevoUsuario = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const UserFormScreen()),
          );
          if (nuevoUsuario != null && nuevoUsuario is User) {
            viewModel.agregarUsuario(nuevoUsuario);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
