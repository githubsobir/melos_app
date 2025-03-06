import 'package:domain/model/contracts/contract_model.dart';
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
}
