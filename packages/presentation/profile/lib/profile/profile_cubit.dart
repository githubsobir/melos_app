import 'package:domain/model/profile/user_information_model.dart';
import 'package:domain/usecase/profile_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._profileUseCase) : super(ProfileInitial());
  final ProfileUseCase _profileUseCase;

  Future<void> userInformation() async {
    emit(LoaderState());
    var response = await _profileUseCase.userInformation();
    if (response.success) {
      var info = response.body;
      if (info != null) {
        emit(UserInfoState(info));
      }
    }
  }
}

sealed class ProfileState extends Equatable {
  const ProfileState();
}

final class ProfileInitial extends ProfileState {
  @override
  List<Object> get props => [];
}

final class LoaderState extends ProfileState {
  @override
  List<Object> get props => [];
}

class UserInfoState extends ProfileState {
  final UserInformationModel info;

  const UserInfoState(this.info);

  @override
  List<Object> get props => [info];
}
