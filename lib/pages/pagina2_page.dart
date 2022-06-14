import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:estados/models/usuario.dart';

import 'package:estados/bloc/usuario/usuario_cubit.dart';

class Pagina2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final usuarioCubit = context.read<UsuarioCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            MaterialButton(
              child: Text('Establecer Usuario', style: TextStyle( color: Colors.white ) ),
              color: Colors.blue,
              onPressed: () {
                usuarioCubit.seleccionarUsuario( new Usuario(nombre: 'Alee', edad: 23, profesiones: [ 'Ing Informatico', 'Flutter Developer']) );
              }
            ),

            MaterialButton(
              child: Text('Cambiar Edad', style: TextStyle( color: Colors.white ) ),
              color: Colors.blue,
              onPressed: () {
                usuarioCubit.cambiarEdadUsuario(30);
              }
            ),

            MaterialButton(
              child: Text('Añadir Profesion', style: TextStyle( color: Colors.white ) ),
              color: Colors.blue,
              onPressed: () {
                usuarioCubit.agregarProfesion('Profesion ${usuarioCubit.getProfesionesCantidad() + 1}');
              }
            ),

          ],
        )
     ),
   );
  }
}