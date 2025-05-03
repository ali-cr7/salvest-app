import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:salvest_app/data/services/auth%20services/auth_repo_impl.dart';
import 'package:salvest_app/data/services/help%20services/help_repo_impl.dart';
import 'package:salvest_app/data/services/property%20service/sale_property_repo_impl.dart';
import 'package:salvest_app/data/services/wallet%20services/wallet_services_repo_impl.dart';
import 'package:salvest_app/utility/api_config/api_config.dart';
import 'package:salvest_app/utility/api_config/api_service.dart';
final GetIt getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(
        BaseOptions(
          baseUrl: APIConfig.baseUrl,
          sendTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 30),
          connectTimeout: const Duration(seconds: 30),
          receiveDataWhenStatusError: true,
          maxRedirects: 5,
        ),
      ),
    ),
  );
  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
    getIt.registerSingleton<SalePropertyRepoImpl>(
    SalePropertyRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

    getIt.registerSingleton<HelpRepoImpl>(
    HelpRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
   getIt.registerSingleton<WalletServicesRepoImpl>(
    WalletServicesRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

}
