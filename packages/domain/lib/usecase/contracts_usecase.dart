import 'package:domain/model/contracts/contract_model.dart';
import 'package:domain/model/contracts/contract_owner_model.dart';
import 'package:domain/repository/contracts_repository.dart';
import 'package:domain/utils/base_result.dart';

class ContractsUseCase {
  final ContractsRepository _contractsRepository;

  ContractsUseCase(this._contractsRepository);

  Future<BaseResult<ContractModel>> contractsInfo({
    required num bookingId,
  }) {
    return _contractsRepository.contractsInfo(
      bookingId: bookingId,
    );
  }

  Future<BaseResult<bool>> uploadContract(
      {required num bookingId, required String file}) {
    return _contractsRepository.uploadContract(
      bookingId: bookingId,
      path: file,
    );
  }

  Future<BaseResult<ContractOwnerModel>> contractsOwner({required num bookingId}) {
    return _contractsRepository.contractsOwner(
      bookingId: bookingId,
    );
  }

  Future<BaseResult<bool>>  uploadContractOwner({required num bookingId, required String file}) {
    return _contractsRepository.uploadContractOwner(
      bookingId: bookingId,
      path: file,
    );
  }
}
