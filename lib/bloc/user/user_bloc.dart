
//conoce y procesa el estado actual del bloc
//vista logic component
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:estados/models/usuario.dart';

part 'user_event.dart';
part 'user_state.dart';


class UserBloc extends Bloc<UserEvent, UserState>{
  
  UserBloc() : super( const UserInitialState() ){
 
    on<ActivateUser>( (event, emit) { 

      print('ActivateUser called');
      emit(UserSetState(event.user));
    });

    on<ChangeUserAge>((event, emit) {
      
      if (!state.existUser) return;
      emit(UserSetState( state.user!.copyWith( edad: event.age ) ) );
    });

    on<AddUserProfession>((event, emit) {
      
      if (!state.existUser) return;
      final List<String> professions = [
        ...state.user!.profesiones,
        event.profession
      ];

      emit(UserSetState( state.user!.copyWith( profesiones:professions  ) ) );
    });

    on<RemoveActivateUser>( (event, emit ){
      
      if (!state.existUser) return;
      emit( UserRemoveState() );
      // emit( UserInitialState() );
      
    });

  }


  

}