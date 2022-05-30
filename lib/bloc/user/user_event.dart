
//proporciona los eventos para cambiar el estado

part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class ActivateUser extends UserEvent{
  final Usuario user;
  ActivateUser(this.user);
}

class ChangeUserAge extends UserEvent{

  final int age;
  ChangeUserAge(this.age);
}

class AddUserProfession extends UserEvent{

  final String profession;
  AddUserProfession(this.profession);
}

class RemoveActivateUser extends UserEvent{}