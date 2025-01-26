import 'package:ecommerce/core/networking/api_error_handler.dart';
import 'package:ecommerce/core/networking/api_result.dart';
import 'package:ecommerce/features/address/data/apis/api_addresses.dart';
import 'package:ecommerce/features/address/data/models/address_model.dart';
import 'package:ecommerce/features/address/data/models/address_request_model.dart';
import 'package:ecommerce/features/address/data/models/get_address_model.dart';

class AddressRepo {
  final AddressWebServices _addressWebServices;

  AddressRepo(this._addressWebServices);

  Future<ApiResult<AddressModel>> setNewAddress(
      AddressRequestModel addressRequestModel) async {
    try {
      final response =
          await _addressWebServices.setNewAddress(addressRequestModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<GetAddressModel>> getAllAddresses() async {
    try {
      final response = await _addressWebServices.getAllAddresses();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<AddressModel>> updateAddress(
      int addressId, AddressRequestModel addressRequestModel) async {
    try {
      final response = await _addressWebServices.updateAddress(
          addressId, addressRequestModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<void>> deleteAddress(int addressId) async {
    try {
      final response = await _addressWebServices.deleteAddress(addressId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
