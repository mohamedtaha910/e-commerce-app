import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/utils/api_services.dart';
import 'package:e_commerce_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:e_commerce_app/features/home/presentation/view/home_page.dart';
import 'package:e_commerce_app/features/home/presentation/view_model/get_categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetCategoriesCubit(
            HomeRepoImplementation(apiService: ApiService(Dio())),
          ),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          // scaffoldBackgroundColor: AppColors.backgroundColor2,
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
