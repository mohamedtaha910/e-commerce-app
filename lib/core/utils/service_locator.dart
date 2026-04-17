import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/utils/api_services.dart';
import 'package:e_commerce_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
	
void setUpServiceLocator() {
	getIt.registerSingleton<ApiService>(ApiService(Dio()));
	
	getIt.registerSingleton<HomeRepoImplementation>(
		HomeRepoImplementation(apiService: getIt.get<ApiService>()),
	);
}