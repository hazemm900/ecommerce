import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/features/cart/data/model/get_cart_model.dart';
import 'package:ecommerce/features/cart/data/model/product_id_request_model.dart';
import 'package:ecommerce/features/cart/data/model/update_item_quantity_request_model.dart';
import 'package:ecommerce/features/cart/data/model/update_or_delete_cart_item_model.dart';
import 'package:ecommerce/features/cart/data/repo/carts_repo.dart';
import 'package:ecommerce/features/cart/logic/cart_cubit/carts_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartsCubit extends Cubit<CartsState> {
  CartsCubit(this._cartsRepo) : super(CartsInitial());

  // static CartsCubit get(context) => BlocProvider.of(context);
  final CartsRepo _cartsRepo;

  GetCartModel? getCartModel;
  UpdateOrDeleteCartItemModel? updateOrDeleteCartItemModel;
  TextEditingController quantityController = TextEditingController();

  void getAllCarts() async {
    emit(CartsLoadingState());
    final result = await _cartsRepo.getAllCarts();
    result.when(success: (response) {
      getCartModel = response;
      emit(CartsSuccessState());
    }, failure: (error) {
      emit(CartsFailureState(error));
    });
  }

  void addOrRemoveCartItem(context,int productId) async {
    emit(AddOrRemoveItemLoadingState());
    final result = await _cartsRepo.addOrRemoveCartItem(ProductIdRequestModel(productId: productId));
    result.when(success: (response) {
      // Navigator.of(context, rootNavigator: true)
      //     .pushReplacementNamed(Routes.cartScreen);
      getAllCarts();
      Navigator.pop(context);
      emit(AddOrRemoveItemSuccessState());
    }, failure: (error) {
      emit(AddOrRemoveItemFailureState(error));
    });
  }

  void updateItemQuantity(context, int productId, int quantity) async {
    emit(UpdateItemFromCartLoadingState());
    final result = await _cartsRepo.updateItemQuantity(productId,
        UpdateQuantityRequest(productId: productId, quantity: quantity));
    result.when(success: (response) {
      quantityController.text =
          updateOrDeleteCartItemModel?.data?.cart?.quantity.toString() ?? "";
      // Navigator.of(context, rootNavigator: true)
      //     .pushReplacementNamed(Routes.allAddressesScreen);
      Navigator.pushNamed(context, Routes.cartScreen);
      quantityController.clear();
      emit(UpdateItemFromCartSuccessState());
    }, failure: (error) {
      emit(UpdateItemFromCartFailureState(error));
    });
  }

  void deleteItem(context, int productId) async {
    final result = await _cartsRepo.deleteItem(productId);
    result.when(success: (response) {
      // Navigator.of(context, rootNavigator: true)
      //     .pushReplacementNamed(Routes.allAddressesScreen);
      getAllCarts();
      Navigator.pushReplacementNamed(context, Routes.cartScreen);
      emit(DeleteItemFromCartSuccessState());
    }, failure: (error) {
      emit(DeleteItemFromCartFailureState(error));
    });
  }
}
