

import 'package:get/get.dart';

import 'package:estados/models/usuario.dart';

class UsuarioController extends GetxController{

  var existeUsuario = false.obs; 
  Rx<Usuario> usuario = new Usuario().obs;
  // Rx<Usuario> usuario = new Usuario().obs;

  int get profesionesCount => this.usuario.value.profesiones.length;
  

  void cargarUsuario( Usuario pUsuario) {
    this.existeUsuario.value = true;
    this.usuario.value = pUsuario;
  }

  void removeUsuario( ) {
    this.existeUsuario.value = false;
    this.usuario.value = new Usuario();//idk
  }

  void changeUsuarioAge( int age ) {
    if (this.existeUsuario.value) {
      this.usuario.update((val) {
        val!.edad = age;
      });
    }
  }

  void agregarProfesion(String profesion){
    if (this.existeUsuario.value) {
      this.usuario.update((val) {
        val!.profesiones = [...val.profesiones, profesion];
      });
    }
  }


}