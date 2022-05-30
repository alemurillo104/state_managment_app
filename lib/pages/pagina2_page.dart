import 'package:estados/models/usuario.dart';
import 'package:estados/services/usuario_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Pagina2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final usuarioService = Provider.of<UsuarioService>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: (usuarioService.existeUsuario) 
          ? Text('Nombre: ${usuarioService.usuario.nombre}')
          : Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            MaterialButton(
              child: Text('Establecer Usuario', style: TextStyle( color: Colors.white ) ),
              color: Colors.blue,
              onPressed: () {
                usuarioService.usuario = new Usuario( nombre: 'Alejandra', edad: 22, profesiones: List.from(['Ing. Informático', 'Flutter Developer']));
              }
            ),

            MaterialButton(
              child: Text('Cambiar Edad', style: TextStyle( color: Colors.white ) ),
              color: Colors.blue,
              onPressed: () {
                if (usuarioService.existeUsuario) {
                  usuarioService.cambiarEdad( 25 );
                }else{
                  myShowDialog(context);
                }
              }
            ),

            MaterialButton(
              child: Text('Añadir Profesion', style: TextStyle( color: Colors.white ) ),
              color: Colors.blue,
              onPressed: () {
                if (usuarioService.existeUsuario) {
                  usuarioService.agregarProfesion('Cantante');
                }else{
                  myShowDialog(context);
                }
              }
            ),

          ],
        )
     ),
   );
   
  }

  myShowDialog(BuildContext context){
  showDialog(
      context: context,
      builder: (_) =>   CupertinoAlertDialog(
        title: Column(
          children: <Widget>[
            Text("Ups! Parece que algo anda mal"),
            Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ],
        ),
        content: new Text( "No hay un usuario registrado! Intentalo nuevamente ingresando un usuario primero, gracias."),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },),
          CupertinoDialogAction(
            child: Text("CANCEL"),
            onPressed: () {
              Navigator.of(context).pop();
            },),
        ],
      ));
}
}