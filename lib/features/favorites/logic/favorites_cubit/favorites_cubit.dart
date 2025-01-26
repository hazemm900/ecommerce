import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/features/cart/data/model/product_id_request_model.dart';
import 'package:ecommerce/features/favorites/data/model/favorites_model.dart';
import 'package:ecommerce/features/favorites/data/repo/favorites_repo.dart';
import 'package:ecommerce/features/favorites/logic/favorites_cubit/favorites_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit(this._favoritesRepo) : super(FavoritesInitial());

  final FavoritesRepo _favoritesRepo;

  FavoritesModel? favoritesModel;

  void getFavorites() async {
    emit(FavoritesLoadingState());
    final result = await _favoritesRepo.getFavorites();
    result.when(success: (response) {
      favoritesModel = response;
      emit(FavoritesSuccessState());
    }, failure: (error) {
      emit(FavoritesFailureState(error));
    });
  }

  void addOrRemoveFavoriteItem(context, int productId) async {
    emit(AddOrRemoveItemLoadingState());
    final result = await _favoritesRepo
        .addOrRemoveFavoriteItem(ProductIdRequestModel(productId: productId));
    result.when(success: (response) {
      // Navigator.of(context, rootNavigator: true)
      //     .pushReplacementNamed(Routes.cartScreen);
      getFavorites();
      Navigator.pop(context);
      emit(AddOrRemoveItemSuccessState());
    }, failure: (error) {
      emit(AddOrRemoveItemFailureState(error));
    });
  }

  void deleteItem(context, int productId) async {
    final result = await _favoritesRepo.deleteItem(productId);
    result.when(success: (response) {
      // Navigator.of(context, rootNavigator: true)
      //     .pushReplacementNamed(Routes.allAddressesScreen);
      getFavorites();
      Navigator.pushReplacementNamed(context, Routes.cartScreen);
      emit(DeleteItemFromCartSuccessState());
    }, failure: (error) {
      emit(DeleteItemFromCartFailureState(error));
    });
  }
}
