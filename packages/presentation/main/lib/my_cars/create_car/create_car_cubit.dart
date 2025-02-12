import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class CreateCarCubit extends Cubit<CreateCarState> {
  CreateCarCubit() : super(CreateCarInitial());
  int position = 0;
  changePosition(int position) {
    this.position = position;
    emit(PagerState(position));
  }
}

@immutable
sealed class CreateCarState extends Equatable {
  const CreateCarState();
}

final class CreateCarInitial extends CreateCarState {
  @override
  List<Object?> get props => [];
}

final class PagerState extends CreateCarState {
  final int position;

  const PagerState(this.position);

  @override
  List<Object> get props => [position];
}
