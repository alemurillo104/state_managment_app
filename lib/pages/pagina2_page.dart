import 'package:estados/controllers/usuario_controller.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Pagina2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final userCtrl = Get.find<UsuarioController>();

    return Scaffold(
      appBar: AppBar(
        title: Obx(
          ( ) => (userCtrl.existeUsuario.value )
          ? Text('Nombre: ${userCtrl.usuario.value.nombre}')
          : Text('Pagina 2')
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
                userCtrl.cargarUsuario(Usuario(nombre: 'Ale', edad: 23, profesiones: ['Ing flutter', 'otro ejem']));
                Get.snackbar(
                  'Usuario añadido!', 'Ale es el nombre del usuario',
                  backgroundColor: Colors.white,
                  boxShadows: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 10
                    )
                  ]
                );
              }
            ),

            MaterialButton(
              child: Text('Cambiar Edad', style: TextStyle( color: Colors.white ) ),
              color: Colors.blue,
              onPressed: () {
                userCtrl.changeUsuarioAge(25);
              }
            ),

            MaterialButton(
              child: Text('Añadir Profesion', style: TextStyle( color: Colors.white ) ),
              color: Colors.blue,
              onPressed: () {
                userCtrl.agregarProfesion('Profesion ${userCtrl.profesionesCount + 1}');

              }
            ),

            MaterialButton(
              child: Text('Cambiar Tema', style: TextStyle( color: Colors.white ) ),
              color: Colors.blue,
              onPressed: () {
                Get.changeTheme( Get.isDarkMode ? ThemeData.light() : ThemeData.dark());

              }
            ),

          ],
        )
     ),
   );
  }
}