import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/features/address/data/models/address_model.dart';
import 'package:ecommerce/features/address/data/models/address_request_model.dart';
import 'package:ecommerce/features/address/data/models/get_address_model.dart';
import 'package:ecommerce/features/address/data/repo/address_repo.dart';
import 'package:ecommerce/features/address/logic/address_cubit/address_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit(this._addressRepo) : super(AddressInitial());

  // static AddressCubit get(context) => BlocProvider.of(context);
  final AddressRepo _addressRepo;

  TextEditingController nameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController regionController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController latitudeController = TextEditingController();
  TextEditingController longitudeController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  AddressModel? addressModel;
  GetAddressModel? getAddressModel;

  void setNewAddress(context) async {
    emit(AddressLoadingState());
    final result = await _addressRepo.setNewAddress(AddressRequestModel(
        name: nameController.text,
        city: cityController.text,
        region: regionController.text,
        details: detailsController.text,
        latitude: 30.0616863,
        longitude: 31.3260088,
        notes: notesController.text));
    result.when(success: (response) {
      Navigator.of(context, rootNavigator: true)
          .pushReplacementNamed(Routes.allAddressesScreen);
      emit(AddressSuccessState());
    }, failure: (error) {
      emit(AddressFailureState(error));
    });
  }

  void getAllAddresses() async {
    emit(AddressLoadingState());
    final result = await _addressRepo.getAllAddresses();
    result.when(success: (response) {
      getAddressModel = response;
      emit(AddressSuccessState());
    }, failure: (error) {
      emit(AddressFailureState(error));
    });
  }

  void updateAddress(context, int addressId) async {
    emit(AddressUpdateLoadingState());
    final result = await _addressRepo.updateAddress(
        addressId,
        AddressRequestModel(
            name: nameController.text,
            city: cityController.text,
            region: regionController.text,
            details: detailsController.text,
            notes: notesController.text,
            latitude: 20.0,
            longitude: 20.0));
    result.when(success: (response) {
      nameController.text =
          getAddressModel?.data?.getAllAddresses?[addressId].name ?? "";
      cityController.text =
          getAddressModel?.data?.getAllAddresses?[addressId].city ?? "";
      regionController.text =
          getAddressModel?.data?.getAllAddresses?[addressId].region ?? "";
      detailsController.text =
          getAddressModel?.data?.getAllAddresses?[addressId].details ?? "";
      notesController.text =
          getAddressModel?.data?.getAllAddresses?[addressId].notes ?? "";
      Navigator.of(context, rootNavigator: true)
          .pushReplacementNamed(Routes.allAddressesScreen);
      nameController.clear();
      cityController.clear();
      regionController.clear();
      detailsController.clear();
      notesController.clear();
      emit(AddressUpdateSuccessState());
    }, failure: (error) {
      emit(AddressUpdateFailureState(error));
    });
  }

  void deleteAddress(context, int addressId) async {
    final result = await _addressRepo.deleteAddress(addressId);
    result.when(success: (response) {
      Navigator.of(context, rootNavigator: true)
          .pushReplacementNamed(Routes.allAddressesScreen);
      emit(AddressDeleteSuccessState());
    }, failure: (error) {
      emit(AddressDeleteFailureState(error));
    });
  }
}
