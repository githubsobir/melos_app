import 'package:domain/usecase/auth_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneNumberCubit extends Cubit<PhoneNumberState> {
  final AuthUseCase _authUseCase;

  PhoneNumberCubit(this._authUseCase) : super(LoginInitial());

}

abstract class PhoneNumberState extends Equatable {
  const PhoneNumberState();
}

class LoginInitial extends PhoneNumberState {
  @override
  List<Object> get props => [];
}

class LoaderState extends PhoneNumberState {
  @override
  List<Object> get props => [];
}

class SuccessfullyLoginState extends PhoneNumberState {
  @override
  List<Object> get props => [];
}

class LoginErrorState extends PhoneNumberState {
  @override
  List<Object> get props => [];
}

class EmptyFieldsErrorState extends PhoneNumberState {
  @override
  List<Object> get props => [];
}
