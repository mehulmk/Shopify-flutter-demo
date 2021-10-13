import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopify/core/app_routes.dart';
import 'package:shopify/core/app_theme.dart';
import 'package:shopify/data/network/api_client.dart';
import 'package:shopify/data/sharedpref/shared_preference_helper.dart';
import 'package:shopify/data/repository/api_repository.dart';

final sharedPreferences =
    FutureProvider((_) async => await SharedPreferences.getInstance());

final sharedPreferencesHelper = Provider(
    (ref) => SharedPreferencesHelper(ref.watch(sharedPreferences).maybeWhen(
          data: (value) => value,
          orElse: () => null,
        )));

final apiService =
    Provider((ref) => ApiService(ref.read(sharedPreferencesHelper)));

final apiRepository = Provider((ref) => ApiRepository(
    apiService: ref.read(apiService),
    preferencesHelper: ref.read(sharedPreferencesHelper)));

main()  {
  runApp(
    const ProviderScope(
      // overrides: [],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopify',
      theme: ThemeController.lightTheme(),
      initialRoute: AppRoutes.main,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
