import 'package:domain/model/contracts/contract_model.dart';
import 'package:domain/model/contracts/contract_owner_model.dart';
import 'package:domain/utils/base_result.dart';

abstract class ContractsRepository {
  Future<BaseResult<ContractModel>> contractsInfo({required num bookingId});

  Future<BaseResult<bool>> uploadContract(
      {required num bookingId, required String path});

  Future<BaseResult<ContractOwnerModel>> contractsOwner({required num bookingId});

  Future<BaseResult<bool>> uploadContractOwner({required num bookingId, required String path});
}
