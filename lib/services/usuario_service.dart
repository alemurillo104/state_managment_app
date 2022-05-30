

import 'package:flutter/material.dart';

import 'package:estados/models/usuario.dart';


class UsuarioService with ChangeNotifier{


  Usuario _usuario;


  Usuario get usuario => this._usuario;
  bool get existeUsuario => ( this._usuario != null );


  set usuario(Usuario user){
    this._usuario = user;
    notifyListeners();
  }

  void cambiarEdad(int edad){
    this._usuario.edad = edad;
    notifyListeners();
  }

  void removerUsuario(){
    this._usuario = null;
    notifyListeners();
  }

  void agregarProfesion(String profesion){
    this._usuario.profesiones.add(profesion);
    notifyListeners();
  }

}