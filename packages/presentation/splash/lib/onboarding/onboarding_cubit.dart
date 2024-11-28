import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());
  int position = 0;

  changePosition(int position) {
    this.position = position;
    emit(PagerState(position));
  }
}

sealed class OnboardingState extends Equatable {
  const OnboardingState();
}

final class OnboardingInitial extends OnboardingState {
  @override
  List<Object> get props => [];
}

final class PagerState extends OnboardingState {
  final int position;

  const PagerState(this.position);

  @override
  List<Object> get props => [position];
}
