import 'package:estados/bloc/usuario/usuario_cubit.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Pagina1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
        actions: [
          IconButton(
            onPressed: () => context.read<UsuarioCubit>().borrarUsuario() , 
            icon: Icon(Icons.exit_to_app)
          )
        ],
      ),
      body: BodyScaffold(),
      // body: InformacionUsuario(),

     floatingActionButton: FloatingActionButton(
       child: Icon( Icons.accessibility_new ),
       onPressed: () => Navigator.pushNamed(context, 'pagina2')
     ),
   );
  }
}

class BodyScaffold extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(
      builder: ( _ , state) {

       switch ( state.runtimeType ) {
         case UsuarioInitial:
          return Center(child: Text('No hay usuario registrado'));
          break;
         case UsuarioActivo:
          return InformacionUsuario((state as UsuarioActivo).usuario);
          break;

         default:
          return CircularProgressIndicator();

       }

        // if ( state is UsuarioInitial ) {
        //   return Center(child: Text('No hay usuario registrado'));
        // } else if( state is UsuarioActivo) {
        //   return InformacionUsuario(state.usuario);
        // }
        // return CircularProgressIndicator();
      },
    );
  }
}

class InformacionUsuario extends StatelessWidget {

  final Usuario usuario;

  const InformacionUsuario( this.usuario );

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

          ListTile( title: Text('Nombre: ${ usuario.nombre } ') ),
          ListTile( title: Text('Edad: ${ usuario.edad }') ),

          Text('Profesiones', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold ) ),
          Divider(),

          Expanded(
            child: ListView.builder(
              itemCount: usuario.profesiones.length,
              itemBuilder: ( _ , int index) {
                return ListTile( title: Text(usuario.profesiones[index]),) ;
              },
            ),
          ),

        ],
      ),
    );
  }

}