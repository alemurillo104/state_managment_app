

import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'usuario_state.dart';

class UsuarioCubit extends Cubit<UsuarioState>{
  UsuarioCubit() : super( UsuarioInitial() );

  void seleccionarUsuario ( Usuario user ){

    emit( UsuarioActivo(user) );
  }

  void cambiarEdadUsuario(int edad){

    final currentState = state;
    if ( currentState is UsuarioActivo ) {
      final newUser = currentState.usuario.copyWith(edad: 30);
      emit(UsuarioActivo(newUser));
    }
  }

  void agregarProfesion(String prof){

    final currentState = state;
    if ( currentState is UsuarioActivo ) {

      final profesiones = [
        ...currentState.usuario.profesiones,
        prof
      ];

      final newUser = currentState.usuario.copyWith(profesiones: profesiones);
      emit(UsuarioActivo(newUser));
    }
  }

  int getProfesionesCantidad(){
    if (state is UsuarioInitial) {
      return 0;
    }else{
      return (state as UsuarioActivo).usuario.profesiones.length;//creo
    }
  }

  void borrarUsuario(){
    emit(UsuarioInitial());
  }
}

