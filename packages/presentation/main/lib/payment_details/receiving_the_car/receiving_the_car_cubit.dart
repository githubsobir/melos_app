import 'package:bloc/bloc.dart';
import 'package:domain/model/contracts/contract_model.dart';
import 'package:domain/usecase/contracts_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class ReceivingTheCarCubit extends Cubit<ReceivingTheCarState> {
  final ContractsUseCase _paymentUseCase;

  ReceivingTheCarCubit(this._paymentUseCase)
      : super(ReceivingTheCarState(imageFile: null, contract: ContractModel()));

  void uploadImage(XFile imageFile) {
    emit(state.copyWith(imageFile: imageFile));
  }

  Future<void> contractsInfo({
    required num bookingId,
  }) async {
    var response = await _paymentUseCase.contractsInfo(
      bookingId: bookingId,
    );
    if (response.success) {
      var contract = response.body;
      if (contract != null) {
        emit(state.copyWith(contract: contract));
      }
    }
  }
}

class ReceivingTheCarState extends Equatable {
  final XFile? imageFile;
  final ContractModel contract;

  const ReceivingTheCarState({required this.imageFile, required this.contract});

  ReceivingTheCarState copyWith({XFile? imageFile, ContractModel? contract}) {
    return ReceivingTheCarState(
      imageFile: imageFile ?? this.imageFile,
      contract: contract ?? this.contract,
    );
  }

  @override
  List<Object?> get props => [imageFile];
}
