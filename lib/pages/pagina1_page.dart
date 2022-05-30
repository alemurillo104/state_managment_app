import 'package:estados/controllers/usuario_controller.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Pagina1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  
    final usuarioCtrl = Get.put(UsuarioController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
        actions: [
          IconButton(
            onPressed: (){
              usuarioCtrl.removeUsuario();
            }, 
            icon: Icon(Icons.delete_outline)
          )
        ],
      ),
      body: Obx(
        () => (usuarioCtrl.existeUsuario.value)
          ? InformacionUsuario( usuarioCtrl.usuario.value )
          : NoInfo()
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.accessibility_new ),
        onPressed: () => Get.toNamed('pagina2')
      ),
   );
  }
}

class NoInfo extends StatelessWidget {
  const NoInfo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('No hay usuario seleccionado')
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  
  final Usuario usuario;
  
  InformacionUsuario( this.usuario );



  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text('General', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold ) ),
          Divider(),

          ListTile( title: Text('Nombre: ${usuario.nombre} ') ),
          ListTile( title: Text('Edad: ${usuario.edad}') ),

          Text('Profesiones', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold ) ),
          Divider(),

          Expanded(
            child: ListView.builder(
              itemCount: usuario.profesiones.length,
              itemBuilder: (_, i){
                return ListTile( title: Text(usuario.profesiones[i]));
              } )
          )

        ],
      ),
    );
  }

}