import 'package:e_commerce_app/core/utils/service_locator.dart';
import 'package:e_commerce_app/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:e_commerce_app/features/home/data/repos/home_repo_implementation.dart';
// import 'package:e_commerce_app/features/home/presentation/view/home_page.dart';
import 'package:e_commerce_app/features/home/presentation/view_model/get_categories_cubit/get_categories_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/view_model/get_products/get_products_cubit.dart';
import 'package:e_commerce_app/features/splash/presentation/view/splash_page.dart';
import 'package:e_commerce_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
	options: DefaultFirebaseOptions.currentPlatform,
);
  setUpServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              GetCategoriesCubit(getIt.get<HomeRepoImplementation>())..getCategories(),
        ),
        BlocProvider(
          create: (context) =>
              GetProductsCubit(getIt.get<HomeRepoImplementation>()),
        ),
        BlocProvider(
          create: (context) => AuthCubit() ,)
      ],
      child: MaterialApp(
        theme: ThemeData(
          // scaffoldBackgroundColor: AppColors.backgroundColor2,
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
      ),
    );
  }
}
