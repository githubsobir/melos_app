import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCarsCubit extends Cubit<MyCarsState> {
  MyCarsCubit() : super(const MyCarsState([]));

  getMyCars() {
    List<String> cars = ["", "", "", "", "", "", ""];
    emit(MyCarsState(cars));
  }
}

class MyCarsState extends Equatable {
  final List<String> cars;

  const MyCarsState(this.cars);

  @override
  List<Object> get props => [cars];
}
