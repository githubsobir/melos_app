import 'package:domain/model/contracts/contract_owner_model.dart';
import 'package:domain/usecase/contracts_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ConfirmBookingCubit extends Cubit<ConfirmBookingState> {
  final ContractsUseCase _paymentUseCase;

  ConfirmBookingCubit(this._paymentUseCase)
      : super(const ConfirmBookingState(
          imageFile: null,
          contract: null,
          successfullySent: false,
          isButtonLoading: false,
        ));

  void uploadImage(XFile imageFile) {
    emit(state.copyWith(imageFile: imageFile));
  }

  Future<void> contractsInfo({
    required num bookingId,
  }) async {
    var response = await _paymentUseCase.contractsOwner(
      bookingId: bookingId,
    );
    if (response.success) {
      var contract = response.body;
      if (contract != null) {
        emit(state.copyWith(contract: contract));
      }
    }
  }

  Future<void> uploadContractOwner(num bookingId) async {
    emit(state.copyWith(isButtonLoading: true));
    var response = await _paymentUseCase.uploadContractOwner(
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

class ConfirmBookingState extends Equatable {
  final XFile? imageFile;
  final bool isButtonLoading;
  final bool successfullySent;
  final ContractOwnerModel? contract;

  const ConfirmBookingState({
    required this.imageFile,
    required this.contract,
    required this.successfullySent,
    required this.isButtonLoading,
  });

  ConfirmBookingState copyWith({
    XFile? imageFile,
    ContractOwnerModel? contract,
    bool? successfullySent,
    bool? isButtonLoading,
  }) {
    return ConfirmBookingState(
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
