import 'package:bloc/bloc.dart';
import 'package:domain/model/contracts/contract_model.dart';
import 'package:domain/usecase/contracts_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class ReceivingTheCarCubit extends Cubit<ReceivingTheCarState> {
  final ContractsUseCase _paymentUseCase;

  ReceivingTheCarCubit(this._paymentUseCase)
      : super(ReceivingTheCarState(
          imageFile: null,
          contract: ContractModel(),
          successfullySent: false,
          isButtonLoading: false,
        ));

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

  Future<void> uploadContract(num bookingId) async {
    emit(state.copyWith(isButtonLoading: true));
    var response = await _paymentUseCase.uploadContract(
      bookingId: bookingId,
      file: state.imageFile?.path ?? "",
    );
    if (response.success) {
      var contract = response.body;
      if (contract != null) {
        emit(
            state.copyWith(successfullySent: contract, isButtonLoading: false));
      } else {
        emit(state.copyWith(isButtonLoading: false));
      }
    } else {
      emit(state.copyWith(isButtonLoading: false));
    }
  }
}

class ReceivingTheCarState extends Equatable {
  final XFile? imageFile;
  final bool isButtonLoading;
  final bool successfullySent;
  final ContractModel contract;

  const ReceivingTheCarState({
    required this.imageFile,
    required this.contract,
    required this.successfullySent,
    required this.isButtonLoading,
  });

  ReceivingTheCarState copyWith({
    XFile? imageFile,
    ContractModel? contract,
    bool? successfullySent,
    bool? isButtonLoading,
  }) {
    return ReceivingTheCarState(
      imageFile: imageFile ?? this.imageFile,
      contract: contract ?? this.contract,
      successfullySent: successfullySent ?? this.successfullySent,
      isButtonLoading: isButtonLoading ?? this.isButtonLoading,
    );
  }

  @override
  List<Object?> get props => [
        imageFile,
        isButtonLoading,
        successfullySent,
        contract,
      ];
}
