import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class ReceivingTheCarCubit extends Cubit<ReceivingTheCarState> {
  ReceivingTheCarCubit() : super(const ReceivingTheCarState(imageFile: null));

  void uploadImage(XFile imageFile) {
    emit(state.copyWith(imageFile: imageFile));
  }
}

class ReceivingTheCarState extends Equatable {
  final XFile? imageFile;

  const ReceivingTheCarState({required this.imageFile});

  ReceivingTheCarState copyWith({
    XFile? imageFile,
  }) {
    return ReceivingTheCarState(
      imageFile: imageFile ?? this.imageFile,
    );
  }

  @override
  List<Object?> get props => [imageFile];
}
