import 'package:dio/dio.dart';
import 'package:ecommerce/core/networking/dio_factory.dart';
import 'package:ecommerce/features/address/data/apis/api_addresses.dart';
import 'package:ecommerce/features/address/data/repo/address_repo.dart';
import 'package:ecommerce/features/address/logic/address_cubit/address_cubit.dart';
import 'package:ecommerce/features/auth/data/apis/api_auth.dart';
import 'package:ecommerce/features/auth/data/repo/auth_repo.dart';
import 'package:ecommerce/features/auth/logic/auth_cubit/auth_cubit.dart';
import 'package:ecommerce/features/cart/data/apis/api_carts.dart';
import 'package:ecommerce/features/cart/data/repo/carts_repo.dart';
import 'package:ecommerce/features/cart/logic/cart_cubit/carts_cubit.dart';
import 'package:ecommerce/features/categories_products/data/api/api_categories.dart';
import 'package:ecommerce/features/categories_products/data/repo/categories_repo.dart';
import 'package:ecommerce/features/categories_products/logic/categories_cubit/categories_cubit.dart';
import 'package:ecommerce/features/faqs/data/apis/api_faqs.dart';
import 'package:ecommerce/features/faqs/data/repo/faqs_repo.dart';
import 'package:ecommerce/features/faqs/logic/faqs_cubit/faqs_cubit.dart';
import 'package:ecommerce/features/favorites/data/apis/api_favorites.dart';
import 'package:ecommerce/features/favorites/data/repo/favorites_repo.dart';
import 'package:ecommerce/features/favorites/logic/favorites_cubit/favorites_cubit.dart';
import 'package:ecommerce/features/home/data/apis/api_home.dart';
import 'package:ecommerce/features/home/data/repo/home_repo.dart';
import 'package:ecommerce/features/home/logic/home_cubit/home_cubit.dart';
import 'package:ecommerce/features/settings/data/api_settings/api_settings.dart';
import 'package:ecommerce/features/settings/data/repo/settings_repo.dart';
import 'package:ecommerce/features/settings/logic/setting_cubit/setting_cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // تسجيل Dio
  // الحصول على SharedPreferences وتسجيل SharedPrefHelper

  Dio dio = DioFactory.getDio();

  // ================ Auth ================ //
  getIt.registerFactory(() => AuthCubit(getIt()));

  getIt.registerLazySingleton(() => AuthRepo(getIt()));

  getIt.registerLazySingleton<AuthWebServices>(() => AuthWebServices(dio));

  // ================ Address ================ //
  getIt.registerLazySingleton(() => AddressCubit(getIt()));

  getIt.registerLazySingleton(() => AddressRepo(getIt()));

  getIt.registerLazySingleton<AddressWebServices>(() => AddressWebServices(dio));

  // ================ Settings ================ //
  getIt.registerFactory(() => SettingCubit(getIt()));

  getIt.registerLazySingleton(() => SettingsRepo(getIt()));

  getIt.registerLazySingleton<SettingsWebServices>(
      () => SettingsWebServices(dio));

  // ================ Categories ================ //
  getIt.registerLazySingleton(() => CategoriesCubit(getIt())..getCategories());

  getIt.registerLazySingleton(() => CategoriesRepo(getIt()));

  getIt.registerLazySingleton<CategoriesWebServices>(() => CategoriesWebServices(dio));

  // ================ Home ================ //
  getIt.registerLazySingleton(() => HomeCubit(getIt())..getHome());

  getIt.registerLazySingleton(() => HomeRepo(getIt()));

  getIt.registerLazySingleton<HomeWebServices>(() => HomeWebServices(dio));

  // ================ FAQS ================ //
  getIt.registerLazySingleton(() => FaqsCubit(getIt())); // 3amlha kda 3shan mfdlsh a3ml load ll data kol ma adkhol el page w m3aha bstkhdm el (bloc: getIt<HomeCubit>()..getHome(context), )

  getIt.registerLazySingleton(() => FaqsRepo(getIt()));

  getIt.registerLazySingleton<FaqsWebServices>(() => FaqsWebServices(dio));

  // ================ Carts ================ //
  getIt.registerLazySingleton(() => CartsCubit(getIt()));

  getIt.registerLazySingleton(() => CartsRepo(getIt()));

  getIt.registerLazySingleton<CartsWebServices>(() => CartsWebServices(dio));

  // ================ Favorites ================ //
  getIt.registerLazySingleton(() => FavoritesCubit(getIt()));

  getIt.registerLazySingleton(() => FavoritesRepo(getIt()));

  getIt.registerLazySingleton<FavoritesWebServices>(() => FavoritesWebServices(dio));

}
