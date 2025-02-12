import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditCubit extends Cubit<EditState> {
  EditCubit() : super(EditInitial());
}

sealed class EditState extends Equatable {
  const EditState();
}

final class EditInitial extends EditState {
  @override
  List<Object> get props => [];
}
