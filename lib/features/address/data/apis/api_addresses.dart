import 'package:dio/dio.dart';
import 'package:ecommerce/core/networking/api_constants.dart';
import 'package:ecommerce/features/address/data/apis/api_address_const.dart';
import 'package:ecommerce/features/address/data/models/address_model.dart';
import 'package:ecommerce/features/address/data/models/address_request_model.dart';
import 'package:ecommerce/features/address/data/models/get_address_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_addresses.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class AddressWebServices {
  factory AddressWebServices(Dio dio, {String? baseUrl}) = _AddressWebServices;

  @POST(AddressConst.addressEndPoint)
  Future<AddressModel> setNewAddress(
      @Body() AddressRequestModel addressRequestModel);

  @GET(AddressConst.addressEndPoint)
  Future<GetAddressModel> getAllAddresses();

  @PUT("${AddressConst.addressEndPoint}/{addressId}")
  Future<AddressModel> updateAddress(@Path("addressId") int addressId,
      @Body() AddressRequestModel addressRequestModel);

  @DELETE("${AddressConst.addressEndPoint}/{addressId}")
  Future<void> deleteAddress(@Path("addressId") int id);
}
