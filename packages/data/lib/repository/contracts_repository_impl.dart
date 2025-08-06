import 'dart:convert';
import 'dart:developer';

import 'package:data/models/remote/contracts/contract_owner_response.dart';
import 'package:data/models/remote/contracts/contract_response.dart';
import 'package:data/service/contracts_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/model/contracts/contract_model.dart';
import 'package:domain/model/contracts/contract_owner_model.dart';
import 'package:domain/repository/contracts_repository.dart';
import 'package:domain/utils/base_result.dart';

class ContractsRepositoryImpl extends ContractsRepository {
  final ContractsService _contractsService;

  ContractsRepositoryImpl(this._contractsService);

  @override
  Future<BaseResult<ContractModel>> contractsInfo(
      {required num bookingId}) async {
    try {
      var response =
          await _contractsService.contractsInfo(bookingId: bookingId);
      log("7777");

      return BaseResult(
        success: true,
        body: ContractResponse.fromJson(response.data).toDomainModel(),
      );
    } on DioException catch (error) {
      return BaseResult(
          success: false, exceptionBody: error.response?.data['error_note']);
    } catch (exception) {
      return BaseResult(success: false, exceptionBody: exception);
    }
  }

  @override
  Future<BaseResult<bool>> uploadContract(
      {required num bookingId, required String path}) async {
    try {
      var response = await _contractsService.uploadContract(
        bookingId: bookingId,
        path: path,
      );
      return BaseResult(
        success: response.statusCode == 201,
        body: true,
      );
    } on DioException catch (error) {
      return BaseResult(
          success: false, exceptionBody: error.response?.data['error_note']);
    } catch (exception) {
      return BaseResult(success: false, exceptionBody: exception);
    }
  }

  @override
  Future<BaseResult<ContractOwnerModel>> contractsOwner(
      {required num bookingId}) async {
    try {
      var response =
          await _contractsService.contractsOwner(bookingId: bookingId);
      return BaseResult(
        success: true,
        body: ContractOwnerResponse.fromJson(response.data).toDomainModel(),
      );
    } on DioException catch (error) {
      return BaseResult(
          success: false, exceptionBody: error.response?.data['error_note']);
    } catch (exception) {
      return BaseResult(success: false, exceptionBody: exception);
    }
  }

  @override
  Future<BaseResult<bool>> uploadContractOwner({required num bookingId, required String path}) async {
    try {
      var response = await _contractsService.uploadContractOwner(
        bookingId: bookingId,
        path: path,
      );
      return BaseResult(
        success: response.statusCode == 201,
        body: true,
      );
    } on DioException catch (error) {
      return BaseResult(
          success: false, exceptionBody: error.response?.data['error_note']);
    } catch (exception) {
      return BaseResult(success: false, exceptionBody: exception);
    }
  }
}
