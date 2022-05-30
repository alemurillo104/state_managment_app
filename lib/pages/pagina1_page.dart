import 'package:estados/models/usuario.dart';
import 'package:estados/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pagina1Page extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
  
    final usuarioService = Provider.of<UsuarioService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
        actions: [
          IconButton(
            onPressed: () => usuarioService.removerUsuario(),
            icon: Icon(Icons.exit_to_app)
          )
        ],
      ),
      body: (usuarioService.existeUsuario) 
      ? InformacionUsuario(usuario: usuarioService.usuario)
      : Center( child: Text('No existe usuario') ),

     floatingActionButton: FloatingActionButton(
       child: Icon( Icons.accessibility_new ),
       onPressed: () => Navigator.pushNamed(context, 'pagina2')
     ),
   );
  }
}

class InformacionUsuario extends StatelessWidget {

  final Usuario usuario;

  const InformacionUsuario( { @required this.usuario } );

  @override
  Widget build(BuildContext context) {
    print(usuario.profesiones);
    print('user = ' + usuario.toString());

    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text('General', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold ) ),
          Divider(),

          ListTile( title: Text('Nombre: ${usuario.nombre}') ),
          ListTile( title: Text('Edad: ${usuario.edad}') ),

          Text('Profesiones', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold ) ),
          Divider(),

          // Expanded(
          //   child: ListView.builder(
          //     itemCount: usuario.profesiones.length,
          //     itemBuilder: (BuildContext context, int index) {
                
          //       return ListTile(
          //         title: Text(usuario.profesiones[index]),
          //       );
          //     },
          //   ),
          // ),

          ...usuario.profesiones.map((profesion) => ListTile(title: Text(profesion))  ).toList()
        ],
      ),
    );
  }

}