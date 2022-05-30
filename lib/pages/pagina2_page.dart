import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:estados/bloc/user/user_bloc.dart';

class Pagina2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final userBloc = BlocProvider.of<UserBloc>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            return (state.existUser)
            ? Text('Nombre: ${state.user?.nombre}')
            : Text('Pagina 2');
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            MaterialButton(
              child: Text('Establecer Usuario', style: TextStyle( color: Colors.white ) ),
              color: Colors.blue,
              onPressed: () {

                final newUser = new Usuario(
                  nombre: 'Alejandra', 
                  edad: 23, 
                  profesiones: ['Ing Informatico', 'Flutter Dev']
                );
                
                userBloc.add( ActivateUser(newUser) );
              }
            ),

            MaterialButton(
              child: Text('Cambiar Edad', style: TextStyle( color: Colors.white ) ),
              color: Colors.blue,
              onPressed: () {
                userBloc.add( ChangeUserAge(30) );
              }
            ),

            MaterialButton(
              child: Text('Añadir Profesion', style: TextStyle( color: Colors.white ) ),
              color: Colors.blue,
              onPressed: () {
                userBloc.add( AddUserProfession("Profesion 1") );

              }
            ),

          ],
        )
     ),
   );
  }
}