import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class CreateCarCubit extends Cubit<CreateCarState> {
  CreateCarCubit() : super(CreateCarInitial());
}

@immutable
sealed class CreateCarState {}

final class CreateCarInitial extends CreateCarState {}