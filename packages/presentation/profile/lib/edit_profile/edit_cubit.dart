import 'package:domain/usecase/profile_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditCubit extends Cubit<EditState> {
  EditCubit(this._profileUseCase) : super(EditInitial());
  final ProfileUseCase _profileUseCase;

  Future<void> updateUser({
    required String firstName,
    required String lastName,
    required String middleName,
    required String passportPinfl,
    required String driverLicense,
    required String phoneNumber,
  }) async {
    emit(LoaderState());
    if (firstName.isNotEmpty &&
        lastName.isNotEmpty &&
        middleName.isNotEmpty &&
        passportPinfl.length == 14 &&
        driverLicense.isNotEmpty &&
        phoneNumber.isNotEmpty) {
      var response = await _profileUseCase.updateUser(
        firstName: firstName,
        lastName: lastName,
        middleName: middleName,
        passportPinfl: passportPinfl,
        driverLicense: driverLicense,
        phoneNumber: phoneNumber,
      );
      if (response.success) {
        emit(UserUpdatedState());
      } else {
        emit(UpdateErrorState(message: response.exceptionBody.toString()));
      }
    } else {
      emit(EmptyFieldsErrorState());
    }
  }
}

sealed class EditState extends Equatable {
  const EditState();
}

final class EditInitial extends EditState {
  @override
  List<Object> get props => [];
}

final class LoaderState extends EditState {
  @override
  List<Object> get props => [];
}

class UserUpdatedState extends EditState {
  @override
  List<Object> get props => [];
}

class UpdateErrorState extends EditState {
  final String message;

  const UpdateErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class EmptyFieldsErrorState extends EditState {
  @override
  List<Object> get props => [];
}
